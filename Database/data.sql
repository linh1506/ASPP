use DB_ODBG
go
insert into BRAND values ('Adidas')
insert into BRAND values ('Nike')

insert into BRAND values ('SonShoes')
insert into BRAND values ('NB')

go
insert into CATEGORY values ('Men')
insert into CATEGORY values ('Women')
insert into CATEGORY values ('Kids')

SELECT j.[key], j.[value] FROM PRODUCT t CROSS APPLY OPENJSON(t.PRODUCT_IMAGE) j where ID = 2

SELECT ID, NAME, PRICE, JSON_VALUE(PRODUCT_IMAGE,'$."1"') AS IMAGE FROM PRODUCT 

SELECT * FROM PRODUCT




--05/27/2023
update USERS set ADDRESS = '' where id = 1
update USERS set EMAIL = '' where id = 1
update USERS set NAME = '' where id = 1
update USERS set ADDRESS = '' where id = 1
update USERS set PASSWORD = '' where id = 1
update USERS set PHONE = '' where id = 1

delete ORDER_ITEMS where ORDER_ID in (select id from ORDERS)

delete ORDERS where CREATED_BY = 1