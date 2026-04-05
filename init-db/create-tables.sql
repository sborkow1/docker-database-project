-- Create our database
CREATE DATABASE IF NOT EXISTS Billiards;
USE Billiards;

-- Dropping tables, just in case
DROP TABLE IF EXISTS Downloads;
DROP TABLE IF EXISTS Subscriptions;
DROP TABLE IF EXISTS Videos;
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
    PlanDuration INT NOT NULL,
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
    Videos table - stores information on recorded match videos
*/
CREATE TABLE Videos(
    VideoID INT AUTO_INCREMENT,
    VideoPath VARCHAR(255) NOT NULL,
    VideoSize BIGINT NOT NULL,
    VideoDate DATETIME NOT NULL,
    PRIMARY KEY(VideoID)
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