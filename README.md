# Securi For Wordpress 1.0

Script bảo mật cho Worpress

Chức năng:

1. Tự động tìm kiếm tất cả mã nguồn WP trên VPS và tối ưu bảo mật cho nó.

2. Backup 2 file wp-config.php và wp-login.php trước khi chỉnh sửa.

3. Bắt đầu chỉnh sửa wp-config.php
a Không cho edit Theme + Plugin
b Tắt chức năng cài đặt upload Theme + Plugin.
c Bật chức năng tự động Update Mã nguồn
d Bật chức năng tự động Update Plugin.
e Tắt chức năng Debug và hiển thị Debug.
f Tắt thanh admin bar.

4. Bắt đầu chỉnh sửa wp-login.php
Thêm đăng nhập User+Pass cho trang Wp-admin + Wp-login.php.

5. Xóa tất cả file có tên readme, changelog, history, license.

6. Chmod 400 wp-config.php

7. Chmod 400 nginx.conf
