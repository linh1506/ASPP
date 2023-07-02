USE [DB_ODBG]
GO
SET IDENTITY_INSERT [dbo].[USERS] ON 
GO
SET IDENTITY_INSERT [dbo].[USERS] OFF
GO
SET IDENTITY_INSERT [dbo].[ORDERS] ON 
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (1, 3033333, CAST(N'2023-05-27T09:34:16.047' AS DateTime), 1, N'Ha Noi', N'08881         ', N'Gigi', 3, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (2, 2666, CAST(N'2023-05-28T09:43:00.580' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (3, 11111, CAST(N'2023-05-28T09:49:40.770' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (4, 1000000, CAST(N'2023-05-28T09:53:32.813' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (5, 1333, CAST(N'2023-05-28T09:54:59.173' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (6, 1011111, CAST(N'2023-05-28T09:55:13.807' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (7, 1000000, CAST(N'2023-05-28T10:00:15.353' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (8, 11111, CAST(N'2023-05-28T10:00:29.380' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (9, 5000000, CAST(N'2023-05-28T10:06:47.113' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (10, 55555, CAST(N'2023-05-28T10:07:00.517' AS DateTime), 1, N'1', N'1             ', N'1', 3, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (11, 2666, CAST(N'2023-05-28T10:26:51.497' AS DateTime), 1, N'1', N'1             ', N'1', 3, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (12, 1000000, CAST(N'2023-05-28T10:27:40.897' AS DateTime), 1, N'1', N'1             ', N'1', 3, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (13, 1000000, CAST(N'2023-05-28T10:28:04.210' AS DateTime), 1, N'1', N'1             ', N'1', 3, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (14, 1000000, CAST(N'2023-05-28T10:43:40.040' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (15, 1000000, CAST(N'2023-05-29T08:23:28.230' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (16, 1333, CAST(N'2023-05-29T08:26:16.580' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (17, 2000000, CAST(N'2023-05-30T11:33:19.470' AS DateTime), 1, N'Ha Noi', N'08888         ', N'Hehe', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (18, 2666, CAST(N'2023-05-30T11:38:19.270' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (19, 1000000, CAST(N'2023-05-30T11:49:16.950' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (20, 1333, CAST(N'2023-05-30T20:11:42.150' AS DateTime), 1, N'1', N'261002        ', N'1', 0, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (21, 700000, CAST(N'2023-05-30T22:21:32.980' AS DateTime), 1, N'1', N'1             ', N'1', 0, 0.3)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (22, 7280000, CAST(N'2023-06-05T08:22:20.680' AS DateTime), 1, N'1', N'1             ', N'1', 0, 0.3)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (23, 3500000, CAST(N'2023-06-05T08:24:50.803' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0.3)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (24, 3640000, CAST(N'2023-06-06T09:34:35.503' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0.3)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (25, 1000000, CAST(N'2023-06-10T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (26, 1000000, CAST(N'2023-04-10T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (27, 1000000, CAST(N'2023-04-10T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (28, 1000000, CAST(N'2023-04-10T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (29, 1000000, CAST(N'2023-04-10T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (30, 1000000, CAST(N'2023-04-10T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (31, 1000000, CAST(N'2023-04-10T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (32, 1000000, CAST(N'2023-04-10T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (33, 1000000, CAST(N'2023-04-10T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (34, 1000000, CAST(N'2023-04-10T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (35, 1000000, CAST(N'2023-04-10T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (36, 1000000, CAST(N'2023-04-10T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (37, 1000000, CAST(N'2023-04-10T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (38, 1000000, CAST(N'2023-04-10T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (39, 1000000, CAST(N'2023-04-10T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (40, 1000000, CAST(N'2023-03-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (41, 1000000, CAST(N'2023-03-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (42, 1000000, CAST(N'2023-03-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (43, 1000000, CAST(N'2023-03-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (44, 1000000, CAST(N'2023-03-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (45, 1000000, CAST(N'2023-03-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (46, 1000000, CAST(N'2023-03-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (47, 1000000, CAST(N'2023-03-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (48, 1000000, CAST(N'2023-03-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (49, 1000000, CAST(N'2023-03-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (50, 1000000, CAST(N'2023-02-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (51, 1000000, CAST(N'2023-02-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (52, 1000000, CAST(N'2023-02-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (53, 1000000, CAST(N'2023-02-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (54, 1000000, CAST(N'2023-02-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (55, 1000000, CAST(N'2023-02-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (56, 1000000, CAST(N'2023-02-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (57, 1000000, CAST(N'2023-02-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (58, 1000000, CAST(N'2023-02-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
INSERT [dbo].[ORDERS]
    ([ID], [AMOUNT], [CREATED_AT], [CREATED_BY], [RECEIVER_ADDRESS], [RECEIVER_PHONE], [RECEIVER_NAME], [STATUS], [PROMOTION_VALUE])
VALUES
    (59, 1000000, CAST(N'2023-02-21T16:24:34.060' AS DateTime), 1, N'1', N'1             ', N'1', 2, 0)
GO
SET IDENTITY_INSERT [dbo].[ORDERS] OFF
GO
SET IDENTITY_INSERT [dbo].[BRAND] ON 
GO
INSERT [dbo].[BRAND]
    ([ID], [NAME], [img])
VALUES
    (1, N'Adidas                                                                                              ', N'https://i.imgur.com/bVpqXMP.jpeg')
GO
INSERT [dbo].[BRAND]
    ([ID], [NAME], [img])
VALUES
    (2, N'Nike                                                                                                ', N'https://i.imgur.com/uuIkTsO.jpg')
GO
INSERT [dbo].[BRAND]
    ([ID], [NAME], [img])
VALUES
    (3, N'SonShoes                                                                                            ', N'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRn1R9MYiBJEW9NH4IPLpy9fWqTc-WnDp1PAANWI04&s')
GO
INSERT [dbo].[BRAND]
    ([ID], [NAME], [img])
VALUES
    (4, N'NB                                                                                                  ', N'https://i.imgur.com/uuIkTsO.jpg')
GO
SET IDENTITY_INSERT [dbo].[BRAND] OFF
GO
SET IDENTITY_INSERT [dbo].[CATEGORY] ON 
GO
INSERT [dbo].[CATEGORY]
    ([ID], [NAME], [img])
VALUES
    (1, N'Men                                                                                                 ', N'https://i.imgur.com/LZfjaaQ.png')
GO
INSERT [dbo].[CATEGORY]
    ([ID], [NAME], [img])
VALUES
    (2, N'Women                                                                                               ', N'https://img.freepik.com/premium-photo/bright-female-sneakers-pink-background-fashion-blog-magazine-concept-women-s-shoes-trendy-sneakers-fashion-style-lifestyle-flat-lay-top-view-copy-space-minimal-background_479776-6531.jpg')
GO
INSERT [dbo].[CATEGORY]
    ([ID], [NAME], [img])
VALUES
    (3, N'Kids                                                                                                ', N'https://t4.ftcdn.net/jpg/04/14/84/53/360_F_414845314_oWmvQVASyyfjYqrSjgHOwjkiourGXPgB.jpg')
GO
SET IDENTITY_INSERT [dbo].[CATEGORY] OFF
GO
SET IDENTITY_INSERT [dbo].[PRODUCT] ON 
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (1, N'<p>Tráº£i nghiá»‡m nguá»“n nÄƒng lÆ°á»£ng vÆ°á»£t trá»™i vá»›i gi&agrave;y Ultraboost Light má»›i, phi&ecirc;n báº£n Ultraboost nháº¹ nháº¥t cá»§a ch&uacute;ng t&ocirc;i. Sá»± ká»³ diá»‡u náº±m á»Ÿ Ä‘áº¿ giá»¯a Light BOOST, tháº¿ há»‡ má»›i cá»§a Ä‘á»‡m adidas BOOST. Thiáº¿t káº¿ ph&acirc;n tá»­ Ä‘á»™c Ä‘&aacute;o cá»§a máº«u gi&agrave;y n&agrave;y Ä‘áº¡t Ä‘áº¿n cháº¥t liá»‡u m&uacute;t xá»‘p BOOST nháº¹ nháº¥t tá»« trÆ°á»›c Ä‘áº¿n nay. Vá»›i h&agrave;ng trÄƒm háº¡t BOOST b&ugrave;ng ná»• nÄƒng lÆ°á»£ng c&ugrave;ng cáº£m gi&aacute;c &ecirc;m &aacute;i v&agrave; thoáº£i m&aacute;i tá»™t Ä‘á»‰nh, Ä‘&ocirc;i ch&acirc;n báº¡n thá»±c sá»± sáº½ Ä‘Æ°á»£c tráº£i nghiá»‡m táº¥t cáº£.</p>
', 1, N'Ultraboost light', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/9d8d07750bdb4647aee6af7b00976341_9366/Giay_Ultraboost_Light_DJen_GZ5159_01_standard.jpg","1":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/216948046f724bdfb41eaf8900f8e196_9366/Giay_Ultraboost_Light_DJen_GZ5159_010_hover_standard.jpg"}', 5200000, 1, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (2, N'<p>hehe</p>
', 1, N'X_PLRBOOST', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/909cd24b43ad45e19d70af56015788f0_9366/Giay_X_PLRBOOST_trang_HP3130_01_standard.jpg"}', 3200000, 1, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (3, N'', 1, N'RESPONSE CL', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/01a49a28f1024f94a5c5975ee1782202_9366/Giay_Response_CL_mau_xanh_la_ID4593_01_standard.jpg","1":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/58a46580ff504a1db1d45a7e4caf4261_9366/Giay_Response_CL_mau_xanh_la_ID4593_02_standard_hover.jpg","2":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/35c45beae1b1410a9d131e646d79e787_9366/Giay_Response_CL_mau_xanh_la_ID4593_04_standard.jpg"}', 320000, 2, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (4, N'<p>Hehe</p>
', 1, N'NMD_V3', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/2746a35151d84b0abbb9af480005c028_9366/Giay_NMD_V3_Mau_xanh_da_troi_HQ4447_01_standard.jpg"}', 2500000, 1, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (6, N'<p>sds</p>
', 1, N'Nike Tech Hera', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/3d6b13a2-4b2b-43c1-9de2-0d39331b5fd9/tech-hera-shoes-JlV5km.png","1":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/6f796d34-61fc-453d-9715-1caa240b273f/tech-hera-shoes-JlV5km.png"}', 3200000, 2, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (7, N'<p>sdasda</p>
', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (8, N'<p>dfd&agrave;áº§</p>
', 1, N'Air Force 1 ''07 FlyEase', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/0030f99e-f45d-4042-b3e1-669952e3c24e/air-force-1-07-flyease-shoes-LKXPhZ.png"}', 1000000, 2, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (9, N'', 1, N'NB 574 classic', N'{"0":"https://nb.scene7.com/is/image/NB/ml574evg_nb_05_i?$pdpflexf2$&qlt=80&fmt=webp&wid=440&hei=440"}', 2000000, 4, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (10, N'', 1, N'Nike Pegasus Trail 4', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/c42a4cc9-1672-4759-90b1-8baadd8a413b/pegasus-trail-4-trail-running-shoes-ccqgBb.png"}', 3000000, 2, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (11, N'', 1, N'Nike Team Hustle D 11', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/3e8bcdc2-b599-4658-a984-b31c3e33033e/team-hustle-d-11-older-basketball-shoes-q4t8cZ.png"}', 1500000, 2, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (12, N'', 1, N'Air Jordan 1 Mid SE', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/eb1c47fa-139c-495d-bf60-4428a3322820/air-jordan-1-mid-se-older-shoes-BF21nm.png"}', 2500000, 2, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (13, N'', 1, N'ALPHABOOST V1', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/fae03e6847884e868c2222598627101d_9366/Giay_Alphaboost_V1_trai_cam_IE9975_01_standard.jpg"}', 4300000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (14, N'', 1, N'SUPERNOVA 3', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/897deee30b3b4cc589a5f8147f5f4fdc_9366/Giay_Chay_Bo_Supernova_3_DJen_IE4348_01_standard.jpg"}', 3000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (15, N'', 1, N'X_PLRPHASE', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 3000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (16, N'', 1, N'Fresh Foam X 880v13', N'{"0":"https://nb.scene7.com/is/image/NB/m880n13_nb_02_i?$pdpflexf2$&qlt=80&fmt=webp&wid=440&hei=440","1":"https://nb.scene7.com/is/image/NB/m880n13_nb_05_i?$pdpflexf2$&qlt=80&fmt=webp&wid=440&hei=440"}', 4000000, 4, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (17, N'', 1, N'MADE in USA 993 Core', N'{"0":"https://nb.scene7.com/is/image/NB/mr993gl_nb_02_i?$pdpflexf2$&qlt=80&fmt=webp&wid=440&hei=440"}', 3400000, 4, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (18, N'', 1, N'New Balance 550', N'{"0":"https://nb.scene7.com/is/image/NB/bb550swa_nb_02_i?$pdpflexf2$&qlt=80&fmt=webp&wid=440&hei=440"}', 2900000, 4, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (19, N'', 1, N'9060', N'{"0":"https://nb.scene7.com/is/image/NB/u9060hsa_nb_05_i?$pdpflexf2$&qlt=80&fmt=webp&wid=440&hei=440"}', 5000000, 4, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (20, N'', 1, N'New Balance 650', N'{"0":"https://nb.scene7.com/is/image/NB/bb650rcg_nb_02_i?$pdpflexf2$&qlt=80&fmt=webp&wid=440&hei=440"}', 1200000, 4, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (21, N'', 0, N'NewBalance 580', N'{"0":"https://nb.scene7.com/is/image/NB/mt580hsb_nb_02_i?$pdpflexf2$&qlt=80&fmt=webp&wid=440&hei=440"}', 2300000, 4, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (22, N'', 1, N'FuelCell 990v6', N'{"0":"https://nb.scene7.com/is/image/NB/gc990tc6_nb_05_i?$pdpflexf2$&qlt=80&fmt=webp&wid=440&hei=440"}', 1000000, 4, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (23, N'', 1, N'BB550', N'{"0":"https://nb.scene7.com/is/image/NB/bb550ha1_nb_05_i?$pdpflexf2$&qlt=80&fmt=webp&wid=440&hei=440"}', 5000000, 4, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (24, N'<p>sdasda</p>
', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (25, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (26, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (28, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (29, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (30, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (31, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (32, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (33, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (34, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (35, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (36, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (37, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (38, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (39, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (40, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (41, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (42, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (43, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://static.nike.com/a/images/t_PDP_864_v1/f_auto,b_rgb:f5f5f5/84d63481-ceb5-4c4e-a2dc-1f69a9d8fcc5/air-jordan-1-mid-se-shoes-lCj12k.png"}', 4000000, 1, 2)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (44, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 1000000, 1, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (45, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 1000000, 1, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (46, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 1000000, 1, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (47, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 1000000, 1, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (48, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 1000000, 1, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (49, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 1000000, 1, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (50, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 1000000, 1, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (51, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 1000000, 1, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (52, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 1000000, 1, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (53, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 1000000, 1, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (54, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 1000000, 1, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (55, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 1000000, 1, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (56, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 1000000, 1, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (57, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 1000000, 1, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (58, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 1000000, 1, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (59, N'<p>sdasda</p>', 1, N'Air Jordan 1 Mid', N'{"0":"https://assets.adidas.com/images/h_840,f_auto,q_auto,fl_lossy,c_fill,g_auto/bee0798fbad64a29873b82b3c4090744_9366/Giay_X_PLRPHASE_Xam_IG4781_01_standard.jpg"}', 1000000, 1, 3)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (60, N'<p>sdasda</p>', 1, N'Air Jordan 1 Zoom CMFT 2', N'{"0":"https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/58226b3f-3933-4eb6-889e-b9078f15c5d3/air-jordan-1-zoom-cmft-2-shoes-nX8Qqx.png"}', 1000000, 2, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (61, N'<p>sdasda</p>', 1, N'Air Jordan 1 Zoom CMFT 2', N'{"0":"https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/58226b3f-3933-4eb6-889e-b9078f15c5d3/air-jordan-1-zoom-cmft-2-shoes-nX8Qqx.png"}', 1000000, 2, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (62, N'<p>sdasda</p>', 1, N'Air Jordan 1 Zoom CMFT 2', N'{"0":"https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/58226b3f-3933-4eb6-889e-b9078f15c5d3/air-jordan-1-zoom-cmft-2-shoes-nX8Qqx.png"}', 1000000, 2, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (63, N'<p>sdasda</p>', 1, N'Air Jordan 1 Zoom CMFT 2', N'{"0":"https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/58226b3f-3933-4eb6-889e-b9078f15c5d3/air-jordan-1-zoom-cmft-2-shoes-nX8Qqx.png"}', 1000000, 2, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (64, N'<p>sdasda</p>', 1, N'Air Jordan 1 Zoom CMFT 2', N'{"0":"https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/58226b3f-3933-4eb6-889e-b9078f15c5d3/air-jordan-1-zoom-cmft-2-shoes-nX8Qqx.png"}', 1000000, 2, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (65, N'<p>sdasda</p>', 1, N'Air Jordan 1 Zoom CMFT 2', N'{"0":"https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/58226b3f-3933-4eb6-889e-b9078f15c5d3/air-jordan-1-zoom-cmft-2-shoes-nX8Qqx.png"}', 1000000, 2, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (66, N'<p>sdasda</p>', 1, N'Air Jordan 1 Zoom CMFT 2', N'{"0":"https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/58226b3f-3933-4eb6-889e-b9078f15c5d3/air-jordan-1-zoom-cmft-2-shoes-nX8Qqx.png"}', 1000000, 2, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (67, N'<p>sdasda</p>', 1, N'Air Jordan 1 Zoom CMFT 2', N'{"0":"https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/58226b3f-3933-4eb6-889e-b9078f15c5d3/air-jordan-1-zoom-cmft-2-shoes-nX8Qqx.png"}', 1000000, 2, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (68, N'<p>sdasda</p>', 1, N'Air Jordan 1 Zoom CMFT 2', N'{"0":"https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/58226b3f-3933-4eb6-889e-b9078f15c5d3/air-jordan-1-zoom-cmft-2-shoes-nX8Qqx.png"}', 1000000, 2, 1)
GO
INSERT [dbo].[PRODUCT]
    ([ID], [DESCRIPTION], [IS_AVAILABLE], [NAME], [PRODUCT_IMAGE], [PRICE], [BRAND_ID], [CATEGORY_ID])
VALUES
    (69, N'<p>sdasda</p>', 1, N'Air Jordan 1 Zoom CMFT 2', N'{"0":"https://static.nike.com/a/images/t_PDP_1728_v1/f_auto,q_auto:eco/58226b3f-3933-4eb6-889e-b9078f15c5d3/air-jordan-1-zoom-cmft-2-shoes-nX8Qqx.png"}', 1000000, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[PRODUCT] OFF
GO
SET IDENTITY_INSERT [dbo].[ORDER_ITEMS] ON 
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (1, 1, 1, CAST(N'2023-05-27T09:34:16.077' AS DateTime), 3000000, 3, 43, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (2, 3, 1, CAST(N'2023-05-27T09:34:16.120' AS DateTime), 33333, 3, 22, 11111)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (3, 2, 2, CAST(N'2023-05-28T09:43:00.600' AS DateTime), 2666, 2, 44, 1333)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (4, 3, 3, CAST(N'2023-05-28T09:49:40.800' AS DateTime), 11111, 1, 22, 11111)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (5, 1, 4, CAST(N'2023-05-28T09:53:32.843' AS DateTime), 1000000, 1, 43, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (6, 2, 5, CAST(N'2023-05-28T09:54:59.203' AS DateTime), 1333, 1, 44, 1333)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (7, 1, 6, CAST(N'2023-05-28T09:55:13.833' AS DateTime), 1000000, 1, 43, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (8, 3, 6, CAST(N'2023-05-28T09:55:13.873' AS DateTime), 11111, 1, 22, 11111)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (9, 1, 7, CAST(N'2023-05-28T10:00:15.370' AS DateTime), 1000000, 1, 43, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (10, 3, 8, CAST(N'2023-05-28T10:00:29.397' AS DateTime), 11111, 1, 22, 11111)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (11, 1, 9, CAST(N'2023-05-28T10:06:47.137' AS DateTime), 5000000, 5, 43, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (12, 3, 10, CAST(N'2023-05-28T10:07:00.540' AS DateTime), 55555, 5, 22, 11111)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (13, 2, 11, CAST(N'2023-05-28T10:26:51.510' AS DateTime), 2666, 2, 44, 1333)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (14, 1, 12, CAST(N'2023-05-28T10:27:40.910' AS DateTime), 1000000, 1, 43, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (15, 1, 13, CAST(N'2023-05-28T10:28:04.227' AS DateTime), 1000000, 1, 43, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (16, 1, 14, CAST(N'2023-05-28T10:43:40.053' AS DateTime), 1000000, 1, 43, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (17, 4, 15, CAST(N'2023-05-29T08:23:28.277' AS DateTime), 1000000, 1, 50, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (18, 2, 16, CAST(N'2023-05-29T08:26:16.623' AS DateTime), 1333, 1, 44, 1333)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (19, 4, 17, CAST(N'2023-05-30T11:33:19.493' AS DateTime), 2000000, 2, 50, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (20, 2, 18, CAST(N'2023-05-30T11:38:19.293' AS DateTime), 2666, 2, 44, 1333)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (21, 1, 19, CAST(N'2023-05-30T11:49:16.973' AS DateTime), 1000000, 1, 43, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (22, 2, 20, CAST(N'2023-05-30T20:11:42.173' AS DateTime), 1333, 1, 44, 1333)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (23, 4, 21, CAST(N'2023-05-30T22:21:33.010' AS DateTime), 1000000, 1, 50, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (24, 1, 22, CAST(N'2023-06-05T08:22:20.730' AS DateTime), 10400000, 2, 38, 5200000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (25, 23, 23, CAST(N'2023-06-05T08:24:50.843' AS DateTime), 5000000, 1, 36, 5000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (26, 1, 24, CAST(N'2023-06-06T09:34:35.553' AS DateTime), 5200000, 1, 40, 5200000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (27, 8, 25, CAST(N'2023-06-10T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (28, 8, 26, CAST(N'2023-04-10T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (29, 8, 27, CAST(N'2023-04-10T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (30, 8, 28, CAST(N'2023-04-10T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (31, 8, 29, CAST(N'2023-04-10T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (32, 8, 30, CAST(N'2023-04-10T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (33, 8, 31, CAST(N'2023-04-10T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (34, 8, 32, CAST(N'2023-04-10T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (35, 8, 33, CAST(N'2023-04-10T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (36, 8, 34, CAST(N'2023-04-10T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (37, 8, 35, CAST(N'2023-04-10T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (38, 8, 36, CAST(N'2023-04-10T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (39, 8, 37, CAST(N'2023-04-10T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (40, 8, 38, CAST(N'2023-04-10T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (41, 8, 39, CAST(N'2023-04-10T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (42, 8, 40, CAST(N'2023-03-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (43, 8, 41, CAST(N'2023-03-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (44, 8, 42, CAST(N'2023-03-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (45, 8, 43, CAST(N'2023-03-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (46, 8, 44, CAST(N'2023-03-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (47, 8, 45, CAST(N'2023-03-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (48, 8, 46, CAST(N'2023-03-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (49, 8, 47, CAST(N'2023-03-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (50, 8, 48, CAST(N'2023-03-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (51, 8, 49, CAST(N'2023-03-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (52, 8, 50, CAST(N'2023-02-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (53, 8, 51, CAST(N'2023-02-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (54, 8, 52, CAST(N'2023-02-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (55, 8, 53, CAST(N'2023-02-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (56, 8, 54, CAST(N'2023-02-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (57, 8, 55, CAST(N'2023-02-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (58, 8, 56, CAST(N'2023-02-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (59, 8, 57, CAST(N'2023-02-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (60, 8, 58, CAST(N'2023-02-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
INSERT [dbo].[ORDER_ITEMS]
    ([ID], [PRODUCT_ID], [ORDER_ID], [CREATED_AT], [TOTAL_PRICE], [QUANTITY], [SIZE], [UNIT_PRICE])
VALUES
    (61, 8, 59, CAST(N'2023-02-21T16:24:34.087' AS DateTime), 1000000, 1, 45, 1000000)
GO
SET IDENTITY_INSERT [dbo].[ORDER_ITEMS] OFF
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (1, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (2, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (9, 44, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (4, 41, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (6, 38, 35)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (7, 39, 11)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (3, 22, 0)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (1, 38, 98)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (1, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (1, 40, 99)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (1, 41, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (2, 40, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (2, 41, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (6, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (6, 40, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (7, 40, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (8, 45, 1000)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (10, 40, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (11, 30, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (12, 29, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (13, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (14, 33, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (15, 40, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (16, 40, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (17, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (18, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (19, 29, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (20, 28, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (21, 22, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (22, 19, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (23, 36, 99)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (1, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (2, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (4, 41, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (6, 38, 35)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (7, 39, 11)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (3, 22, 0)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (1, 38, 98)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (1, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (1, 40, 99)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (1, 41, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (2, 40, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (2, 41, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (6, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (6, 40, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (7, 40, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (8, 46, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (10, 40, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (11, 30, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (12, 29, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (13, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (14, 33, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (15, 40, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (16, 40, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (17, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (18, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (19, 29, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (20, 28, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (21, 22, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (22, 19, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (23, 36, 99)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (26, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (26, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (26, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (28, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (28, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (28, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (29, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (29, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (29, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (30, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (30, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (30, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (31, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (31, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (31, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (32, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (32, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (32, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (33, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (33, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (33, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (34, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (34, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (34, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (35, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (35, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (35, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (36, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (36, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (36, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (37, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (37, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (37, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (38, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (38, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (38, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (39, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (39, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (39, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (40, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (40, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (40, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (41, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (41, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (41, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (42, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (42, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (42, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (43, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (43, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (43, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (44, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (44, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (44, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (45, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (45, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (45, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (46, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (46, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (46, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (47, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (47, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (47, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (48, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (48, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (48, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (49, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (49, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (49, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (50, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (50, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (50, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (51, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (51, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (51, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (52, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (52, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (52, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (53, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (53, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (53, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (54, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (54, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (54, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (55, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (55, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (55, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (56, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (56, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (56, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (57, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (57, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (57, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (58, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (58, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (58, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (59, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (59, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (59, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (60, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (60, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (60, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (61, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (61, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (61, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (62, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (62, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (62, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (63, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (63, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (63, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (64, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (64, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (64, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (65, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (65, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (65, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (66, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (66, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (66, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (67, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (67, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (67, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (68, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (68, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (68, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (69, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (69, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (69, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (9, 44, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (24, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (24, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (24, 39, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (25, 37, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (25, 38, 100)
GO
INSERT [dbo].[PRODUCT_SIZE]
    ([PRODUCT_ID], [SIZE], [QUANTITY])
VALUES
    (25, 39, 100)
GO
SET IDENTITY_INSERT [dbo].[PROMOTION] ON 
GO
INSERT [dbo].[PROMOTION]
    ([ID], [COUPON_CODE], [IS_ACTIVE], [EXPIRED_AT], [DISCOUNT_VALUE], [NAME])
VALUES
    (1, N'lmao1     ', 0, CAST(N'2023-05-31T00:00:00.000' AS DateTime), 0.3, N'hehe')
GO
SET IDENTITY_INSERT [dbo].[PROMOTION] OFF
GO
