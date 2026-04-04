-- Create our database
CREATE DATABASE IF NOT EXISTS Billiards;
USE Billiards;

-- Dropping tables, just in case
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Video;

/*
    User table - stores information on user accounts
*/
CREATE TABLE User {
    UserID INT NOT NULL AUTO_INCREMENT,
    UserName VARCHAR(50),
    PRIMARY KEY(UserID)
}

/*
    Video table - stores information on recorded match videos
*/
CREATE TABLE Video {
    VideoID INT NOT NULL AUTO_INCREMENT,
    PRIMARY KEY(VideoID)
}

/*
    I can't think of any other necessary tables
    Subscription is a possiblity, which would be related to the user table
    If we include the functionality of making purchases
*/