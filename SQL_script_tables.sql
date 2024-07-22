-- Dropping existing tables if they exist
IF EXISTS (SELECT * FROM sys.tables WHERE name = 'critics_reviews')
BEGIN
    DROP TABLE [dbo].[critics_reviews];
END;


IF EXISTS (SELECT * FROM sys.tables WHERE name = 'user_reviews')
BEGIN
    DROP TABLE [dbo].[user_reviews];
END;


IF EXISTS (SELECT * FROM sys.tables WHERE name = 'movies')
BEGIN
    DROP TABLE [dbo].[movies];
END;


-- Creating movies table
CREATE TABLE [dbo].[movies]
(
    movieId NVARCHAR(255) NOT NULL,
    movieTitle NVARCHAR(255),
    movieYear INT,
    movieURL NVARCHAR(255),
    critic_score NVARCHAR(255),
    audience_score NVARCHAR(255),
    CONSTRAINT PK_movies PRIMARY KEY NONCLUSTERED (movieId) NOT ENFORCED
)
WITH
(
    DISTRIBUTION = HASH (movieId),
    CLUSTERED COLUMNSTORE INDEX
);


-- Creating critics_reviews table
CREATE TABLE [dbo].[critics_reviews]
(
    reviewId NVARCHAR(255),
    movieId NVARCHAR(255), -- Logical relationship with movies table
    creationDate DATE,
    criticName NVARCHAR(255),
    criticPageUrl NVARCHAR(255),
    reviewState NVARCHAR(50),
    isFresh BIT,
    isRotten BIT,
    isRtUrl BIT,
    isTopCritic BIT,
    publicationUrl NVARCHAR(255),
    publicationName NVARCHAR(255),
    reviewUrl NVARCHAR(255),
    quote NVARCHAR(4000),
    scoreSentiment NVARCHAR(255),
    originalScore NVARCHAR(255),
    CONSTRAINT PK_critics_reviews PRIMARY KEY NONCLUSTERED (reviewId) NOT ENFORCED
)
WITH
(
    DISTRIBUTION = HASH (reviewId),
    CLUSTERED COLUMNSTORE INDEX
);

-- Creating user_reviews table
CREATE TABLE [dbo].[user_reviews]
(
    reviewId NVARCHAR(255),
    movieId NVARCHAR(255), -- Logical relationship with movies table
    rating DECIMAL(3, 1),
    quote NVARCHAR(4000),
    isVerified BIT,
    isSuperReviewer BIT,
    hasSpoilers BIT,
    hasProfanity BIT,
    score FLOAT,
    creationDate DATE,
    userDisplayName NVARCHAR(255),
    userRealm NVARCHAR(255),
    userId NVARCHAR(255),
    CONSTRAINT PK_user_reviews PRIMARY KEY NONCLUSTERED (reviewId) NOT ENFORCED
)
WITH
(
    DISTRIBUTION = HASH (movieId),
    CLUSTERED COLUMNSTORE INDEX
);

