#!/bin/bash

# Checking if the database initializer exists
echo "Checking if the database initializer exists"
if [ ! -f ./db/initializer.php ]; then
  echo "File not found: ./db/initializer.php"
  exit 1
fi

# Check for environment variables
echo "Checking for environment variables"
if [ -z "$MYSQL_USER" ] || [ -z "$MYSQL_PASSWORD" ] || [ -z "$MYSQL_PORT" ] || [ -z "$MYSQL_HOST" ] || [ -z "$MYSQL_DATABASE" ]; then
  echo "Environment variables were loaded incorrectly"
  exit 1
fi

# Initialize the database
echo "Initializing the database"
php ./db/initializer.php
php_exit_status=$?

# Check if php command failed (exit status 1)
if [ $php_exit_status -eq 1 ]; then
  echo "Database initialization failed, aborting..."
  exit 1
fi

# Start Apache server
echo "Starting Apache server"
apache2-foreground # or any command to start your server
