#!/bin/bash
	echo "Starting Restore source for All..."
	day=02-03-2017
	cd /var/backups/$day
	
	cp -rf /var/backups/$day/* /home/nginx/domains/
	cp -rf /var/backups/$day/conf/* /usr/local/nginx/conf/
	cd /home/nginx/domains
	unzip *.zip
	gunzip *.sql.gz
	
	find . -cdname $day_*.zip -exec rm -rf {} \;
	find . -cdname $day_*.gzip -exec rm -rf {} \;
	
	passdata=`grep -oP "(?<=password=).*" ~/.my.cnf`
	mysql -u root -p$passdata < *.sql
	find . -cdname $day_*.zip -exec rm -rf {} \;
	find . -cdname $day_*.sql -exec rm -rf {} \;
	
	service nginx restart
