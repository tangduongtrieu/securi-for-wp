#!/bin/bash
	echo "Starting Restore source for All..."
	day=02-03-2017
	cd /var/backups/$day
	
	cp -rf /var/backups/$day/* /home/nginx/domains/
	cp -rf /var/backups/$day/conf/* /usr/local/nginx/conf/
	cd /home/nginx/domains
	unzip -o '*.zip'
	gunzip '*.sql.gz'
	
	find . -name "$day*.zip" -exec rm -rf {} \;
	
	passdata=`grep -oP "(?<=password=).*" ~/.my.cnf`
	mysql -u root -p$passdata < *.sql
	find . -name "$day*.sql" -exec rm -rf {} \;
	rm -rf conf
	service nginx restart
