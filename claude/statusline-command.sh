#!/usr/bin/env bash
input=$(cat)

model=$(echo "$input" | jq -r '.model.display_name // "?"')
effort=$(echo "$input" | jq -r '.effort.level // empty')
total_tokens=$(echo "$input" | jq -r '.context_window.total_input_tokens // empty')
ctx_size=$(echo "$input" | jq -r '.context_window.context_window_size // empty')
used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')
five_hour=$(echo "$input" | jq -r '.rate_limits.five_hour.used_percentage // empty')
seven_day=$(echo "$input" | jq -r '.rate_limits.seven_day.used_percentage // empty')

# renders a compact bar graph, e.g. [####------]
bar() {
  local pct="$1" width=10
  local filled
  filled=$(awk "BEGIN { f = int(($pct * $width / 100) + 0.5); if (f > $width) f = $width; print f }")
  local empty=$((width - filled))
  printf '['
  printf '%0.s#' $(seq 1 "$filled") 2>/dev/null
  printf '%0.s-' $(seq 1 "$empty") 2>/dev/null
  printf ']'
}

# model + effort (yellow)
printf '\033[0;33m%s' "$model"
[ -n "$effort" ] && printf '/%s' "$effort"
printf '\033[0m'

# context window size and percentage used (magenta), only when available
if [ -n "$total_tokens" ] && [ -n "$used_pct" ]; then
  ktokens=$(awk "BEGIN { printf \"%.1fk\", $total_tokens / 1000 }")
  used_pct_int=$(printf '%.0f' "$used_pct")
  if [ -n "$ctx_size" ]; then
    kctx=$(awk "BEGIN { printf \"%.0fk\", $ctx_size / 1000 }")
    printf ' \033[0;35m%s/%s (%d%%)\033[0m' "$ktokens" "$kctx" "$used_pct_int"
  else
    printf ' \033[0;35m%s (%d%%)\033[0m' "$ktokens" "$used_pct_int"
  fi
fi

# subscription usage bar graphs (cyan), only when available
if [ -n "$five_hour" ]; then
  five_int=$(printf '%.0f' "$five_hour")
  printf ' \033[0;36m5h %s %d%%\033[0m' "$(bar "$five_hour")" "$five_int"
fi
if [ -n "$seven_day" ]; then
  week_int=$(printf '%.0f' "$seven_day")
  printf ' \033[0;36m7d %s %d%%\033[0m' "$(bar "$seven_day")" "$week_int"
fi
