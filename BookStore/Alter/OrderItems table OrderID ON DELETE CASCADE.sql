USE [BookStoreDB]
GO

ALTER TABLE [dbo].[OrderItems] DROP CONSTRAINT [FK__OrderItem__Order__5165187F]
GO

ALTER TABLE [dbo].[OrderItems]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID]) ON DELETE CASCADE
GO


