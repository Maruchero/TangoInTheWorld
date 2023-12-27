<?php

use Idearia\Logger;

require_once __DIR__ . "/../Logger.php";

Logger::$write_log = true;
Logger::$log_dir = __DIR__ . '/../logs';
Logger::$log_file_name = date("YmdHis") . "initializer";
Logger::$log_file_extension = 'log';
Logger::$log_level = 'debug';

Logger::time();
Logger::info("Execution started");

# Loading env variables
Logger::info("Getting environment variables");
$host = $_ENV["MYSQL_HOST"];
$port = $_ENV["MYSQL_PORT"];
$user = $_ENV["MYSQL_USER"];
$password = $_ENV["MYSQL_PASSWORD"];
$db = $_ENV["MYSQL_DATABASE"];

# Connecting to database
Logger::info("Connecting to database");
try {
  $conn = new mysqli($host, $user, $password, $db, $port);
} catch (mysqli_sql_exception $e) {
  Logger::error("Connection failed: " . $e->getMessage());
  exit(1);
}
Logger::info("Connected successfully");

# Get the list of schema files
Logger::info("Getting list of schema files");
$dir = __DIR__ . "/schemas";
$schema_files = glob($dir . "/*.sql");
Logger::debug("Schema files: " . print_r($schema_files, true));

# Get the list of data files
Logger::info("Getting list of data files");
$dir = __DIR__ . "/data";
$data_files = glob($dir . "/*.sql");
Logger::debug("Data files: " . print_r($data_files, true));

# Core phase
try {
  Logger::info("Cleaning tables");
  $tables = $conn->query("SHOW TABLES")->fetch_all(MYSQLI_NUM);
  foreach ($tables as $table) {
    $conn->query("DROP TABLE " . $table[0]);
  }
  Logger::info("Tables cleaned");

  Logger::time("database-schema-creation");
  Logger::info("Creating database schema");
  foreach ($schema_files as $schema_file) {
    $sql = file_get_contents($schema_file);
    $conn->multi_query($sql);
    while ($conn->more_results()) $conn->next_result();
  }
  Logger::info("Database schema created");
  Logger::timeEnd("database-schema-creation");

  Logger::time("mock-data-creation");
  Logger::info("Creating mock data");
  foreach ($data_files as $data_file) {
    $sql = file_get_contents($data_file);
    if ($sql) {
      $conn->multi_query($sql);
    }
  }
  Logger::timeEnd("mock-data-creation");
} catch (mysqli_sql_exception $e) {
  Logger::error("Error during core phase: " . $e->getMessage());
  exit(1);
} finally {
  $conn->close();
}

Logger::info("Execution ended");
Logger::timeEnd();
