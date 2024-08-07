-- 1. Retrieve all the data from the tracks table. Who is the composer for track 18?

SELECT *
  FROM Tracks;
  
--+---------+-----------------------------------------+---------+-------------+---------+------------------------------------------------------------------------+--------------+----------+-----------+
--| TrackId | Name                                    | AlbumId | MediaTypeId | GenreId | Composer                                                               | Milliseconds |    Bytes | UnitPrice |
--+---------+-----------------------------------------+---------+-------------+---------+------------------------------------------------------------------------+--------------+----------+-----------+
--|       1 | For Those About To Rock (We Salute You) |       1 |           1 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |       343719 | 11170334 |      0.99 |
--|       2 | Balls to the Wall                       |       2 |           2 |       1 | None                                                                   |       342562 |  5510424 |      0.99 |
--|       3 | Fast As a Shark                         |       3 |           2 |       1 | F. Baltes, S. Kaufman, U. Dirkscneider & W. Hoffman                    |       230619 |  3990994 |      0.99 |
--|       4 | Restless and Wild                       |       3 |           2 |       1 | F. Baltes, R.A. Smith-Diesel, S. Kaufman, U. Dirkscneider & W. Hoffman |       252051 |  4331779 |      0.99 |
--|       5 | Princess of the Dawn                    |       3 |           2 |       1 | Deaffy & R.A. Smith-Diesel                                             |       375418 |  6290521 |      0.99 |
--|       6 | Put The Finger On You                   |       1 |           1 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |       205662 |  6713451 |      0.99 |
--|       7 | Let's Get It Up                         |       1 |           1 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |       233926 |  7636561 |      0.99 |
--|       8 | Inject The Venom                        |       1 |           1 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |       210834 |  6852860 |      0.99 |
--|       9 | Snowballed                              |       1 |           1 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |       203102 |  6599424 |      0.99 |
--|      10 | Evil Walks                              |       1 |           1 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |       263497 |  8611245 |      0.99 |
--|      11 | C.O.D.                                  |       1 |           1 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |       199836 |  6566314 |      0.99 |
--|      12 | Breaking The Rules                      |       1 |           1 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |       263288 |  8596840 |      0.99 |
--|      13 | Night Of The Long Knives                |       1 |           1 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |       205688 |  6706347 |      0.99 |
--|      14 | Spellbound                              |       1 |           1 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |       270863 |  8817038 |      0.99 |
--|      15 | Go Down                                 |       4 |           1 |       1 | AC/DC                                                                  |       331180 | 10847611 |      0.99 |
--|      16 | Dog Eat Dog                             |       4 |           1 |       1 | AC/DC                                                                  |       215196 |  7032162 |      0.99 |
--|      17 | Let There Be Rock                       |       4 |           1 |       1 | AC/DC                                                                  |       366654 | 12021261 |      0.99 |
--|      18 | Bad Boy Boogie                          |       4 |           1 |       1 | AC/DC                                                                  |       267728 |  8776140 |      0.99 |
--|      19 | Problem Child                           |       4 |           1 |       1 | AC/DC                                                                  |       325041 | 10617116 |      0.99 |
--|      20 | Overdose                                |       4 |           1 |       1 | AC/DC                                                                  |       369319 | 12066294 |      0.99 |
--|      21 | Hell Ain't A Bad Place To Be            |       4 |           1 |       1 | AC/DC                                                                  |       254380 |  8331286 |      0.99 |
--|      22 | Whole Lotta Rosie                       |       4 |           1 |       1 | AC/DC                                                                  |       323761 | 10547154 |      0.99 |
--|      23 | Walk On Water                           |       5 |           1 |       1 | Steven Tyler, Joe Perry, Jack Blades, Tommy Shaw                       |       295680 |  9719579 |      0.99 |
--|      24 | Love In An Elevator                     |       5 |           1 |       1 | Steven Tyler, Joe Perry                                                |       321828 | 10552051 |      0.99 |
--|      25 | Rag Doll                                |       5 |           1 |       1 | Steven Tyler, Joe Perry, Jim Vallance, Holly Knight                    |       264698 |  8675345 |      0.99 |
--+---------+-----------------------------------------+---------+-------------+---------+------------------------------------------------------------------------+--------------+----------+-----------+
--(Output limit exceeded, 25 of 3503 total rows shown)

AC/DC


-- 2. Retrieve all data from the artists table. Look at the list of artists, how many artists are you familiar with (there is no wrong answer here)?

SELECT *
  FROM Artists;
  
--+----------+---------------------------------+
--| ArtistId | Name                            |
--+----------+---------------------------------+
--|        1 | AC/DC                           |
--|        2 | Accept                          |
--|        3 | Aerosmith                       |
--|        4 | Alanis Morissette               |
--|        5 | Alice In Chains                 |
--|        6 | Antônio Carlos Jobim            |
--|        7 | Apocalyptica                    |
--|        8 | Audioslave                      |
--|        9 | BackBeat                        |
--|       10 | Billy Cobham                    |
--|       11 | Black Label Society             |
--|       12 | Black Sabbath                   |
--|       13 | Body Count                      |
--|       14 | Bruce Dickinson                 |
--|       15 | Buddy Guy                       |
--|       16 | Caetano Veloso                  |
--|       17 | Chico Buarque                   |
--|       18 | Chico Science & Nação Zumbi     |
--|       19 | Cidade Negra                    |
--|       20 | Cláudio Zoli                    |
--|       21 | Various Artists                 |
--|       22 | Led Zeppelin                    |
--|       23 | Frank Zappa & Captain Beefheart |
--|       24 | Marcos Valle                    |
--|       25 | Milton Nascimento & Bebeto      |
--+----------+---------------------------------+
--(Output limit exceeded, 25 of 275 total rows shown)


-- 3. Retrieve all data from the invoices table. What is the billing address for customer 31?

SELECT *
  FROM Invoices;

--+-----------+------------+---------------------+---------------------------+---------------+--------------+----------------+-------------------+-------+
--| InvoiceId | CustomerId | InvoiceDate         | BillingAddress            | BillingCity   | BillingState | BillingCountry | BillingPostalCode | Total |
--+-----------+------------+---------------------+---------------------------+---------------+--------------+----------------+-------------------+-------+
--|         1 |          2 | 2009-01-01 00:00:00 | Theodor-Heuss-Straße 34   | Stuttgart     |         None | Germany        | 70174             |  1.98 |
--|         2 |          4 | 2009-01-02 00:00:00 | Ullevålsveien 14          | Oslo          |         None | Norway         | 0171              |  3.96 |
--|         3 |          8 | 2009-01-03 00:00:00 | Grétrystraat 63           | Brussels      |         None | Belgium        | 1000              |  5.94 |
--|         4 |         14 | 2009-01-06 00:00:00 | 8210 111 ST NW            | Edmonton      |           AB | Canada         | T6G 2C7           |  8.91 |
--|         5 |         23 | 2009-01-11 00:00:00 | 69 Salem Street           | Boston        |           MA | USA            | 2113              | 13.86 |
--|         6 |         37 | 2009-01-19 00:00:00 | Berger Straße 10          | Frankfurt     |         None | Germany        | 60316             |  0.99 |
--|         7 |         38 | 2009-02-01 00:00:00 | Barbarossastraße 19       | Berlin        |         None | Germany        | 10779             |  1.98 |
--|         8 |         40 | 2009-02-01 00:00:00 | 8, Rue Hanovre            | Paris         |         None | France         | 75002             |  1.98 |
--|         9 |         42 | 2009-02-02 00:00:00 | 9, Place Louis Barthou    | Bordeaux      |         None | France         | 33000             |  3.96 |
--|        10 |         46 | 2009-02-03 00:00:00 | 3 Chatham Street          | Dublin        |       Dublin | Ireland        | None              |  5.94 |
--|        11 |         52 | 2009-02-06 00:00:00 | 202 Hoxton Street         | London        |         None | United Kingdom | N1 5LH            |  8.91 |
--|        12 |          2 | 2009-02-11 00:00:00 | Theodor-Heuss-Straße 34   | Stuttgart     |         None | Germany        | 70174             | 13.86 |
--|        13 |         16 | 2009-02-19 00:00:00 | 1600 Amphitheatre Parkway | Mountain View |           CA | USA            | 94043-1351        |  0.99 |
--|        14 |         17 | 2009-03-04 00:00:00 | 1 Microsoft Way           | Redmond       |           WA | USA            | 98052-8300        |  1.98 |
--|        15 |         19 | 2009-03-04 00:00:00 | 1 Infinite Loop           | Cupertino     |           CA | USA            | 95014             |  1.98 |
--|        16 |         21 | 2009-03-05 00:00:00 | 801 W 4th Street          | Reno          |           NV | USA            | 89503             |  3.96 |
--|        17 |         25 | 2009-03-06 00:00:00 | 319 N. Frances Street     | Madison       |           WI | USA            | 53703             |  5.94 |
--|        18 |         31 | 2009-03-09 00:00:00 | 194A Chain Lake Drive     | Halifax       |           NS | Canada         | B3S 1C5           |  8.91 |
--|        19 |         40 | 2009-03-14 00:00:00 | 8, Rue Hanovre            | Paris         |         None | France         | 75002             | 13.86 |
--|        20 |         54 | 2009-03-22 00:00:00 | 110 Raeburn Pl            | Edinburgh     |         None | United Kingdom | EH4 1HH           |  0.99 |
--|        21 |         55 | 2009-04-04 00:00:00 | 421 Bourke Street         | Sidney        |          NSW | Australia      | 2010              |  1.98 |
--|        22 |         57 | 2009-04-04 00:00:00 | Calle Lira, 198           | Santiago      |         None | Chile          | None              |  1.98 |
--|        23 |         59 | 2009-04-05 00:00:00 | 3,Raj Bhavan Road         | Bangalore     |         None | India          | 560001            |  3.96 |
--|        24 |          4 | 2009-04-06 00:00:00 | Ullevålsveien 14          | Oslo          |         None | Norway         | 0171              |  5.94 |
--|        25 |         10 | 2009-04-09 00:00:00 | Rua Dr. Falcão Filho, 155 | São Paulo     |           SP | Brazil         | 01007-010         |  8.91 |
--+-----------+------------+---------------------+---------------------------+---------------+--------------+----------------+-------------------+-------+
--(Output limit exceeded, 25 of 412 total rows shown)

194A Chain Lake Drive, Halifax, NS, CANADA B3S 1C5


-- 4. Return the playlist id, and name from the playlists table. How many playlists are there? Which would you classify is your favorite from this list?

SELECT Playlistid, Name
  FROM Playlists;

-- +------------+----------------------------+
--| PlaylistId | Name                       |
--+------------+----------------------------+
--|          1 | Music                      |
--|          2 | Movies                     |
--|          3 | TV Shows                   |
--|          4 | Audiobooks                 |
--|          5 | 90’s Music                 |
--|          6 | Audiobooks                 |
--|          7 | Movies                     |
--|          8 | Music                      |
--|          9 | Music Videos               |
--|         10 | TV Shows                   |
--|         11 | Brazilian Music            |
--|         12 | Classical                  |
--|         13 | Classical 101 - Deep Cuts  |
--|         14 | Classical 101 - Next Steps |
--|         15 | Classical 101 - The Basics |
--|         16 | Grunge                     |
--|         17 | Heavy Metal Classic        |
--|         18 | On-The-Go 1                |
--+------------+----------------------------+


-- 5. Return the Customer Id, Invoice Date, and Billing City 
-- from the Invoices table. 
-- What city is associated with Customer ID number 42? 
-- What was the invoice date for the customer in Santiago?

SELECT 
    CustomerId,
    InvoiceDate, 
    BillingCity 
  FROM Invoices;

--+------------+---------------------+---------------+
--| CustomerId | InvoiceDate         | BillingCity   |
--+------------+---------------------+---------------+
--|          2 | 2009-01-01 00:00:00 | Stuttgart     |
--|          4 | 2009-01-02 00:00:00 | Oslo          |
--|          8 | 2009-01-03 00:00:00 | Brussels      |
--|         14 | 2009-01-06 00:00:00 | Edmonton      |
--|         23 | 2009-01-11 00:00:00 | Boston        |
--|         37 | 2009-01-19 00:00:00 | Frankfurt     |
--|         38 | 2009-02-01 00:00:00 | Berlin        |
--|         40 | 2009-02-01 00:00:00 | Paris         |
--|         42 | 2009-02-02 00:00:00 | Bordeaux      |
--|         46 | 2009-02-03 00:00:00 | Dublin        |
--|         52 | 2009-02-06 00:00:00 | London        |
--|          2 | 2009-02-11 00:00:00 | Stuttgart     |
--|         16 | 2009-02-19 00:00:00 | Mountain View |
--|         17 | 2009-03-04 00:00:00 | Redmond       |
--|         19 | 2009-03-04 00:00:00 | Cupertino     |
--|         21 | 2009-03-05 00:00:00 | Reno          |
--|         25 | 2009-03-06 00:00:00 | Madison       |
--|         31 | 2009-03-09 00:00:00 | Halifax       |
--|         40 | 2009-03-14 00:00:00 | Paris         |
--|         54 | 2009-03-22 00:00:00 | Edinburgh     |
--|         55 | 2009-04-04 00:00:00 | Sidney        |
--|         57 | 2009-04-04 00:00:00 | Santiago      |
--|         59 | 2009-04-05 00:00:00 | Bangalore     |
--|          4 | 2009-04-06 00:00:00 | Oslo          |
--|         10 | 2009-04-09 00:00:00 | São Paulo     |
--+------------+---------------------+---------------+
--(Output limit exceeded, 25 of 412 total rows shown)

Bordeaux
2009-04-04


-- 6. Return the First Name, Last Name, Email, and Phone, from the Customers table. What is the telephone number for Jennifer Peterson?

SELECT 
    FirstName, 
    LastName, 
    Email, 
    Phone
  FROM Customers;

--+-----------+-------------+-------------------------------+--------------------+
--| FirstName | LastName    | Email                         | Phone              |
--+-----------+-------------+-------------------------------+--------------------+
--| Luís      | Gonçalves   | luisg@embraer.com.br          | +55 (12) 3923-5555 |
--| Leonie    | Köhler      | leonekohler@surfeu.de         | +49 0711 2842222   |
--| François  | Tremblay    | ftremblay@gmail.com           | +1 (514) 721-4711  |
--| Bjørn     | Hansen      | bjorn.hansen@yahoo.no         | +47 22 44 22 22    |
--| František | Wichterlová | frantisekw@jetbrains.com      | +420 2 4172 5555   |
--| Helena    | Holý        | hholy@gmail.com               | +420 2 4177 0449   |
--| Astrid    | Gruber      | astrid.gruber@apple.at        | +43 01 5134505     |
--| Daan      | Peeters     | daan_peeters@apple.be         | +32 02 219 03 03   |
--| Kara      | Nielsen     | kara.nielsen@jubii.dk         | +453 3331 9991     |
--| Eduardo   | Martins     | eduardo@woodstock.com.br      | +55 (11) 3033-5446 |
--| Alexandre | Rocha       | alero@uol.com.br              | +55 (11) 3055-3278 |
--| Roberto   | Almeida     | roberto.almeida@riotur.gov.br | +55 (21) 2271-7000 |
--| Fernanda  | Ramos       | fernadaramos4@uol.com.br      | +55 (61) 3363-5547 |
--| Mark      | Philips     | mphilips12@shaw.ca            | +1 (780) 434-4554  |
--| Jennifer  | Peterson    | jenniferp@rogers.ca           | +1 (604) 688-2255  |
--| Frank     | Harris      | fharris@google.com            | +1 (650) 253-0000  |
--| Jack      | Smith       | jacksmith@microsoft.com       | +1 (425) 882-8080  |
--| Michelle  | Brooks      | michelleb@aol.com             | +1 (212) 221-3546  |
--| Tim       | Goyer       | tgoyer@apple.com              | +1 (408) 996-1010  |
--| Dan       | Miller      | dmiller@comcast.com           | +1 (650) 644-3358  |
--| Kathy     | Chase       | kachase@hotmail.com           | +1 (775) 223-7665  |
--| Heather   | Leacock     | hleacock@gmail.com            | +1 (407) 999-7788  |
--| John      | Gordon      | johngordon22@yahoo.com        | +1 (617) 522-1333  |
--| Frank     | Ralston     | fralston@gmail.com            | +1 (312) 332-3232  |
--| Victor    | Stevens     | vstevens@yahoo.com            | +1 (608) 257-0597  |
--+-----------+-------------+-------------------------------+--------------------+
--(Output limit exceeded, 25 of 59 total rows shown)

+1 (604) 688-2255


-- 7. Return the Track Id, Genre Id, Composer, Unit Price from the Tracks table. How much do these tracks cost?

SELECT 
    TrackId, 
    GenreId, 
    Composer, 
    UnitPrice 
  FROM Tracks;

--+---------+---------+------------------------------------------------------------------------+-----------+
--| TrackId | GenreId | Composer                                                               | UnitPrice |
--+---------+---------+------------------------------------------------------------------------+-----------+
--|       1 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |      0.99 |
--|       2 |       1 | None                                                                   |      0.99 |
--|       3 |       1 | F. Baltes, S. Kaufman, U. Dirkscneider & W. Hoffman                    |      0.99 |
--|       4 |       1 | F. Baltes, R.A. Smith-Diesel, S. Kaufman, U. Dirkscneider & W. Hoffman |      0.99 |
--|       5 |       1 | Deaffy & R.A. Smith-Diesel                                             |      0.99 |
--|       6 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |      0.99 |
--|       7 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |      0.99 |
--|       8 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |      0.99 |
--|       9 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |      0.99 |
--|      10 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |      0.99 |
--|      11 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |      0.99 |
--|      12 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |      0.99 |
--|      13 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |      0.99 |
--|      14 |       1 | Angus Young, Malcolm Young, Brian Johnson                              |      0.99 |
--|      15 |       1 | AC/DC                                                                  |      0.99 |
--|      16 |       1 | AC/DC                                                                  |      0.99 |
--|      17 |       1 | AC/DC                                                                  |      0.99 |
--|      18 |       1 | AC/DC                                                                  |      0.99 |
--|      19 |       1 | AC/DC                                                                  |      0.99 |
--|      20 |       1 | AC/DC                                                                  |      0.99 |
--|      21 |       1 | AC/DC                                                                  |      0.99 |
--|      22 |       1 | AC/DC                                                                  |      0.99 |
--|      23 |       1 | Steven Tyler, Joe Perry, Jack Blades, Tommy Shaw                       |      0.99 |
--|      24 |       1 | Steven Tyler, Joe Perry                                                |      0.99 |
--|      25 |       1 | Steven Tyler, Joe Perry, Jim Vallance, Holly Knight                    |      0.99 |
--+---------+---------+------------------------------------------------------------------------+-----------+
--(Output limit exceeded, 25 of 3503 total rows shown)

0.99


-- 8. Select all the columns from the Playlist Track table and limit the results to 10 records. How might this information be used?

SELECT *
  FROM Playlist_track 
  LIMIT 10;

--+------------+---------+
--| PlaylistId | TrackId |
--+------------+---------+
--|          1 |    3402 |
--|          1 |    3389 |
--|          1 |    3390 |
--|          1 |    3391 |
--|          1 |    3392 |
--|          1 |    3393 |
--|          1 |    3394 |
--|          1 |    3395 |
--|          1 |    3396 |
--|          1 |    3397 |
--+------------+---------+


-- 9. Select all the columns from the Media Types table and limit the results to 50 records. 
-- What happened when you ran this query? Were you able to get all 50 records?

SELECT *
  FROM Media_types
  LIMIT 50;

--+-------------+-----------------------------+
--| MediaTypeId | Name                        |
--+-------------+-----------------------------+
--|           1 | MPEG audio file             |
--|           2 | Protected AAC audio file    |
--|           3 | Protected MPEG-4 video file |
--|           4 | Purchased AAC audio file    |
--|           5 | AAC audio file              |
--+-------------+-----------------------------+

only 5 rows because there are no more


-- 10. Select all the columns from the Albums table and limit the results to 5 records. How many columns are in the albums table? 
-- What is the name of the 9th album in this list?

SELECT *
  FROM Albums;

--+---------+--------------------------------------------------+----------+
--| AlbumId | Title                                            | ArtistId |
--+---------+--------------------------------------------------+----------+
--|       1 | For Those About To Rock We Salute You            |        1 |
--|       2 | Balls to the Wall                                |        2 |
--|       3 | Restless and Wild                                |        2 |
--|       4 | Let There Be Rock                                |        1 |
--|       5 | Big Ones                                         |        3 |
--|       6 | Jagged Little Pill                               |        4 |
--|       7 | Facelift                                         |        5 |
--|       8 | Warner 25 Anos                                   |        6 |
--|       9 | Plays Metallica By Four Cellos                   |        7 |
--|      10 | Audioslave                                       |        8 |
--|      11 | Out Of Exile                                     |        8 |
--|      12 | BackBeat Soundtrack                              |        9 |
--|      13 | The Best Of Billy Cobham                         |       10 |
--|      14 | Alcohol Fueled Brewtality Live! [Disc 1]         |       11 |
--|      15 | Alcohol Fueled Brewtality Live! [Disc 2]         |       11 |
--|      16 | Black Sabbath                                    |       12 |
--|      17 | Black Sabbath Vol. 4 (Remaster)                  |       12 |
--|      18 | Body Count                                       |       13 |
--|      19 | Chemical Wedding                                 |       14 |
--|      20 | The Best Of Buddy Guy - The Millenium Collection |       15 |
--|      21 | Prenda Minha                                     |       16 |
--|      22 | Sozinho Remix Ao Vivo                            |       16 |
--|      23 | Minha Historia                                   |       17 |
--|      24 | Afrociberdelia                                   |       18 |
--|      25 | Da Lama Ao Caos                                  |       18 |
--+---------+--------------------------------------------------+----------+
--(Output limit exceeded, 25 of 347 total rows shown)

Plays Metallica By Four Cellos
