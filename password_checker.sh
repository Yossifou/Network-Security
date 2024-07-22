#!/bin/bash

read -sp "Please enter a password: " password
echo
	if [[ $password =~ ^(.{0,9})$ ]]; then
		echo "Password must be at least 10 characters."
		echo
		exit 1
	fi

        if [[ $password =~ ^([^0-9]*|[^A-Z]*|[^a-z]*|[^[:punct:]]*)$ ]]; then
                if [[ $password =~ ^([^0-9]*)$ ]]; then
                        echo "Password is weak: it should contain at least one number."
                elif [[ $password =~ ^([^A-Z]*)$ ]]; then
                        echo "Password is weak: it should contain at least one uppercase letter."
                elif [[ $password =~ ^([^a-z]*)$ ]]; then
                        echo "Password is weak: it should contain at least one lowercase letter."
                elif [[ $password =~ ^([^[:punct:]]*)$ ]]; then
                        echo "Password is weak: it should contain at least one special character."
                fi
        else
		echo "Password is strong."
	fi
echo
exit 0

