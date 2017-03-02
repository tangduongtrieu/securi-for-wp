#!/bin/bash
	echo "Starting Restore source for All..."
	day=02-03-2017
	cd /var/backups/$day
	
	cp -rf /var/backups/$day/* /home/nginx/domains/
	cp -rf /var/backups/$day/conf/* /usr/local/nginx/conf/
	cd /home/nginx/domains
	unzip -o '*.zip'	
	gunzip *.gz
	cat *.sql > all.sql
	
	
	passdata=`grep -oP "(?<=password=).*" ~/.my.cnf`
	mysql -u root -p$passdata < all.sql

	find . -name "$day*.sql" -exec rm -rf {} \;
	mv -f /home/nginx/domains/home/nginx/domains/* /home/nginx/domains/
	rm -rf /home/nginx/domains/home
	rm -rf conf
	find . -name "$day*.zip" -exec rm -rf {} \;
	service nginx restart
