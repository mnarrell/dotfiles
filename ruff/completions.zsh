_uv_run_mod() {
  if [[ "$words[2]" == "run" && "$words[CURRENT]" != -* ]]; then
    _arguments '*:filename:_files'
  else
    _uv "$@"
  fi
}
compdef _uv_run_mod uv

_uvx_run_mod() {
  if [[ "$words[CURRENT]" != -* ]]; then
    _arguments '*:filename:_files'
  else
    _uvx "$@"
  fi
}
compdef _uvx_run_mod uvx
