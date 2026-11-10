# PassShortcutCommand

Shortcut subcommands cho [pass](https://www.passwordstore.org/) (password-store), ví dụ `pass g` thay cho `pass generate`.

## Shortcut

| Shortcut | Lệnh gốc |
|---|---|
| `pass i` | `init` |
| `pass l` | `ls` |
| `pass s` | `show` |
| `pass f` | `find` |
| `pass gr` | `grep` |
| `pass a` | `insert` (add) |
| `pass e` | `edit` |
| `pass g` | `generate` |
| `pass r` | `rm` |
| `pass m` | `mv` |
| `pass c` | `cp` |

Mỗi shortcut là một extension nhỏ gọi lại hàm `cmd_*` có sẵn của pass, nên option giữ nguyên như lệnh gốc.

## Cài đặt

### Cho user hiện tại

```bash
./install.sh
```

Các file được ghi vào `~/.password-store/.extensions/` (hoặc `$PASSWORD_STORE_EXTENSIONS_DIR` nếu có đặt). Sau đó bật extension trong `~/.zshrc` hoặc `~/.bashrc`:

```bash
export PASSWORD_STORE_ENABLE_EXTENSIONS=true
```

### Cho toàn hệ thống

```bash
sudo PASSWORD_STORE_EXTENSIONS_DIR=/usr/lib/password-store/extensions ./install.sh
```

Thư mục hệ thống luôn được pass đọc, không cần `PASSWORD_STORE_ENABLE_EXTENSIONS`.

## Tuỳ chỉnh

Sửa mảng `SHORTCUTS` ở đầu `install.sh` (định dạng `shortcut:lệnh`) rồi chạy lại script.

## Lưu ý

- Shortcut chiếm tên entry: `pass g` sẽ không hiển thị entry tên `g`; dùng `pass show g` để xem.
- Pass tìm extension ở thư mục người dùng trước, sau đó đến thư mục hệ thống.
