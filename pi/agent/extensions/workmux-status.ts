/**
 * Workmux status tracking extension for pi.
 *
 * Reports agent status to workmux for tmux window status display.
 * See: https://workmux.raine.dev/guide/status-tracking
 */

import type { ExtensionAPI, ExtensionContext } from "@earendil-works/pi-coding-agent";

type AssistantState = { stopReason?: string; errorMessage?: string };

export default function (pi: ExtensionAPI) {
  let sessionActive = false;
  let parentWorking = false;
  let activeCount: number | undefined;
  let unsubscribe: (() => void) | undefined;
  let writes = Promise.resolve();
  let lastStatus: string | undefined;

  function setStatus(status: string) {
    const deduplicate = activeCount !== undefined;
    // Event bus callbacks are not awaited by pi. Serialize external writes so an
    // older command cannot finish after a newer status and overwrite it.
    writes = writes.then(async () => {
      if (deduplicate && status === lastStatus) return;
      try {
        const result = await pi.exec("workmux", ["set-window-status", status]);
        lastStatus = result.code === 0 ? status : undefined;
      } catch {
        lastStatus = undefined;
      }
    });
    return writes;
  }

  function reportActivity() {
    return setStatus(parentWorking || (activeCount ?? 0) > 0 ? "working" : "done");
  }

  function latestAssistantWasAborted(ctx: ExtensionContext) {
    const branch = ctx.sessionManager.getBranch() as Array<{
      type?: string;
      message?: AssistantState & { role?: string };
    }>;
    for (let index = branch.length - 1; index >= 0; index--) {
      const entry = branch[index];
      if (entry?.type !== "message" || entry.message?.role !== "assistant") {
        continue;
      }
      return (
        entry.message.stopReason === "aborted" ||
        (entry.message.stopReason === "error" &&
          /\boperation was aborted\b/i.test(entry.message.errorMessage ?? ""))
      );
    }
    return false;
  }

  pi.on("session_start", async (_event, ctx) => {
    unsubscribe?.();
    sessionActive = false;
    await writes;
    activeCount = undefined;
    lastStatus = undefined;
    parentWorking = !ctx.isIdle();
    await pi.exec("workmux", ["register-agent"]).catch(() => {});
    sessionActive = true;
    unsubscribe = pi.events.on("suba:activity", (data) => {
      if (!sessionActive || !data || typeof data !== "object") return;
      const count = (data as { activeCount?: unknown }).activeCount;
      if (typeof count !== "number" || !Number.isSafeInteger(count) || count < 0) return;
      activeCount = count;
      return reportActivity();
    });
    // The publisher may have restored children before this handler subscribed.
    pi.events.emit("suba:activity:request", {});
    await writes;
  });

  pi.on("agent_start", async () => {
    if (!sessionActive) return;
    parentWorking = true;
    await setStatus("working");
  });

  pi.on("agent_settled", async (_event, ctx) => {
    if (!sessionActive) return;
    parentWorking = !ctx.isIdle();
    if (activeCount !== undefined) {
      await reportActivity();
    } else if (!latestAssistantWasAborted(ctx)) {
      await setStatus("done");
    }
  });

  pi.on("session_shutdown", async () => {
    unsubscribe?.();
    unsubscribe = undefined;
    const wasActive = sessionActive;
    sessionActive = false;
    if (wasActive && activeCount !== undefined) await setStatus("done");
    await writes;
  });
}
