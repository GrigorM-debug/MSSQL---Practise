USE [BookStoreDB]
GO

ALTER TABLE [dbo].[BookGenre] DROP CONSTRAINT [FK__BookGenre__Genre__4316F928]
GO

ALTER TABLE [dbo].[BookGenre]  WITH CHECK ADD FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genres] ([GenreID]) ON DELETE CASCADE
GO


