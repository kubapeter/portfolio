-- 1. How many albums does the artist Led Zeppelin have?

SELECT COUNT(albumId) AS total
  FROM albums
  WHERE ArtistId IN 
    (
      SELECT ArtistId
      FROM artists
      WHERE Name LIKE "Led Zeppelin"
    );


-- 2. Create a list of album titles and the unit prices for the artist "Audioslave".

SELECT a.Title, t.UnitPrice
  FROM 
    Albums a
    INNER JOIN 
    Tracks t 
    ON a.AlbumId = t.AlbumId 
    INNER JOIN 
    Artists ar 
    ON ar.ArtistID = a.ArtistID 
  WHERE ar.Name = 'Audioslave'; 


-- 3. Find the first and last name of any customer who does not have an invoice. 

SELECT 
    n.FirstName
	  ,n.LastName
	  ,i.Invoiceid
  FROM 
    customers n
    LEFT JOIN 
    invoices i 
    ON n.Customerid = i.Customerid
  WHERE InvoiceId IS NULL;


-- 4. Find the total price for each album. What is the total price for the album “Big Ones”?

SELECT t.Title, SUM(p.UnitPrice)
  FROM 
    albums t
    INNER JOIN 
    tracks p 
    ON t.Albumid = p.Albumid
  --WHERE t.Title = 'Big Ones'
  GROUP BY t.Title;


-- 5. How many records are created when you apply a Cartesian join to the invoice and invoice items table?

SELECT a.InvoiceId D
  FROM 
    invoices a
    CROSS JOIN 
    invoice_items b;

-- 922880 total rows shown
