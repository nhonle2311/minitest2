drop database if exists coffee_shop;
create database coffee_shop;
use coffee_shop;

create table orders(
	order_id int not null auto_increment,
    customer_id int not null,
    order_date datetime not null,
    order_status varchar(255)not null,
    total_amount decimal not null,
    primary key(order_id)
);
insert into orders (customer_id, order_date, order_status, total_amount) value (1,'2024-03-27', 'pending', 12.4);
insert into orders (customer_id, order_date, order_status, total_amount) value (2,'2024-03-27', 'pending', 12.4);
