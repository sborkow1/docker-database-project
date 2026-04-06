-- Create our database
CREATE DATABASE IF NOT EXISTS Billiards;
USE Billiards;

-- Dropping tables, just in case
DROP TABLE IF EXISTS Downloads;
DROP TABLE IF EXISTS Subscriptions;
DROP TABLE IF EXISTS Videos;
DROP TABLE IF EXISTS Matches;
DROP TABLE IF EXISTS Plans;
DROP TABLE IF EXISTS Users;

/*
    Users table - stores information on user accounts
*/
CREATE TABLE Users (
    UserID INT AUTO_INCREMENT,
    UserName VARCHAR(255) NOT NULL UNIQUE,
    UserPasswordHash VARCHAR(255) NOT NULL,
    UserEmail VARCHAR(255) NOT NULL UNIQUE,
    PRIMARY KEY(UserID)
);

/*
    Plans table - stores the different available subscription plans
*/
CREATE TABLE Plans (
    PlanID INT AUTO_INCREMENT,
    PlanName VARCHAR(50) NOT NULL,
    PlanDuration INT NOT NULL, -- Stored in days
    PlanPrice DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY(PlanID)
);

/*
    Subscriptions table - stores information on user subscriptions
*/
CREATE TABLE Subscriptions (
    SubscriptionID INT AUTO_INCREMENT,
    UserID INT NOT NULL,
    PlanID INT NOT NULL,
    SubscriptionStartDate DATETIME NOT NULL,
    SubscriptionEndDate DATETIME NOT NULL,
    PRIMARY KEY (SubscriptionID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (PlanID) REFERENCES Plans(PlanID)
);

/*
    Matches table - tracks matches played
*/
CREATE TABLE Matches(
    MatchID INT AUTO_INCREMENT,
    MatchTitle VARCHAR(255) NOT NULL,
    MatchTable INT NOT NULL, -- The table the match was played at
    MatchDate DATETIME NOT NULL,
    MatchType ENUM('8-ball', '9-ball', '10-ball') DEFAULT '8-ball',
    PRIMARY KEY(MatchID)
);

/*
    Videos table - stores information on recorded match videos
*/
CREATE TABLE Videos(
    VideoID INT AUTO_INCREMENT,
    MatchID INT NOT NULL,
    VideoPath VARCHAR(255) NOT NULL, -- The location of the video file
    VideoSize INT NOT NULL, -- Stored in megabytes
    PRIMARY KEY(VideoID),
    FOREIGN KEY (MatchID) REFERENCES Matches(MatchID)
);

/*
    Downloads table - for tracking who downloads what and when
*/
CREATE TABLE Downloads(
    DownloadID INT AUTO_INCREMENT,
    UserID INT NOT NULL,
    VideoID INT NOT NULL,
    DownloadDate DATETIME NOT NULL,
    DownloadIP VARCHAR(45) NOT NULL,
    PRIMARY KEY(DownloadID),
    FOREIGN KEY (UserID) REFERENCES Users(UserID),
    FOREIGN KEY (VideoID) REFERENCES Videos(VideoID)
);