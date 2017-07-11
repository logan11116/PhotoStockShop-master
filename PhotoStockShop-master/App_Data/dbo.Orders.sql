CREATE TABLE [dbo].[Orders] (
    [OrderID]       INT           IDENTITY (1, 1) NULL,
    [OrderDate]     DATETIME      NULL,
    [Name]          VARCHAR (50)  NULL,
    [Address]       VARCHAR (255) NULL,
    [County]        VARCHAR (50)  NULL,
    [PostCode]      VARCHAR (15)  NULL,
    [Total]         VARCHAR(50)         NULL,
    CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED ([OrderID] ASC)
);

