#!/usr/bin/env bash
set -euo pipefail

ROOT=$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)
TMP=$(mktemp -d)
trap 'rm -rf "$TMP"' EXIT
mkdir -p "$TMP/bin" "$TMP/home/.local/share/applications" "$TMP/home/.local/share/omarchy/install"

cat > "$TMP/bin/pacman" <<'EOF'
#!/usr/bin/env bash
case "${1:-}" in
  -Qeq|-Qtdq) exit 0 ;;
  *) exit 0 ;;
esac
EOF
cat > "$TMP/bin/gum" <<'EOF'
#!/usr/bin/env bash
case "${1:-}" in
  style) shift; printf '%s\n' "$@" ;;
  choose) printf '%s\n' 'Quit' ;;
  *) exit 0 ;;
esac
EOF
chmod +x "$TMP/bin/pacman" "$TMP/bin/gum"

cat > "$TMP/home/.local/share/applications/ChatGPT.desktop" <<'EOF'
[Desktop Entry]
Name=ChatGPT
Exec=omarchy-launch-webapp https://chatgpt.com/
EOF

out=$(HOME="$TMP/home" XDG_DATA_HOME="$TMP/home/.local/share" PATH="$TMP/bin:$PATH" OMARCHY_AUDIT_LANG=en "$ROOT/bin/omarchy-audit")
printf '%s\n' "$out" | grep -Fq 'Web apps'
printf '%s\n' "$out" | grep -Fq '1 browser shortcuts'
