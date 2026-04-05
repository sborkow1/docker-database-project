-- Create our database
CREATE DATABASE IF NOT EXISTS Billiards;
USE Billiards;

-- Dropping tables, just in case
DROP TABLE IF EXISTS User;
DROP TABLE IF EXISTS Subscription;
DROP TABLE IF EXISTS Video;

/*
    User table - stores information on user accounts
*/
CREATE TABLE User {
    UserID INT NOT NULL AUTO_INCREMENT,
    UserName VARCHAR(255) NOT NULL UNIQUE,
    UserPasswordHash VARCHAR(255) NOT NULL,
    UserEmail VARCHAR(255) NOT NULL,
    PRIMARY KEY(UserID)
}

/*
    Subscription table - stores information on subscriptions
*/
CREATE TABLE Subscription {
    SubscriptionID INT NOT NULL AUTO_INCREMENT,
    UserID INT NOT NULL,
    SubscriptionPlan SET("Monthly", "Yearly"),
    SubscriptionStartDate DATE NOT NULL,
    SubscriptionEndDate DATE NOT NULL,
    SubscriptionStatus SET("Active", "Expired", "Cancelled"),
    PRIMARY KEY (SubscriptionID),
    FOREIGN KEY (UserID) REFERENCES User(UserID)
}

/*
    Match table - tracks the matches that take place at the venue
*/
CREATE TABLE Match {
    
}


/*
    Video table - stores information on recorded match videos
*/
CREATE TABLE Video {
    VideoID INT NOT NULL AUTO_INCREMENT,
    VideoPath VARCHAR(255),
    PRIMARY KEY(VideoID)
}

/*
    Download table - for tracking who downloads what and when
*/
CREATE TABLE Download {
    DownloadID INT NOT NULL AUTO_INCREMENT,
    UserID INT NOT NULL,
    VideoID INT NOT NULL,
    DownloadDate DATE NOT NULL,
    DownloadIP VARCHAR(30) NOT NULL,
    PRIMARY KEY(DownloadID),
    FOREIGN KEY UserID REFERENCES User(UserID),
    FOREIGN KEY VideoID REFERENCES Video(VideoID)
}