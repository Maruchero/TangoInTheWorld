<?php

$script_path = dirname(__FILE__);
require_once __DIR__ . "/logger.php";

$log = get_logger("Initializer");

$log("Execution started");

# Loading env variables
$log("Getting environment variables");
$host = $_ENV["MYSQL_HOST"];
$port = $_ENV["MYSQL_PORT"];
$user = $_ENV["MYSQL_USER"];
$password = $_ENV["MYSQL_PASSWORD"];
$db = $_ENV["MYSQL_DATABASE"];

# Connecting to database
$log("Connecting to database");
try {
$conn = new mysqli($host, $user, $password, $db, $port);
} catch (mysqli_sql_exception $e) {
  $log("Connection failed: " . $e->getMessage());
  exit(1);
}
$log("Connected successfully");

# Get the list of schema files
$log("Getting list of schema files");
$dir = __DIR__ . "/../db/";
$schema_files = glob($dir . "*.sql");
$log("Schema files: " . print_r($schema_files, true));

# Core phase
try {
} finally {
  $conn = null;
}

$log("Execution ended");
