# Securi For Wordpress

Script bảo mật cho Worpress 1.0

Chức năng:

1. Tự động tìm kiếm tất cả mã nguồn WP trên VPS và tối ưu bảo mật cho nó.
2. Backup 2 file wp-config.php và wp-login.php trước khi chỉnh sửa.
3. Bắt đầu chỉnh sửa wp-config.php
- Không cho edit Theme + Plugin
- Tắt chức năng cài đặt upload Theme + Plugin.
- Bật chức năng tự động Update Mã nguồn
- Bật chức năng tự động Update Plugin.
- Tắt chức năng Debug và hiển thị Debug.
- Tắt thanh admin bar.
4. Bắt đầu chỉnh sửa wp-login.php
- Thêm đăng nhập User+Pass cho trang Wp-admin + Wp-login.php.
5. Xóa tất cả file có tên readme, changelog, history, license.
6. Chmod 400 wp-config.php
7. Chmod 400 nginx.conf
