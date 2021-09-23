USE `student_management`;

CREATE TABLE class(
id INT NOT NULL,
`name` VARCHAR(50),
PRIMARY KEY(`id`));

CREATE TABLE teacher(
id INT NOT NULL,
`name` VARCHAR(50),
age INT ,
`country` VARCHAR(50),
PRIMARY KEY(`id`));