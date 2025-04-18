create table departments(
                            id integer primary key generated by default as identity not null,
                            building integer not null check (building between 1 and 5),
                            financing numeric not null check (financing >= 0) default 0,
                            floor integer not null check (floor >= 1),
                            name varchar(100) not null check (name != '') unique
);

create table diseases (
                          id integer primary key generated by default as identity not null,
                          name varchar(100) not null check (name <> '') unique,
                          severity integer not null check (severity > 0) default 1
);

create table doctors (
                         id integer primary key generated by default as identity not null,
                         name varchar not null check (length(name) > 0),
                         phone char(10),
                         premium numeric not null check (premium >= 0) default 0,
                         salary numeric not null check (salary > 0),
                         surname varchar not null check (length(surname) > 0)
);

create table examinations (
                              id integer primary key generated by default as identity not null,
                              day_of_week integer not null check (day_of_week between 1 and 7),
                              end_time time not null check (end_time > start_time),
                              name varchar(100) not null check (name != '') unique ,
    start_time time not null check (start_time between '8:00:00' and '18:00:00')
);

create table wards (
                       id integer primary key generated by default as identity not null,
                       building integer not null check (building between 1 and 5),
                       floor integer not null check (floor >= 1),
                       name varchar(20) not null check (name <> '') unique
);

insert into departments (building, financing, floor, name)
VALUES (2, 40000, 3, 'Emergency room'),
       (5, 28000, 4, 'Neurology unit'),
       (3, 7000, 1, 'Pediatric ward'),
       (2, 50000, 2, 'Operating theater'),
       (1, 18000, 5, 'Cardiology unit'),
       (5, 35000, 6, 'Oncology unit '),
       (1, 20000, 4, 'Gynecology unit');

insert into departments (building, financing, floor, name)
values (5, 21000, 3, 'Maternity ward');

insert into departments (building, financing, floor, name)
values (3, 14000, 1, 'Intensive care unit');

select * from departments where building = 5 and financing < 30000;

select * from departments where building = 3 and financing between 12000 and 15000;

select * from departments where (building = 3 or building = 5) and (financing < 11000 or financing > 25000);

insert into wards (building, floor, name)
VALUES (4, 1, 'ward 1'),
       (4, 2, 'ward 2'),
       (5, 1, 'ward 3'),
       (5, 3, 'ward 4'),
       (3, 1, 'ward 5');

select * from wards where building between 4 and 5 and floor = 1;

insert into doctors (name, phone, premium, salary, surname)
VALUES ('Sara', 9994561223, 500, 1100, 'Parker'),
       ('Ken', 9874563212, 1000, 300, 'Negredo'),
       ('Toni', 7894561221, 1500, 1000, 'Stark'),
       ('Katiy', 1236547898, 300, 500, 'Nellson'),
       ('Piter', 4555558585, 1000, 450, 'Parker'),
       ('Stiven', 4444444444, 300, 1000, 'Strainger');

insert into doctors (name, phone, premium, salary, surname)
values ('Jon', 7899877889, 50, 850, 'Kazinski'),
       ('Bob', 1112223344, 100, 1200, 'Never');

select surname from doctors where (premium + salary) > 1500;

select surname from doctors where ((premium + salary) / 2) > (premium * 3);

insert into  diseases (name, severity)
VALUES ('Allergy', 3),
       ('Asthma', 4),
       ('burn', 2),
       ('Cancer', 10),
       ('Cold', 1),
       ('Flu', 3),
       ('Fracture', 5);

select name from diseases where severity > 2;

select name from departments where building != 1 and building != 3;

select name from departments where building = 1 or building = 3;

select surname from doctors where surname like 'N%';