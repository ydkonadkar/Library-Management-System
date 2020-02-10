USE db_zoo
GO

CREATE TABLE tbl_PUBLISHER (
	PUBLISHER_Name VARCHAR(50) PRIMARY KEY NOT NULL,
	PUBLISHER_Address VARCHAR(50) NOT NULL,
	PUBLISHER_Phone INT NOT NULL,
);

CREATE TABLE tbl_LIBRARY_BRANCH (
	LIBRARY_BRANCH_BranchId INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	LIBRARY_BRANCH_BranchName VARCHAR(50) NOT NULL,
	LIBRARY_BRANCH_Address VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_BORROWER (
	BORROWER_CardNo INT PRIMARY KEY NOT NULL IDENTITY (100,1),
	BORROWER_Name VARCHAR(50) NOT NULL,
	BORROWER_Address VARCHAR(50) NOT NULL,
	BORROWER_Phone INT NOT NULL
);

CREATE TABLE tbl_BOOK (
	BOOK_Id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
	BOOK_title VARCHAR (50) NOT NULL,
	BOOK_PublisherName VARCHAR (50) NOT NULL CONSTRAINT fk_PUBLISHER_Name FOREIGN KEY REFERENCES tbl_PUBLISHER(PUBLISHER_Name) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_BOOK_AUTHORS (
	BOOK_AUTHORS_BookId INT NOT NULL CONSTRAINT fk_BOOK_Id FOREIGN KEY REFERENCES tbl_BOOK(BOOK_Id) ON UPDATE CASCADE ON DELETE CASCADE,
	BOOK_AUTHORS_AuthorName VARCHAR (50) NOT NULL
);



CREATE TABLE tbl_BOOK_LOANS (
	BOOK_LOANS_BookId INT NOT NULL CONSTRAINT fk_BOOK_Id_1 FOREIGN KEY REFERENCES tbl_BOOK(BOOK_Id) ON UPDATE CASCADE ON DELETE CASCADE,
	BOOK_LOANS_BranchId INT NOT NULL CONSTRAINT fk_LIBRARY_BRANCH_BranchId FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(LIBRARY_BRANCH_BranchId) ON UPDATE CASCADE ON DELETE CASCADE,
	BOOK_LOANS_CardNo INT NOT NULL CONSTRAINT fk_BORROWER_Card_No FOREIGN KEY REFERENCES tbl_BORROWER(BORROWER_CardNo) ON UPDATE CASCADE ON DELETE CASCADE,
	BOOK_LOANS_DateOut VARCHAR(50) NOT NULL,
	BOOK_LOANS_DueDate VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_BOOK_COPIES (
	BOOK_COPIES_BookId INT NOT NULL CONSTRAINT fk_BOOK_Id_2 FOREIGN KEY REFERENCES tbl_BOOK(BOOK_Id) ON UPDATE CASCADE ON DELETE CASCADE,
	BOOK_COPIES_BranchId INT NOT NULL CONSTRAINT fk_LIBRARY_BRANCH_BranchId_1 FOREIGN KEY REFERENCES tbl_LIBRARY_BRANCH(LIBRARY_BRANCH_BranchId) ON UPDATE CASCADE ON DELETE CASCADE,
	BOOK_COPIES_No_Of_Copies INT NOT NULL
);






/* Populating tables */
INSERT INTO tbl_PUBLISHER
	(PUBLISHER_Name, PUBLISHER_Address, PUBLISHER_Phone)
	VALUES
	('RANDOM', '36th Ave', 5326578),
	('HOUSE', '10th St', 6788975)
;
SELECT * FROM tbl_PUBLISHER;

INSERT INTO tbl_LIBRARY_BRANCH
	(LIBRARY_BRANCH_BranchName, LIBRARY_BRANCH_Address)
	VALUES
	('Sharpstown', '73rd St'),
	('Central', '56th Ave'),
	('North', '46th Way'),
	('Edison', '2nd Pl')
;
SELECT * FROM tbl_LIBRARY_BRANCH;

INSERT INTO tbl_BORROWER
	(BORROWER_Name, BORROWER_Address, BORROWER_Phone)
	VALUES
	('jon', '36th', 6475869),
	('george', '37th', 6475821),
	('john', '76th', 6475345),
	('ron', '86th', 6475856),
	('bob', '45th', 6475234),
	('ron', '23th', 6475123),
	('job', '38th', 6475823),
	('joe', '98th', 6475834)
;

INSERT INTO tbl_BOOK
	(BOOK_title, BOOK_PublisherName)
	VALUES
	('The Lost Tribe', 'RANDOM'),
	('Run', 'RANDOM'),
	('Jog', 'RANDOM'),
	('Supernova', 'HOUSE'),
	('John Paul', 'HOUSE'),
	('Frogs', 'RANDOM'),
	('Dinos', 'HOUSE'),
	('Motorcycles', 'RANDOM'),
	('Swim Fast', 'HOUSE'),
	('Lost City', 'RANDOM'),
	('Raptor', 'RANDOM'),
	('Pope', 'RANDOM'),
	('Book Sale', 'HOUSE'),
	('Portland', 'RANDOM'),
	('Seattle', 'RANDOM'),
	('NorthWest', 'RANDOM'),
	('Roaming', 'HOUSE'),
	('Meditation', 'RANDOM'),
	('Yoga', 'HOUSE'),
	('Fast', 'RANDOM')
;
SELECT * FROM tbl_BOOK;

INSERT INTO tbl_BOOK_AUTHORS
	(BOOK_AUTHORS_BookId, BOOK_AUTHORS_AuthorName)
	VALUES
	(1,'Stephen King'),
	(2, 'Nova Dog'),
	(3, 'Fred Jones'),
	(5, 'Joe Schmo'),
	(6, 'Rafeal'),
	(7, 'Manuel'),
	(8, 'Julius'),
	(9, 'Picasso'),
	(10, 'Rene Sartre'),
	(11, 'Carl Sagan')
;
SELECT * FROM tbl_BOOK_AUTHORS;


INSERT INTO tbl_BOOK_LOANS
	(BOOK_LOANS_BookId, BOOK_LOANS_BranchId, BOOK_LOANS_CardNo, BOOK_LOANS_DateOut, BOOK_LOANS_DueDate)
	VALUES
	(1, 1, 100, '1/1', '1/10'),
	(5, 1, 100, '1/1', '1/10'),
	(4, 2, 100, '1/1', '1/10'),
	(3, 1, 100, '1/1', '1/10'),
	(6, 1, 100, '1/1', '1/10'),
	(7, 3, 100, '1/1', '1/10'),
	(8, 1, 100, '1/1', '1/10'),
	(10, 1, 100, '1/1', '1/10'),
	(10, 2, 100, '1/1', '1/10'),
	(10, 1, 100, '1/1', '1/10'),
	(11, 1, 100, '1/1', '1/10'),
	(15, 1, 100, '1/3', '1/10'),
	(3, 2, 101, '1/1', '1/10'),
	(4, 2, 102, '1/1', '1/10'),
	(4, 2, 103, '1/1', '1/10'),
	(7, 2, 104, '1/2', '1/10'),
	(5, 2, 105, '1/1', '1/10'),
	(1, 4, 106, '1/1', '1/10'),
	(2, 4, 107, '1/1', '1/10'),
	(2, 4, 103, '1/1', '1/19'),
	(3, 2, 103, '1/1', '1/10'),
	(4, 2, 103, '1/1', '1/10'),
	(5, 2, 103, '1/1', '1/20'),
	(6, 2, 105, '1/1', '1/10'),
	(7, 2, 103, '1/1', '1/10'),
	(7, 2, 104, '1/1', '1/13'),
	(9, 2, 105, '1/9', '1/10'),
	(8, 2, 107, '1/1', '1/10'),
	(9, 2, 107, '1/1', '1/10'),
	(10, 2, 104, '1/1', '1/10'),
	(1, 3, 102, '1/1', '1/10'),
	(1, 3, 103, '1/1', '1/10'),
	(10, 3, 103, '1/1', '1/10'),
	(9, 3, 106, '1/1', '1/10'),
	(8, 3, 106, '1/1', '1/10'),
	(7, 3, 106, '1/1', '1/10'),
	(6, 3, 106, '1/1', '1/10'),
	(5, 3, 106, '1/1', '1/10'),
	(4, 3, 106, '1/1', '1/10'),
	(3, 3, 102, '1/1', '1/10'),
	(2, 3, 102, '1/1', '1/10'),
	(1, 4, 102, '1/1', '1/10'),
	(2, 4, 102, '1/1', '1/10'),
	(3, 4, 102, '1/1', '1/10'),
	(4, 4, 102, '1/1', '1/10'),
	(5, 4, 102, '1/1', '1/10'),
	(6, 4, 102, '1/1', '1/10'),
	(7, 4, 102, '1/1', '1/10'),
	(8, 4, 102, '1/1', '1/10'),
	(9, 4, 102, '1/1', '1/10')
;
SELECT * FROM tbl_BOOK_LOANS
INSERT INTO tbl_BOOK_COPIES
	(BOOK_COPIES_BookId, BOOK_COPIES_BranchId, BOOK_COPIES_No_Of_Copies)
	VALUES
	(1, 1, 5),
	(3, 1, 2),
	(5, 1, 3),
	(6, 1, 7),
	(2, 1, 2),
	(10, 1, 2),
	(15, 1, 2),
	(11, 1, 2),
	(12, 1, 2),
	(2, 1, 2),
	(1, 2, 6),
	(2, 2, 4),
	(3, 2, 3),
	(4, 2, 2),
	(5, 2, 2),
	(6, 2, 2),
	(7, 2, 2),
	(8, 2, 2),
	(9, 2, 2),
	(10, 2, 2),
	(2, 3, 2),
	(1, 3, 7),
	(2, 3, 2),
	(3, 3, 9),
	(4, 3, 7),
	(5, 3, 6),
	(6, 3, 4),
	(7, 3, 2),
	(8, 3, 4),
	(9, 3, 7),
	(10, 3, 2),
	(1, 4, 2),
	(2, 4, 7),
	(3, 4, 3),
	(4, 4, 6),
	(5, 4, 7),
	(6, 4, 8),
	(7, 4, 9),
	(8, 4, 5),
	(9, 4, 4),
	(10, 4, 6)
;
SELECT * FROM tbl_BOOK_COPIES


--QUERY 1
SELECT a1.BOOK_COPIES_No_Of_Copies FROM tbl_BOOK_COPIES a1
INNER JOIN tbl_BOOK a2 ON a2.BOOK_Id = a1.BOOK_COPIES_BookId
INNER JOIN tbl_LIBRARY_BRANCH a3 ON a3.LIBRARY_BRANCH_BranchId = a1.BOOK_COPIES_BranchId
WHERE a2.BOOK_title = 'The Lost Tribe' AND a3.LIBRARY_BRANCH_BranchName = 'Sharpstown';

--QUERY 2
USE db_zoo
Go
CREATE PROCEDURE uspNo_Of_Copies1
	@BookTitle nvarchar(50)
AS
SELECT a3.LIBRARY_BRANCH_BranchName, a1.BOOK_COPIES_No_Of_Copies FROM tbl_BOOK_COPIES a1
INNER JOIN tbl_BOOK a2 ON a2.BOOK_Id = a1.BOOK_COPIES_BookId
INNER JOIN tbl_LIBRARY_BRANCH a3 ON a3.LIBRARY_BRANCH_BranchId = a1.BOOK_COPIES_BranchId
WHERE a2.BOOK_title = @BookTitle;
GO
EXEC uspNo_Of_Copies1 @BookTitle='The Lost Tribe';
--QUERY 3
SELECT a1.BORROWER_Name FROM tbl_BORROWER a1
LEFT JOIN tbl_BOOK_LOANS a2 ON a2.BOOK_LOANS_CardNo = a1.BORROWER_CardNo
WHERE a2.BOOK_LOANS_BookId IS NULL;

-- QUERY 4
SELECT a2.BOOK_title, a3.BORROWER_Name, a3.BORROWER_Address FROM tbl_BOOK_LOANS a1
INNER JOIN tbl_BOOK a2 ON a2.BOOK_Id = a1.BOOK_LOANS_BookId
INNER JOIN tbl_LIBRARY_BRANCH a4 ON a4.LIBRARY_BRANCH_BranchId = a1.BOOK_LOANS_BranchId
INNER JOIN tbl_BORROWER a3 ON a3.BORROWER_CardNo = a1.BOOK_LOANS_CardNo
WHERE a1.BOOK_LOANS_DueDate = '1/10' AND a4.LIBRARY_BRANCH_BranchName = 'Sharpstown';

--QUERY 5
SELECT a1.LIBRARY_BRANCH_BranchName, COUNT(a2.BOOK_LOANS_BookId) 
FROM tbl_LIBRARY_BRANCH a1
INNER JOIN tbl_BOOK_LOANS a2 ON a2.BOOK_LOANS_BranchId = a1.LIBRARY_BRANCH_BranchId
GROUP BY LIBRARY_BRANCH_BranchName;

--QUERY 6
SELECT a2.BORROWER_Name, a2.BORROWER_Address, COUNT(a1.BOOK_LOANS_CardNo)
FROM tbl_BOOK_LOANS a1
INNER JOIN tbl_LIBRARY_BRANCH a3 ON a3.LIBRARY_BRANCH_BranchId = a1.BOOK_LOANS_BranchId
INNER JOIN tbl_BORROWER a2 ON a2.BORROWER_CardNo = a1.BOOK_LOANS_CardNo
GROUP BY a2.BORROWER_Name, a2.BORROWER_Address
HAVING COUNT(a1.BOOK_LOANS_CardNo) > 5;

--QUERY 7
SELECT a1.BOOK_title, a2.BOOK_COPIES_No_Of_Copies
FROM tbl_BOOK a1
INNER JOIN tbl_BOOK_AUTHORS a3 ON a3.BOOK_AUTHORS_BookId = a1.BOOK_Id
INNER JOIN tbl_BOOK_COPIES a2 ON a2.BOOK_COPIES_BookId = a1.BOOK_Id
INNER JOIN tbl_LIBRARY_BRANCH a4 ON a4.LIBRARY_BRANCH_BranchId = a2.BOOK_COPIES_BranchId
WHERE BOOK_AUTHORS_AuthorName = 'Stephen King' AND LIBRARY_BRANCH_BranchName = 'Central';
