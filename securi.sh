# Chuyển đến thư mục gốc của VPS
cd ~

# Tạo biến đăng nhập 2 bước với WP.
user="admin"
pass="admin"

# Loại trừ tên miền bên dưới.
# Phù hợp với thư mục gốc có dạng: /home/nginx/domains/tangduongtrieu.com/public)
loaitru="tangduongtrieu.com"

#Grep đường dẫn đến tất cả Website có mã nguồn Wordpress.
site=`find / -name wp-config.php | sed 's/wp-config.php.*//' | grep -Ev "$loaitru"`

# Vòng lặp for để chạy những câu lệnh bên dưới, cho tất cả Website mã nguồn WP.
for si in $site; do
{
# Chuyển đến thư mục của Website.(Ví dụ: /home/nginx/domains/tangduongtrieu.com/public)
cd $si
echo "Đang tùy chỉnh cho" $si
# Backup File wp-config.php + wp-login.php
if [[ -n $(find ./ -name "wp-config.php.tdt" -o -name "wp-login.php.tdt") ]]
then
	echo "  Đã tồn tại file backup"
else
	echo "  Bắt đầu tạo file dự phòng"
	cp -r wp-config.php wp-config.php.tdt
	echo "   wp-config.php.tdt ==>> done"
	chmod +400 wp-config.php.tdt
	cp -r wp-login.php wp-login.php.tdt
	echo "   wp-login.php.tdt ==>> done"
	chmod +400 wp-login.php.tdt
fi

echo "  Tùy chỉnh wp-config.php"

# Không cho edit Theme + Plugin
sed -i '/DISALLOW_FILE_EDIT/d' wp-config.php
sed -i '/<?php/a define("DISALLOW_FILE_EDIT",true );' wp-config.php

# Tắt cài đặt upload Theme + Plugin.
sed -i '/DISALLOW_FILE_MODS/d' wp-config.php
#sed -i '/<?php/a define("DISALLOW_FILE_MODS",true);' wp-config.php

# Bật chức năng tự động Update Mã nguồn
sed -i '/WP_AUTO_UPDATE_CORE/d' wp-config.php
sed -i '/<?php/a define("WP_AUTO_UPDATE_CORE",true);' wp-config.php

# Tắt chức năng Update
sed -i '/AUTOMATIC_UPDATER_DISABLED/d' wp-config.php
#sed -i '/<?php/a define ("AUTOMATIC_UPDATER_DISABLED", true);' wp-config.php

# Bật chức năng tự động Update Plugin.
sed -i '/auto_update_plugin/d' wp-config.php
echo 'add_filter ("auto_update_plugin", "__return_true");' >> wp-config.php

# Bật chức năng tự động Update Theme.
sed -i '/auto_update_theme/d' wp-config.php
#echo 'add_filter ("auto_update_theme", "__return_true");' >> wp-config.php

# Tắt chức năng Debug và hiển thị Debug.
sed -i '/WP_DEBUG/d' wp-config.php
sed -i '/<?php/a define("WP_DEBUG",false);' wp-config.php
sed -i '/<?php/a define("WP_DEBUG_DISPLAY",false);' wp-config.php

# Tắt thanh admin bar.
sed -i '/show_admin_bar/d' wp-config.php 
#echo 'add_filter("show_admin_bar", "__return_false");' >> wp-config.php

echo "  Tùy chỉnh wp-login.php"

# Thêm đăng nhập User+Pass cho trang Wp-admin + Wp-login.php.
sed -i '/Access Denied!!!/d' wp-login.php
sed -i '/require( dirname/i \$config["user"] = "'$user'"; \$config["pass"] = "'$pass'"; if (\$_SERVER["PHP_AUTH_USER"] != \$config["user"] || \$_SERVER["PHP_AUTH_PW"] != \$config["pass"]){header("WWW-Authenticate: Basic realm=DangNhap");header("HTTP/1.0 401 Unauthorized"); echo "<center>Access Denied!!!</center>";exit;}' wp-login.php

echo "  Tạo thêm index.html cho tất cả Folder"
# Tạo thêm file index.html trong tất cả các thư mục con của wp-content.
find ./wp-content/ -type d -exec touch {}/index.html \;

echo "  Xóa tất cả file có tên readme, changelog, history, license"
# Xóa tất cả file readme changelog history... trong tất cả thư mục  của WP.
find ./ \( -name readme.txt -o -name readme.html -o -name readme.htm -o -name license.txt -o -name history.txt -o -name changelog.txt -o -name changelog.html \) -exec rm -rf {} \;

echo "  chmod 444 wp-config.php"
# Chmod 444 cho wp-config.php.
chmod 444 wp-config.php

echo "  chmod 444 nginx.conf"
# Chmod 444 cho nginx.conf.
chmod 444 nginx.conf

# Chmod 444 cho .htaccess.
#chmod 444 .htaccess
echo " "
}
done
# Nguồn: tangduongtrieu.com
