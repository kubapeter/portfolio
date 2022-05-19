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

More than ten

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
