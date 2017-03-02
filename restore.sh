#!/bin/bash
	echo "Starting Restore source for All..."
	day=02-03-2017
	cd /var/backups/$day
	find . -name "*.zip" | grep -oP "(?<=.).*/" | while read filename; do mkdir "/var/backups/"$day$filename"log/"; done;
	yes | cp -rf /var/backups/$day/* /home/nginx/domains/
	yes | cp -rf /var/backups/$day/conf/* /usr/local/nginx/conf/
	cd /home/nginx/domains
	find . -name "*.zip" | while read filename; do unzip -o -d "`dirname "$filename"`" "$filename"; done;
	find . -cdname *source.zip -exec rm -rf {} \;
	
	echo "Starting Restore database for All..."
	gunzip *.sql.gz
	passdata=`grep -oP "(?<=password=).*" ~/.my.cnf`
	mysql -u root -p$passdata < *.sql
	find . -name "*database.sql" -exec rm -rf {} \;
	find . -name "*database.sql.gz" -exec rm -rf {} \;
	service nginx restart
