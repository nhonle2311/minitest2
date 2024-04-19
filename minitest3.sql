drop database if exists minitest3;
create database minitest3;
use minitest3;

-- Tạo bảng Vật tư
CREATE TABLE VatTu (
    id INT PRIMARY KEY,
    ma_vat_tu VARCHAR(50),
    ten_vat_tu VARCHAR(100),
    don_vi_tinh VARCHAR(50),
    gia_tien DECIMAL(18, 2)
);

-- Chèn dữ liệu vào bảng Vật tư
INSERT INTO VatTu (id, ma_vat_tu, ten_vat_tu, don_vi_tinh, gia_tien) VALUES
(1, 'VT001', 'Ví dụ vật tư 1', 'Cái', 10000),
(2, 'VT002', 'Ví dụ vật tư 2', 'Hộp', 5000),
(3, 'VT003', 'Ví dụ vật tư 3', 'Chiếc', 7000);

-- Tạo bảng Tồn kho
CREATE TABLE TonKho (
    id INT PRIMARY KEY,
    vat_tu_id INT,
    so_luong_dau INT,
    tong_so_luong_nhap INT,
    tong_so_luong_xuat INT,
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);

-- Chèn dữ liệu vào bảng Tồn kho
INSERT INTO TonKho (id, vat_tu_id, so_luong_dau, tong_so_luong_nhap, tong_so_luong_xuat) VALUES
(1, 1, 50, 100, 40),
(2, 2, 30, 80, 50),
(3, 3, 20, 60, 30);

-- Tạo bảng Nhà Cung cấp
CREATE TABLE NhaCungCap (
    id INT PRIMARY KEY,
    ma_nha_cung_cap VARCHAR(50),
    ten_nha_cung_cap VARCHAR(100),
    dia_chi VARCHAR(200),
    so_dien_thoai VARCHAR(20)
);

-- Chèn dữ liệu vào bảng Nhà Cung cấp
INSERT INTO NhaCungCap (id, ma_nha_cung_cap, ten_nha_cung_cap, dia_chi, so_dien_thoai) VALUES
(1, 'NCC001', 'Nhà cung cấp 1', 'Địa chỉ 1', '0123456789'),
(2, 'NCC002', 'Nhà cung cấp 2', 'Địa chỉ 2', '0987654321'),
(3, 'NCC003', 'Nhà cung cấp 3', 'Địa chỉ 3', '0369852147');

-- Tạo bảng Đơn đặt hàng
CREATE TABLE DonDatHang (
    id INT PRIMARY KEY,
    ma_don VARCHAR(50),
    ngay_dat_hang DATE,
    nha_cung_cap_id INT,
    FOREIGN KEY (nha_cung_cap_id) REFERENCES NhaCungCap(id)
);

-- Chèn dữ liệu vào bảng Đơn đặt hàng
INSERT INTO DonDatHang (id, ma_don, ngay_dat_hang, nha_cung_cap_id) VALUES
(1, 'DDH001', '2024-04-15', 1),
(2, 'DDH002', '2024-04-16', 2),
(3, 'DDH003', '2024-04-17', 3);

-- Tạo bảng Phiếu nhập
CREATE TABLE PhieuNhap (
    id INT PRIMARY KEY,
    so_phieu_nhap VARCHAR(50),
    ngay_nhap DATE,
    don_hang_id INT,
    FOREIGN KEY (don_hang_id) REFERENCES DonDatHang(id)
);

-- Chèn dữ liệu vào bảng Phiếu nhập
INSERT INTO PhieuNhap (id, so_phieu_nhap, ngay_nhap, don_hang_id) VALUES
(1, 'PN001', '2024-04-16', 1),
(2, 'PN002', '2024-04-17', 2),
(3, 'PN003', '2024-04-18', 3);

-- Tạo bảng Phiếu xuất
CREATE TABLE PhieuXuat (
    id INT PRIMARY KEY,
    ngay_xuat DATE,
    ten_khach_hang VARCHAR(100)
);

-- Chèn dữ liệu vào bảng Phiếu xuất
INSERT INTO PhieuXuat (id, ngay_xuat, ten_khach_hang) VALUES
(1, '2024-04-16', 'Khách hàng A'),
(2, '2024-04-17', 'Khách hàng B'),
(3, '2024-04-18', 'Khách hàng C');

-- Tạo bảng Chi tiết Đơn hàng
CREATE TABLE ChiTietDonHang (
    id INT PRIMARY KEY,
    don_hang_id INT,
    vat_tu_id INT,
    so_luong_dat INT,
    FOREIGN KEY (don_hang_id) REFERENCES DonDatHang(id),
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);

-- Chèn dữ liệu vào bảng Chi tiết Đơn hàng
INSERT INTO ChiTietDonHang (id, don_hang_id, vat_tu_id, so_luong_dat) VALUES
(1, 1, 1, 50),
(2, 2, 2, 40),
(3, 3, 3, 30);

-- Tạo bảng Chi tiết Phiếu nhập
CREATE TABLE ChiTietPhieuNhap (
    id INT PRIMARY KEY,
    phieu_nhap_id INT,
    vat_tu_id INT,
    so_luong_nhap INT,
    don_gia_nhap DECIMAL(18, 2),
    ghi_chu VARCHAR(200),
    FOREIGN KEY (phieu_nhap_id) REFERENCES PhieuNhap(id),
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);

-- Chèn dữ liệu vào bảng Chi tiết Phiếu nhập
INSERT INTO ChiTietPhieuNhap (id, phieu_nhap_id, vat_tu_id, so_luong_nhap, don_gia_nhap, ghi_chu) VALUES
(1, 1, 1, 100, 9000, NULL),
(2, 2, 2, 80, 4500, NULL),
(3, 3, 3, 4, 6000, NULL);

-- Tạo bảng Chi tiết Phiếu xuất
CREATE TABLE ChiTietPhieuXuat (
    id INT PRIMARY KEY,
    phieu_xuat_id INT,
    vat_tu_id INT,
    so_luong_xuat INT,
    don_gia_xuat DECIMAL(18, 2),
    ghi_chu VARCHAR(200),
    FOREIGN KEY (phieu_xuat_id) REFERENCES PhieuXuat(id),
    FOREIGN KEY (vat_tu_id) REFERENCES VatTu(id)
);

-- Chèn dữ liệu vào bảng Chi tiết Phiếu xuất
INSERT INTO ChiTietPhieuXuat (id, phieu_xuat_id, vat_tu_id, so_luong_xuat, don_gia_xuat, ghi_chu) VALUES
(1, 1, 1, 40, 11000, NULL),
(2, 2, 2, 50, 8000, NULL),
(3, 3, 3, 30, 7000, NULL);

-- Câu 1. Tạo view có tên vw_CTPNHAP bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP AS
SELECT 
    CT.phieu_nhap_id AS so_phieu_nhap,
    CT.vat_tu_id AS ma_vat_tu,
    CT.so_luong_nhap,
    CT.don_gia_nhap,
    CT.so_luong_nhap * CT.don_gia_nhap AS thanh_tien_nhap
FROM ChiTietPhieuNhap CT;

-- Câu 2. Tạo view có tên vw_CTPNHAP_VT bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.

CREATE VIEW vw_CTPNHAP_VT AS
SELECT 
    CT.phieu_nhap_id AS so_phieu_nhap,
    CT.vat_tu_id AS ma_vat_tu,
    VT.ten_vat_tu,
    CT.so_luong_nhap,
    CT.don_gia_nhap,
    CT.so_luong_nhap * CT.don_gia_nhap AS thanh_tien_nhap
FROM ChiTietPhieuNhap CT
INNER JOIN VatTu VT ON CT.vat_tu_id = VT.id;

-- Câu 3. Tạo view có tên vw_CTPNHAP_VT_PN bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP_VT_PN AS
SELECT 
    PN.so_phieu_nhap,
    PN.ngay_nhap,
    DDH.ma_don AS so_don_dat_hang,
    CT.phieu_nhap_id AS ma_vat_tu,
    VT.ten_vat_tu,
    CT.so_luong_nhap,
    CT.don_gia_nhap,
    CT.so_luong_nhap * CT.don_gia_nhap AS thanh_tien_nhap
FROM ChiTietPhieuNhap CT
INNER JOIN PhieuNhap PN ON CT.phieu_nhap_id = PN.id
INNER JOIN ChiTietDonHang CTDH ON PN.don_hang_id = CTDH.don_hang_id
INNER JOIN DonDatHang DDH ON CTDH.don_hang_id = DDH.id
INNER JOIN VatTu VT ON CT.vat_tu_id = VT.id;

-- Câu 4. Tạo view có tên vw_CTPNHAP_VT_PN_DH bao gồm các thông tin sau: số phiếu nhập hàng, ngày nhập hàng, số đơn đặt hàng, mã nhà cung cấp, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập.
CREATE VIEW vw_CTPNHAP_VT_PN_DH AS
SELECT 
    PN.so_phieu_nhap,
    PN.ngay_nhap,
    DDH.ma_don AS so_don_dat_hang,
    NCC.ma_nha_cung_cap,
    CT.phieu_nhap_id AS ma_vat_tu,
    VT.ten_vat_tu,
    CT.so_luong_nhap,
    CT.don_gia_nhap,
    CT.so_luong_nhap * CT.don_gia_nhap AS thanh_tien_nhap
FROM ChiTietPhieuNhap CT
INNER JOIN PhieuNhap PN ON CT.phieu_nhap_id = PN.id
INNER JOIN ChiTietDonHang CTDH ON PN.don_hang_id = CTDH.don_hang_id
INNER JOIN DonDatHang DDH ON CTDH.don_hang_id = DDH.id
INNER JOIN NhaCungCap NCC ON DDH.nha_cung_cap_id = NCC.id
INNER JOIN VatTu VT ON CT.vat_tu_id = VT.id;

-- Câu 5. Tạo view có tên vw_CTPNHAP_loc  bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập có số lượng nhập > 5.
CREATE VIEW vw_CTPNHAP_loc AS
SELECT 
    CT.phieu_nhap_id AS so_phieu_nhap,
    CT.vat_tu_id AS ma_vat_tu,
    VT.ten_vat_tu,
    CT.so_luong_nhap,
    CT.don_gia_nhap,
    CT.so_luong_nhap * CT.don_gia_nhap AS thanh_tien_nhap
FROM ChiTietPhieuNhap CT
INNER JOIN VatTu VT ON CT.vat_tu_id = VT.id
WHERE CT.so_luong_nhap > 5;
-- Câu 6. Tạo view có tên vw_CTPNHAP_VT_loc bao gồm các thông tin sau: số phiếu nhập hàng, mã vật tư, tên vật tư, số lượng nhập, đơn giá nhập, thành tiền nhập. Và chỉ liệt kê các chi tiết nhập vật tư có đơn vị tính là Bộ.
CREATE VIEW vw_CTPNHAP_VT_loc AS
SELECT 
    CT.phieu_nhap_id AS so_phieu_nhap,
    CT.vat_tu_id AS ma_vat_tu,
    VT.ten_vat_tu,
    CT.so_luong_nhap,
    CT.don_gia_nhap,
    CT.so_luong_nhap * CT.don_gia_nhap AS thanh_tien_nhap
FROM ChiTietPhieuNhap CT
INNER JOIN VatTu VT ON CT.vat_tu_id = VT.id
WHERE VT.don_vi_tinh = 'Bộ';

-- Câu 7. Tạo view có tên vw_CTPXUAT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, số lượng xuất, đơn giá xuất, thành tiền xuất.
CREATE VIEW vw_CTPXUAT AS
SELECT 
    CT.phieu_xuat_id AS so_phieu_xuat,
    CT.vat_tu_id AS ma_vat_tu,
    CT.so_luong_xuat,
    CT.don_gia_xuat,
    CT.so_luong_xuat * CT.don_gia_xuat AS thanh_tien_xuat
FROM ChiTietPhieuXuat CT;
-- Câu 8. Tạo view có tên vw_CTPXUAT_VT bao gồm các thông tin sau: số phiếu xuất hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
CREATE VIEW vw_CTPXUAT_VT AS
SELECT 
    CT.phieu_xuat_id AS so_phieu_xuat,
    CT.vat_tu_id AS ma_vat_tu,
    VT.ten_vat_tu,
    CT.so_luong_xuat,
    CT.don_gia_xuat
FROM ChiTietPhieuXuat CT
INNER JOIN VatTu VT ON CT.vat_tu_id = VT.id;

-- Câu 9. Tạo view có tên vw_CTPXUAT_VT_PX bao gồm các thông tin sau: số phiếu xuất hàng, tên khách hàng, mã vật tư, tên vật tư, số lượng xuất, đơn giá xuất.
CREATE VIEW vw_CTPXUAT_VT_PX AS
SELECT 
    PX.id AS so_phieu_xuat,
    PX.ten_khach_hang,
    CT.vat_tu_id AS ma_vat_tu,
    VT.ten_vat_tu,
    CT.so_luong_xuat,
    CT.don_gia_xuat
FROM ChiTietPhieuXuat CT
INNER JOIN PhieuXuat PX ON CT.phieu_xuat_id = PX.id
INNER JOIN VatTu VT ON CT.vat_tu_id = VT.id;

-- Câu 1: Tạo Stored procedure cho biết tổng số lượng cuối của vật tư với mã vật tư là tham số vào.
DELIMITER //

CREATE PROCEDURE GetTotalQuantityByMaterialID(IN materialID INT)
BEGIN
    SELECT COALESCE(SUM(so_luong_dau + tong_so_luong_nhap - tong_so_luong_xuat), 0) AS total_quantity
    FROM TonKho
    WHERE vat_tu_id = materialID;
END //

DELIMITER ;
-- câu 2
DELIMITER //

CREATE PROCEDURE GetTotalAmountOfMaterial(IN materialID INT)
BEGIN
    SELECT COALESCE(SUM(so_luong_xuat * don_gia_xuat), 0) AS total_amount
    FROM ChiTietPhieuXuat
    WHERE vat_tu_id = materialID;
END //

DELIMITER ;

-- câu 3
DELIMITER //

CREATE PROCEDURE GetTotalQuantityByOrderID(IN orderID INT)
BEGIN
    SELECT COALESCE(SUM(so_luong_dat), 0) AS total_quantity
    FROM ChiTietDonHang
    WHERE don_hang_id = orderID;
END //

DELIMITER ;

-- câu 4 
DELIMITER //

CREATE PROCEDURE AddOrder(IN orderID INT, IN orderCode VARCHAR(50), IN orderDate DATE, IN supplierID INT)
BEGIN
    INSERT INTO DonDatHang (id, ma_don, ngay_dat_hang, nha_cung_cap_id)
    VALUES (orderID, orderCode, orderDate, supplierID);
END //

DELIMITER ;

-- câu 5 DELIMITER //
DELIMITER //

CREATE PROCEDURE AddOrderDetail(IN orderID INT, IN materialID INT, IN quantity INT)
BEGIN
    INSERT INTO ChiTietDonHang (don_hang_id, vat_tu_id, so_luong_dat)
    VALUES (orderID, materialID, quantity);
END //

DELIMITER ;


-- câu 6
DELIMITER //

CREATE PROCEDURE DeleteSupplierByID(IN supplierID INT)
BEGIN
    UPDATE DonDatHang
    SET nha_cung_cap_id = NULL
    WHERE nha_cung_cap_id = supplierID;
END //

DELIMITER ;












	
