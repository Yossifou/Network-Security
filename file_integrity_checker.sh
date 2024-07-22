#/bin/bash

read -p "Please enter the full path to the file you want to monitor: " file
	 while [[ $file =~ ^(.{0})$ ]]; do
		echo "You must enter at least one character."
		read -p "Please enter the full path to the file you want to monitor: " file
	done
read -p "Please enter the interval, in seconds, to check for changes: " seconds 
	while [[ $seconds =~ ^([^0-9]*)$ ]]; do
		echo "You must enter a number of seconds."
		read -p "Please enter the interval, in seconds, to check for changes: " seconds
	done
read -p "Please enter the full path to the output file: " output_file
	while [[ $output_file =~ ^(.{0})$ ]]; do
		echo "You must enter at least one character."
		read -p "Please enter the full path to the output file: " output_file
	done

md5sum $file > $output_file
	if [ $? -gt 0 ]; then
		exit 1
	fi
md5sum -c $output_file

	while [ $? -eq 0 ]; do
		sleep $seconds
		md5sum -c $output_file
	done

echo "Changes detected in $file at $(date +%d/%m/%Y-%H:%M:%S)."
echo


exit 0
