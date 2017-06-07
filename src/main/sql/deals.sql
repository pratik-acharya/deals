

INSERT INTO `Category` (`id`, `name`) VALUES (1, 'Appliances'),(2, 'Furnitures'),(3, 'General'),(4, 'Books'),(5, 'Electronics');




INSERT INTO `Role` (`id`, `type`) VALUES (1, 'USER'),(2, 'ADMIN');


INSERT INTO `User` (`id`, `email`, `name`, `password`, `photo`, `status`, `location_id`, `phone_id`) VALUES(2, 'admin@deals.com', 'admin', '$2a$10$3tIwxwMCXvFWkpDwbOqebeyccp.Z4OGTIkv4JO7DFXSxrZDPuO5I6', NULL, 0, NULL, NULL),(3, 'seller@deals.com', 'seller', '$2a$10$DUR6TWOSvBc0Ek3P124zmORfwOTUvCmeZhod1j9KreIvy0h6ddbp6', NULL, 0, NULL, NULL),(4, 'buyer@deals.com', 'buyer', '$2a$10$CNdaZ5iz9e234567MgQrTO5Y8qzZzcYb.X9zUvcDXvRxVSozUzJ2C', NULL, 0, NULL, NULL);




INSERT INTO `Deal` (`id`, `d_condition`, `description`, `negotiable`, `price`, `timestamp`, `title`, `type`, `until`, `used`, `category_id`, `user_id`) VALUES(1, 'Needs repair', 'It needs repair. ', 1, 23, '2017-02-11 17:36:21', 'Shoes', 'offer', NULL, 1, 3, 3),(3, 'Excellent', 'Headphones', 1, 1, '2017-02-11 17:41:04', 'Wireless Headphones', 'offer', NULL, 1, 5, 3),(7, 'Excellent', 'Furnitures, good for you', 1, 1000, '2017-02-11 17:47:41', 'Sofa sets', 'offer', NULL, 1, 2, 3),(8, 'Excellent', 'This is a razor. i have used for just one month.', 1, 3, '2017-02-11 17:50:24', 'Razor', 'offer', NULL, 1, 3, 3),(9, 'Excellent', 'This is bag', 1, 2200, '2017-02-11 17:51:03', 'Bag', 'offer', NULL, 1, 1, 3),(10, 'Excellent', 'cool', 1, 234, '2017-02-11 17:52:07', 'Shoes', 'offer', NULL, 1, 3, 3),(11, 'Excellent', 'cap', 0, 12, '2017-02-11 17:52:50', 'Cap', 'offer', NULL, 0, 3, 3);

INSERT INTO `UserRole` (`user_id`, `role_id`) VALUES(2, 1),(3, 1),(4, 1),(2, 2);