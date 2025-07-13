USE [BookStoreDB]
GO

ALTER TABLE [dbo].[BookAuthor] DROP CONSTRAINT [FK__BookAutho__Autho__46E78A0C]
GO

ALTER TABLE [dbo].[BookAuthor]  WITH CHECK ADD FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID]) ON DELETE CASCADE
GO


