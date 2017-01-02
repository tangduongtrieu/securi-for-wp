# Securi For Wordpress 2.0

Script bảo mật cho Worpress cho VPS Linux

I> Chức năng:

1. Backup Database + Source code.
2. Backup file wp-config.php
3. Bắt đầu chỉnh sửa wp-config.php
(Không cho edit Theme + Plugin, Tắt chức năng cài đặt upload Theme + Plugin, Bật chức năng tự động Update Mã nguồn, Bật chức năng tự động Update Plugin, Tắt chức năng Debug và hiển thị Debug, Tắt thanh admin bar.)
4. Thêm đăng nhập 2 bước cho Wordpress
5. Xóa tất cả file có tên readme, changelog, history, license...
6. Chmod 444 wp-config.php
7. Chmod 444 nginx.conf
8. Chỉnh sửa file robots.txt

II> Hướng dẫn sử dụng

-wget về hoặc copy file securi.sh đến VPS.
wget https://github.com/tangduongtrieu/securi-for-wp/raw/master/securi.sh
-Sửa $sqlpass là mật khẩu của root mysql
nano securi.sh
-Cấp quyền 777 cho file securi.sh
chmod 777 securi.sh
-Chạy script
/root/securi.sh


done!

Video demo

https://www.youtube.com/watch?v=v_H6R68hkBM

Bài hướng dẫn cụ thể:

http://tangduongtrieu.com/huong-dan-cach-bao-mat-website-wordpress/
