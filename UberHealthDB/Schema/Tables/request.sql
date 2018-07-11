CREATE TABLE [dbo].[request] (
    [Id]          INT           NOT NULL,
    [ReqId]       INT           IDENTITY (1, 1) NOT NULL,
    [title]       VARCHAR (100) NOT NULL,
    [description] VARCHAR (200) NOT NULL,
    [date]        VARCHAR (50)  NOT NULL,
    PRIMARY KEY CLUSTERED ([ReqId] ASC)
);

