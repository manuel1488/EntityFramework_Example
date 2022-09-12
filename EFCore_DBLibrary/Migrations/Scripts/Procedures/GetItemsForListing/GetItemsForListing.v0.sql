CREATE OR ALTER PROCEDURE dbo.GetItemsForListing
 @minDate DATETIME = '1970.01.01',
 @maxDate DATETIME = '2050.12.31'
AS
BEGIN
 SET NOCOUNT ON;
 SELECT item.[Name], item.[Description]
 , item.Notes, item.isActive, item.isDeleted
 , genre.[Name] GenreName, cat.[Name] CategoryName
 FROM dbo.Items item
 LEFT JOIN dbo.ItemGenres ig on item.Id = ig.ItemId
 LEFT JOIN dbo.Genres genre on ig.GenreId = genre.Id
 LEFT JOIN dbo.Categories cat on item.CategoryId = cat.Id
 WHERE (@minDate IS NULL OR item.CreatedDate >= @minDate)
 AND (@maxDate IS NULL OR item.CreatedDate <= @maxDate)
END
GO