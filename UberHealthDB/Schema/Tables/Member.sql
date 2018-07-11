CREATE TABLE [dbo].[Member] (
    [Id]       INT           IDENTITY (1, 1) NOT NULL,
    [Name]     VARCHAR (50)  NOT NULL,
    [Email]    VARCHAR (100) NOT NULL,
    [Phone]    VARCHAR (15)  NULL,
    [dp]       VARCHAR (50)  NULL,
    [status]   VARCHAR (200) NULL,
    [password] VARCHAR (20)  NOT NULL,
    [gender]   VARCHAR (10)  NOT NULL,
    [age]      VARCHAR (10)  NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

