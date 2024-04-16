drop database if exists quan_ly_hoc_vien;
create database quan_ly_hoc_vien;
use quan_ly_hoc_vien;

CREATE TABLE Address (
    id INT PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(255) NOT NULL
);

CREATE TABLE Classes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    language VARCHAR(50) NOT NULL,
    description TEXT
);

CREATE TABLE Students (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(100) NOT NULL,
    address_id INT,
    age INT,
    phone VARCHAR(15) UNIQUE,
    classes_id INT,
    FOREIGN KEY (address_id) REFERENCES Address(id),
    FOREIGN KEY (classes_id) REFERENCES Classes(id)
);

CREATE TABLE Course (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description varchar(255)
);


CREATE TABLE Pointt (
    id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT,
    student_id INT,
    pointt double,
    FOREIGN KEY (student_id) REFERENCES Students(id)
);



INSERT INTO Address (address) VALUES
('123 ABC Street'),
('456 XYZ Street'),
('789 DEF Street'),
('456 GHI Street'),
('789 JKL Street');


INSERT INTO Classes (name, language, description) VALUES
('Class A', 'English', 'Beginner level English class'),
('Class B', 'French', 'Intermediate level French class'),
('Class C', 'Spanish', 'Advanced level Spanish class'),
('Class D', 'German', 'Beginner level German class'),
('Class E', 'Chinese', 'Intermediate level Chinese class');


INSERT INTO Students (fullname, address_id, age, phone, classes_id) VALUES
('Nguyen Van An', 1, 20, '1234567890', 1),
('Tran Thi Binh', 2, 18, '3534543', 2),
('Le Van Cuong', 3, 22, '23434324', 3),
('Pham Thanh Dung', 4, 25, '8978978', 4),
('Hoang Xuan Linh', 5, 19, '213123132', 5),
('Nguyen Van Anh', 1, 21, '0987654321', 1),
('Tran Van Bao', 2, 17, '0123456789', 2),
('Le Thi Cam', 3, 23, '909675675', 3),
('Pham Van Dung', 4, 26, '564523434', 4),
('Hoang Thi Lan', 5, 20, '0909090909', 5);



INSERT INTO Pointt (course_id, student_id, pointt) VALUES
(1, 1, 85), -- Thay đổi giá trị course_id từ 91 thành 1, giả sử course_id = 1 tồn tại trong bảng Course
(1, 2, 75),
(2, 3, 90),
(2, 4, 80),
(3, 5, 95),
(1, 6, 88),
(2, 7, 82),
(3, 8, 93),
(4, 9, 78),
(5, 10, 85),
(1, 1, 90),
(1, 2, 70),
(2, 3, 85),
(2, 4, 75),
(3, 5, 92);


-- Tìm kiếm HV có họ Nguyen
SELECT * FROM Students WHERE fullname LIKE 'Nguyen%';

-- Tìm kiếm HV có tên Anh
SELECT * FROM Students WHERE fullname LIKE '%Anh%';

-- Tìm kiếm HV có độ tuổi từ 18 đến 25
SELECT * FROM Students WHERE age BETWEEN 18 AND 25;

-- Tìm kiếm HV có id là 12 hoặc 13
SELECT * FROM Students WHERE id IN (12, 13);

-- Thống kê số lượng học viên của mỗi lớp
SELECT classes_id, COUNT(*) AS số_lượng_học_viên FROM Students GROUP BY classes_id;

-- Thống kê số lượng học viên tại các tỉnh
SELECT a.address, COUNT(*) AS số_lượng_học_viên
FROM Students s
JOIN Address a ON s.address_id = a.id
GROUP BY a.address;

-- Tính điểm trung bình của các khóa học
SELECT course_id, AVG(pointt) AS điểm_trung_bình FROM Pointt GROUP BY course_id;

-- Lấy ra điểm cao nhất, thấp nhất
SELECT MAX(pointt) AS điểm_cao_nhất, MIN(pointt) AS điểm_thấp_nhất FROM Pointt;

-- Lấy ra danh sách HS, Chuyển đổi tên HS thành chữ hoa
SELECT UPPER(fullname) AS họ_và_tên FROM Students;

