CREATE TABLE [dbo].[Patient] (
    [Id]           INT          NOT NULL,
    [genderpref]   VARCHAR (20) NULL,
    [agepref]      VARCHAR (20) NULL,
    [languagepref] VARCHAR (20) NULL,
    [locationpref] VARCHAR (20) NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

