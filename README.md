# Securi For Wordpress 2.0

I> Function

Backup Database + Source code. ==> /var/backups/
Backup wp-config.php ==> wp-config.php.tdt.
Can't edit Theme + Plugin.
Disanble install, upload themes + plugins. 
Auto update Wordpress
Auto update Plugin
Disanble show Debug
Add sign in two step (domain.com/wp-login.php)
Delete all file with name readme, changelog, history, license...
Creating file index.html on all folder.
Chmod 444 wp-config.php
Chmod 444 nginx.conf
Edit file robots.txt (add line Disallow: /wp-content/themes/*, Disallow: /wp-content/plugin/*)

II> Tutorials

wget https://github.com/tangduongtrieu/securi-for-wp/raw/master/securi.sh
chmod 755 securi.sh
/root/securi.sh
Enter "user + pass" and "password of mysql root"

Website:
http://tangduongtrieu.com/huong-dan-cach-bao-mat-website-wordpress/
