#!/usr/bin/env bash
# Cài các shortcut subcommand cho `pass` dưới dạng extension.
# Mỗi extension là 1 file <tên>.bash được `pass` source, nên gọi trực tiếp
# các hàm cmd_* có sẵn của pass.
set -euo pipefail

EXT_DIR="${PASSWORD_STORE_EXTENSIONS_DIR:-${PASSWORD_STORE_DIR:-$HOME/.password-store}/.extensions}"
mkdir -p "$EXT_DIR"

# shortcut:lệnh gọi trong pass
SHORTCUTS=(
	"i:cmd_init"
	"l:cmd_show"                # ls / list
	"s:cmd_show"
	"f:cmd_find"                # find / search
	"gr:cmd_grep"
	"a:cmd_insert"              # add / insert
	"e:cmd_edit"
	"g:cmd_generate"
	"r:cmd_delete"              # rm / delete
	"m:cmd_copy_move move"
	"c:cmd_copy_move copy"
)

for item in "${SHORTCUTS[@]}"; do
	name="${item%%:*}"
	call="${item#*:}"
	file="$EXT_DIR/$name.bash"
	printf '#!/usr/bin/env bash\n%s "$@"\n' "$call" > "$file"
	chmod 755 "$file"
	echo "installed: pass $name -> $call"
done

cat <<EOF

Xong. Bật extensions bằng cách thêm vào ~/.zshrc (hoặc ~/.bashrc):

  export PASSWORD_STORE_ENABLE_EXTENSIONS=true
EOF
