USE BookStoreDB

UPDATE Books 
SET Price = Price * 1.1
WHERE YEAR(PublicationYear) < 2000 