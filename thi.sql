drop database if exists thi;
create database if not exists thi ;
use thi ;
CREATE TABLE `class` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `nameC` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `class` (`nameC`) VALUES ('Class 1');
INSERT INTO `class` (`nameC`) VALUES ('Class 2');
INSERT INTO `class` (`nameC`) VALUES ('Class 3');
INSERT INTO `class` (`nameC`) VALUES ('Class 4');
INSERT INTO `class` (`nameC`) VALUES ('Class 5');

CREATE TABLE `student` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `dates` DATE NOT NULL,
    `address` VARCHAR(255) NOT NULL,
    `phone` VARCHAR(255) NOT NULL,
    `id_class` INT,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id_class`) REFERENCES `class`(`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO `student` (`name`, `email`, `dates`, `address`, `phone`, `id_class`) VALUES
('Student 1', 'student1@example.com', '2023-01-01', '123 Main St', '555-0101', 1),
('Student 2', 'student2@example.com', '2023-02-01', '456 Elm St', '555-0202', 2),
('Student 3', 'student3@example.com', '2023-03-01', '789 Pine St', '555-0303', 3),
('Student 4', 'student4@example.com', '2023-04-01', '321 Oak St', '555-0404', 4),
('Student 5', 'student5@example.com', '2023-05-01', '654 Maple St', '555-0505', 5);
