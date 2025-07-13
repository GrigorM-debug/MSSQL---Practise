USE [BookStoreDB]
GO

ALTER TABLE [dbo].[Orders] DROP CONSTRAINT [FK__Orders__Customer__49C3F6B7]
GO

ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID]) ON DELETE CASCADE
GO


