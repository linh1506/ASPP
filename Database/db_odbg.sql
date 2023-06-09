﻿CREATE DATABASE DB_ODBG
go
USE DB_ODBG
go
CREATE TABLE USERS (
	ID INT PRIMARY KEY IDENTITY,
	ADDRESS CHAR(255),
	EMAIL CHAR(100) UNIQUE,
	NAME CHAR(100),
	PASSWORD CHAR(30),
	PHONE CHAR(14),
	ROLE CHAR(10),
	STATUS BIT
)

CREATE TABLE PROMOTION (
	ID INT PRIMARY KEY IDENTITY,
	COUPON_CODE CHAR(10) UNIQUE,
	IS_ACTIVE BIT,
	EXPIRED_AT DATETIME,
	DISCOUNT_VALUE FLOAT,
	NAME CHAR(255),
)

CREATE TABLE ORDERS (
	ID INT PRIMARY KEY IDENTITY,
	AMOUNT INT,
	CREATED_AT DATETIME,
	CREATED_BY INT,
	PROMOTION_ID INT,

	FOREIGN KEY (CREATED_BY) REFERENCES USERS(ID),
	FOREIGN KEY (PROMOTION_ID) REFERENCES PROMOTION(ID)
)

CREATE TABLE BRAND (
	ID INT PRIMARY KEY IDENTITY,
	NAME CHAR(100)
)

CREATE TABLE CATEGORY (
	ID INT PRIMARY KEY IDENTITY,
	NAME CHAR(100)
)

CREATE TABLE PRODUCT (
	ID INT PRIMARY KEY IDENTITY,
	DESCRIPTION VARCHAR(MAX),
	IS_AVAILABLE BIT,
	NAME CHAR(100),
	PRODUCT_IMAGE VARCHAR(MAX),
	PRICE INT,
	BRAND_ID INT,
	CATEGORY_ID INT,

	FOREIGN KEY (BRAND_ID) REFERENCES BRAND(ID),
	FOREIGN KEY (CATEGORY_ID) REFERENCES CATEGORY(ID)
)

CREATE TABLE PRODUCT_SIZE (
	PRODUCT_ID INT,
	SIZE INT,
	QUANTITY INT,

	FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(ID)
)

CREATE TABLE ORDER_ITEMS (
	ID INT PRIMARY KEY IDENTITY,
	PRODUCT_ID INT,
	ORDER_ID INT,
	CREATED_AT DATETIME,
	RECEIVER_ADDRESS CHAR(255),
	RECEIVER_PHONE CHAR(14),
	TOTAL_PRICE INT,
	QUANTITY INT,

	FOREIGN KEY (PRODUCT_ID) REFERENCES PRODUCT(ID),
	FOREIGN KEY (ORDER_ID) REFERENCES ORDERS(ID)
)

INSERT INTO USERS VALUES ('1','1','1','1','1','ADMIN',1)

-- 3/5/23
use DB_ODBG
go
alter table category
add img nvarchar(max) default 'https://i.imgur.com/LZfjaaQ.png'
go
alter table brand
add img nvarchar(max) default 'https://i.imgur.com/uuIkTsO.jpg'
go
update BRAND set img = default
update CATEGORY set img = default
update PRODUCT set PRODUCT_IMAGE = '{"0":"https://i.imgur.com/bvzb5pv.jpg","1":"https://i.imgur.com/V8C7ZC8.jpg","2":"https://i.imgur.com/RRoObHO.png","3":"https://i.imgur.com/wo6ueQ4.png"}'

UPDATE CATEGORY SET img='https://img.freepik.com/premium-photo/bright-female-sneakers-pink-background-fashion-blog-magazine-concept-women-s-shoes-trendy-sneakers-fashion-style-lifestyle-flat-lay-top-view-copy-space-minimal-background_479776-6531.jpg' where id=2
UPDATE CATEGORY SET img='https://t4.ftcdn.net/jpg/04/14/84/53/360_F_414845314_oWmvQVASyyfjYqrSjgHOwjkiourGXPgB.jpg' where id=3

update BRAND set img ='https://i.imgur.com/bVpqXMP.jpeg' where id = 1
update BRAND set img ='https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn1R9MYiBJEW9NH4IPLpy9fWqTc-WnDp1PAANWI04&s' where id = 3

-- 21/5/23

ALTER TABLE ORDERS 
ADD RECEIVER_ADDRESS NVARCHAR(MAX)

ALTER TABLE ORDERS
ADD RECEIVER_PHONE NVARCHAR(14)

ALTER TABLE ORDERS
ADD RECEIVER_NAME NVARCHAR(31)

ALTER TABLE ORDERS
ADD STATUS INT 

ALTER TABLE ORDERS
ADD CONSTRAINT d_Status
DEFAULT 0 for STATUS

ALTER TABLE ORDER_ITEMS
DROP COLUMN RECEIVER_ADDRESS

ALTER TABLE ORDER_ITEMS
DROP COLUMN RECEIVER_PHONE

ALTER TABLE ORDER_ITEMS
DROP COLUMN RECEIVER_PHONE

ALTER TABLE ORDER_ITEMS
ADD SIZE INT

ALTER TABLE ORDER_ITEMS
ADD UNIT_PRICE INT 

GO


CREATE PROC spAddOrders
	@Total bigint,
	@CreatedBy int,
	@IdPromotion int,
	@Address NVARCHAR(MAX),
	@Phone char(14),
	@Name NVARCHAR(31)
AS
	BEGIN
		DECLARE @Result INT
		Set nocount on
		INSERT INTO ORDERS VALUES (@Total, GETDATE(), @CreatedBy, @IdPromotion, @Address, @Phone, @Name,0)
		SELECT @@IDENTITY as Orders
		set nocount off
	END
	
-- 24/5/23
ALTER TABLE USERS 
ALTER COLUMN NAME NVARCHAR(30)

ALTER TABLE USERS 
ALTER COLUMN ADDRESS NVARCHAR(100)

ALTER TABLE BRAND 
ALTER COLUMN NAME NVARCHAR(100)

ALTER TABLE PRODUCT 
ALTER COLUMN DESCRIPTION NVARCHAR(MAX)

ALTER TABLE PRODUCT 
ALTER COLUMN NAME NVARCHAR(100)

ALTER TABLE PROMOTION
ALTER COLUMN NAME NVARCHAR(30)

--25/5/23
ALTER TABLE ORDERS
DROP CONSTRAINT d_Status

ALTER TABLE ORDERS
ALTER COLUMN STATUS INT 

--26/5/23
DELETE FROM ORDER_ITEMS
DELETE FROM ORDERS
DELETE FROM PROMOTION


-- chạy lệnh này
SELECT OBJECT_NAME(f.parent_object_id) AS table_name,
       COL_NAME(fc.parent_object_id, fc.parent_column_id) AS constraint_column,
       OBJECT_NAME (f.referenced_object_id) AS referenced_object,
       COL_NAME(fc.referenced_object_id, fc.referenced_column_id) AS referenced_column,
       f.name AS foreign_key_name
FROM sys.foreign_keys AS f
INNER JOIN sys.foreign_key_columns AS fc ON f.OBJECT_ID = fc.constraint_object_id
WHERE OBJECT_NAME(f.parent_object_id) = 'orders' AND COL_NAME(fc.parent_object_id, fc.parent_column_id) = 'promotion_id';

--copy kết quả lệnh trên paste vào đây
ALTER TABLE ORDERS 
DROP CONSTRAINT FK__ORDERS__PROMOTIO__3E52440B

ALTER TABLE ORDERS
DROP COLUMN PROMOTION_ID

ALTER TABLE ORDERS
ADD PROMOTION_VALUE FLOAT

DROP PROC spAddOrders

GO
CREATE PROC spAddOrders
	@Total bigint,
	@CreatedBy int,
	@PromotionValue float,
	@Address NVARCHAR(MAX),
	@Phone char(14),
	@Name NVARCHAR(31)
AS
	BEGIN
		DECLARE @Result INT
		Set nocount on
		INSERT INTO ORDERS VALUES (@Total, GETDATE(), @CreatedBy, @Address, @Phone, @Name, 0, @PromotionValue)
		SELECT @@IDENTITY as Orders
		set nocount off
	END

	select * from orders
	SELECT * FROM PROMOTION WHERE COUPON_CODE = ''