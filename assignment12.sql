-- create the database "pizza_orders" --
create database pizza_orders;

-- create the tables to store the data --

create table `customers` (
	`customer_id` INT NOT NULL,
    `name` varchar(50) NULL,
    `number` varchar (50) NULL,
PRIMARY KEY(`customer_id`));

create table `orders` (
	`order_id` INT NOT NULL,
    `order_date` DATETIME NULL,
    `customer_id` INT NULL,
    primary key(`order_id`),
	foreign key(customer_id) references customers (customer_id)
);

create table `pizzas`(
	`pizza_id` INT NOT NULL,
    `type` varchar(50) NULL,
    `price` decimal(4,2),
    primary key(`pizza_id`));

create table `order_info`(
	`order_id` INT NOT NULL,
    `pizza_id` INT NOT NULL,
    `quantity` INT NOT NULL,
foreign key (order_id) references orders(order_id),
foreign key (pizza_id) references pizzas(pizza_id));

-- insert the data values into the tables --
insert into customers(customer_id, name, number)
values(1, "Niles Dobbs", "555-743-6852");

insert into customers(customer_id, name, number)
values(2, "Steve Jobs", "518-453-2367");

insert into customers(customer_id, name, number)
values(3, "Jeff Bezos", "443-354-5476");

select * from customers;

insert into `orders` (order_id, order_date, customer_id)
values (1, "2021-02-02 06:00:50", 1);

insert into `orders` (order_id, order_date, customer_id)
values (2, "2021-02-02 07:12:23", 2);

insert into `orders` (order_id, order_date, customer_id)
values (3, "2021-02-02 09:46:30", 3);

select * from `orders`;

insert into `pizzas` (pizza_id, `type`, `price`)
values (1, "Pepperoni & Cheese", 7.99);

insert into `pizzas` (pizza_id, `type`, `price`)
values (2, "Meat Lovers", 14.99);

insert into `pizzas` (pizza_id, `type`, `price`)
values (3, "Hawaiian", 12.99);

select * from `pizzas`;

insert into `order_info` (order_id, pizza_id, quantity)
values (1, 1, 1);

insert into `order_info` (order_id, pizza_id, quantity)
values (1, 2, 3);

insert into `order_info` (order_id, pizza_id, quantity)
values (2, 1, 1);

insert into `order_info` (order_id, pizza_id, quantity)
values (3, 1, 2);

insert into `order_info` (order_id, pizza_id, quantity)
values (3, 2, 3);

select * from order_info;

-- return the data with all the tables --

select OP.order_id, O.customer_id, P.price, P.`type`, C.`name`
from order_info as OP
left join `orders` as O
on OP.order_id = O.order_id
left join pizzas as P
on OP.pizza_id = P.pizza_id
left join customers as C
on O.customer_id = C.customer.id
order by O.customer_id;


-- total sum each customer spent --
select C.customer_id, C.`name`, sum(price) as total from order_info as OP
join pizzas as P on P.pizza_id = OP.pizza_id
join `orders` as O on O.order_id = OP. order_id
join customers as C on C.customer_id = O.customer_id
group by C.customer_id;