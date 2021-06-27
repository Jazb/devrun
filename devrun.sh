case "$(basename "$(ps -p $$ | awk 'NR > 1 { sub(/^-/, "", $4); print $4 }')")" in
  zsh)  __devrun_source_dir="$(dirname "$0:A")" ;;
  bash) __devrun_source_dir="$(builtin cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)" ;;
  *) echo "unsupported shell" >&2 ; return 1 ;;
esac

devrun() {
  local tmp ret finalizer

  tmp="$(mktemp -u)"
  exec 9>"${tmp}"
  exec 8<"${tmp}"
  rm -f "${tmp}"

  "${__devrun_source_dir}/exe/devrun" "$@"
  ret=$?

  while read -r finalizer; do
    case "${finalizer}" in
      chdir:*) cd "${finalizer//chdir:/}" ;;
      *) ;;
    esac
  done <&8

  exec 8<&-
  exec 9<&-

  return ${ret}
}