use DB_ODBG
go
create view monthlySales as
	SELECT top 100 percent
		DATEPART(year, CREATED_AT) AS Year,
		DATEPART(month, CREATED_AT) AS Month,
		SUM(AMOUNT) AS TotalEarnings
	FROM 
		ORDERS
	GROUP BY 
		DATEPART(year, CREATED_AT),
		DATEPART(month, CREATED_AT)
	ORDER BY 
		Year, Month
go
create view topProducts as
	SELECT
	top 3
		PRODUCT_ID,
		p.NAME,
		p.img,
		COUNT(*) AS Frequency
	FROM 
		ORDER_ITEMS
	join (select * from (SELECT ID, PRICE, NAME, IS_AVAILABLE,  JSON_VALUE(PRODUCT_IMAGE, '$."0"') AS img FROM PRODUCT) subquery) as p on ORDER_ITEMS.PRODUCT_ID = p.ID
	WHERE
		CREATED_AT >= DATEADD(month, -5, GETDATE())
	GROUP BY 
		PRODUCT_ID, p.NAME, p.img
	ORDER BY 
		Frequency DESC;
go
create view productSales as
	SELECT
		PRODUCT_ID,
		PRODUCT.NAME,
		COUNT(*) AS Frequency
	FROM 
		ORDER_ITEMS
	join PRODUCT on ORDER_ITEMS.PRODUCT_ID = PRODUCT.ID
	WHERE
		CREATED_AT >= DATEADD(month, -5, GETDATE())
	GROUP BY 
		PRODUCT_ID, PRODUCT.NAME
go
--test du lieu
drop view topProducts
select * from monthlySales
select * from topProducts
select * from productSales