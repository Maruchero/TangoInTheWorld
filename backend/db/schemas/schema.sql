/*******************************************************************************
 * TABLES
 ******************************************************************************/
CREATE TABLE
    IF NOT EXISTS config(
        `id` INT PRIMARY KEY AUTO_INCREMENT,
        `key` VARCHAR(64) NOT NULL,
        `value` VARCHAR(255) NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS users(
        `email` VARCHAR(128) PRIMARY KEY,
        `password` VARCHAR(256) NOT NULL,
        `salt` CHAR(16) NOT NULL,
        `first_name` VARCHAR(64) NOT NULL,
        `last_name` VARCHAR(64) NOT NULL,
        `phone` VARCHAR(15) NOT NULL,
        `profile_picture` VARCHAR(256) NOT NULL,
        `organization` VARCHAR(64),
        `website` VARCHAR(256),
        `permissions` VARCHAR(32),
        `default_language` CHAR(2)
    );

CREATE TABLE
    IF NOT EXISTS sessions(
        `id` VARCHAR(64) PRIMARY KEY,
        `email` VARCHAR(128) NOT NULL,
        `issued_at` DATETIME NOT NULL,
        `expires_at` DATETIME NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS events(
        `id` INT PRIMARY KEY AUTO_INCREMENT,
        `description` TEXT(300),
        `picture` VARCHAR(256) NOT NULL,
        `type` VARCHAR(16) NOT NULL,
        `begin_timestamp` DATETIME NOT NULL,
        `end_timestamp` DATETIME,
        `email` VARCHAR(128) NOT NULL,
        `website` VARCHAR(256),
        `country` VARCHAR(64) NOT NULL,
        `city` VARCHAR(64) NOT NULL,
        `address` VARCHAR(128) NOT NULL,
        `maps` VARCHAR(512),
        `user` VARCHAR(128) NOT NULL
    );

CREATE TABLE
    IF NOT EXISTS translations(
        `id` INT PRIMARY KEY AUTO_INCREMENT,
        `language` CHAR(2) NOT NULL,
        `domain` VARCHAR(32) NOT NULL,
        `key` VARCHAR(32) NOT NULL,
        `text` VARCHAR(256) NOT NULL
    );

/*******************************************************************************
 * CONSTRAINTS
 ******************************************************************************/
ALTER TABLE sessions
ADD
    CONSTRAINT `sessions_email_fk` FOREIGN KEY(email) REFERENCES users(email) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE events
ADD
    CONSTRAINT `events_user_fk` FOREIGN KEY(user) REFERENCES users(email) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE users
ADD
    CONSTRAINT `permissions_domain` CHECK (
        `permissions` = 'admin'
        OR `permissions` = 'new'
        OR `permissions` = 'authorized'
        OR `permissions` = 'developer'
    );