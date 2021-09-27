DROP DATABASE IF EXISTS `student_management`;
CREATE DATABASE `student_management`;
USE `student_management`;

CREATE TABLE`Class`(
ClassID   INT AUTO_INCREMENT primary key,
ClassName VARCHAR(60) NOT NULL,
StartDate DATE NOT NULL ,
Status BIT
);

CREATE TABLE Student(
StudentId   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
StudentName VARCHAR(30) NOT NULL,
Address     VARCHAR (30),
Phone       VARCHAR(30),
Status      BIT,
ClassId     INT NOT NULL,
FOREIGN KEY(ClassId) REFERENCES Class(ClassID)
);

CREATE TABLE Subjects(
 SubId   INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
 SubName VARCHAR(30) NOT NULL,
 Credit  TINYINT NOT NULL DEFAULT 1 CHECK ( Credit >= 1 ),
 Status  BIT DEFAULT 1
);

create table Mark(
MarkId    INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
SubId     INT NOT NULL,
StudentId INT NOT NULL,
Mark      FLOAT   DEFAULT 0 CHECK ( Mark BETWEEN 0 AND 100),
ExamTimes TINYINT DEFAULT 1,
UNIQUE (SubId, StudentId),
FOREIGN KEY (SubId) REFERENCES Subject (SubId),
FOREIGN KEY (StudentId) REFERENCES Student (StudentId)
);