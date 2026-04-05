/*
    Insert data into the Users table
*/
INSERT INTO Users (UserName, UserPasswordHash, UserEmail)
VALUES 
('DrPool245', 'hG67AmG341hHJ5', 'DrPool245@yahoo.com'),
('Mary98', 'TYp56g01Mm76', 'Mary98@yahoo.com'),
('Tacofriend', '65AsPl7U8iB12', 'Tacofriend@yahoo.com');

/*
    Insert data into the Plans table
*/
INSERT INTO Plans (PlanName, PlanDuration, PlanPrice)
VALUES
('Monthly', 30, 4.99),
('Yearly', 365, 39.99);

/*
    Insert data into the Subcriptions table
*/
INSERT INTO Subscriptions (UserID, PlanID, SubscriptionStartDate, SubscriptionEndDate)
VALUES
(1, 1, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
(2, 1, NOW(), DATE_ADD(NOW(), INTERVAL 30 DAY)),
(3, 2, NOW(), DATE_ADD(NOW(), INTERVAL 1 YEAR));

/*
    Insert data into the Matches table
*/
INSERT INTO Matches (MatchTitle, MatchTable, MatchDate, MatchType)
VALUES
('Blue Team vs. Red Team', 10, NOW(), '9-ball'),
('Home Team vs. Away Team', 1, NOW(), '8-ball'),
('Them Team vs. Us Team', 5, NOW(), '10-ball');

/*
    Insert data into the Videos table
*/

/*
    Insert data into the Downloads table
*/