DROP DATABASE IF EXISTS furuma_management;
CREATE DATABASE furuma_management;
USE furuma_management;

CREATE TABLE vi_tri (
    id_vi_tri INT AUTO_INCREMENT PRIMARY KEY,
    ten_vi_tri VARCHAR(50) 
);

CREATE TABLE trinh_do (
    id_trinh_do INT AUTO_INCREMENT PRIMARY KEY,
    ten_trinh_do VARCHAR(50) 
);

CREATE TABLE bo_phan (
    id_bo_phan INT AUTO_INCREMENT PRIMARY KEY,
    ten_bo_phan VARCHAR(50) 
);

CREATE TABLE nhan_vien (
    id_nhan_vien INT AUTO_INCREMENT PRIMARY KEY,
    ho_ten_nhan_vien VARCHAR(200) ,
    id_vi_tri INT ,
    id_trinh_do INT ,
    id_bo_phan INT ,
    FOREIGN KEY (id_vi_tri)REFERENCES vi_tri (id_vi_tri) ,
    FOREIGN KEY (id_trinh_do)REFERENCES trinh_do (id_trinh_do),
    FOREIGN KEY (id_bo_phan)REFERENCES bo_phan (id_bo_phan),
    ngay_sinh DATE ,
    so_cmnd VARCHAR(50),
    luong INT ,
    so_dien_thoai VARCHAR(50),
    email VARCHAR(50) ,
    dia_chi VARCHAR(200) 
);

CREATE TABLE loai_khach (
    id_loai_khach INT AUTO_INCREMENT PRIMARY KEY,
    ten_loai_khach VARCHAR(50)
);

CREATE TABLE khach_hang (
    id_khach_hang INT AUTO_INCREMENT PRIMARY KEY,
    id_loai_khach INT ,
    FOREIGN KEY (id_loai_khach)
        REFERENCES loai_khach (id_loai_khach) ,
    ho_ten VARCHAR(50) ,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(50) NOT NULL,
    so_dien_thoai VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    dia_chi VARCHAR(200) NOT NULL
);

CREATE TABLE kieu_thue (
    id_kieu_thue INT AUTO_INCREMENT PRIMARY KEY,
    ten_kieu_thue VARCHAR(50),
    gia INT 
);

CREATE TABLE loai_dich_vu (
    id_loai_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
    ten_loai_dich_vu VARCHAR(50) 
);

CREATE TABLE dich_vu (
    id_dich_vu INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu VARCHAR(50)  ,
    dien_tich INT ,
    so_tang INT ,
    so_nguoi_toi_da INT ,
    chi_phi_thue INT ,
    id_kieu_thue INT ,
    id_loai_dich_vu INT ,
    FOREIGN KEY (id_kieu_thue)REFERENCES kieu_thue (id_kieu_thue) ,
    FOREIGN KEY (id_loai_dich_vu)REFERENCES loai_dich_vu (id_loai_dich_vu) ,
    trang_thai VARCHAR(50) 
);

CREATE TABLE hop_dong (
    id_hop_dong INT AUTO_INCREMENT PRIMARY KEY,
    id_nhan_vien INT ,
    id_khach_hang INT,
    id_dich_vu INT ,
    FOREIGN KEY (id_nhan_vien)REFERENCES nhan_vien (id_nhan_vien) ,
    FOREIGN KEY (id_khach_hang)REFERENCES khach_hang (id_khach_hang) ,
    FOREIGN KEY (id_dich_vu)REFERENCES dich_vu (id_dich_vu) ,
    ngay_lam_hop_dong DATE ,
    ngay_ket_thuc DATE ,
    tien_dat_coc INT,
    tong_tien INT
);

CREATE TABLE dich_vu_di_kem (
    id_dich_vu_di_kem INT AUTO_INCREMENT PRIMARY KEY,
    ten_dich_vu_di_kem VARCHAR(50),
    gia INT ,
    don_vi INT ,
    trang_thai_kha_dung VARCHAR(50) 
);

CREATE TABLE hop_dong_chi_tiet (
    id_hop_dong_chi_tiet INT AUTO_INCREMENT PRIMARY KEY,
    id_hop_dong INT ,
    id_dich_vu_di_kem INT ,
    FOREIGN KEY (id_hop_dong)REFERENCES hop_dong (id_hop_dong) ,
    FOREIGN KEY (id_dich_vu_di_kem)REFERENCES dich_vu_di_kem (id_dich_vu_di_kem),
    so_luong INT 
);

INSERT INTO vi_tri (id_vi_tri,ten_vi_tri)
VALUES
(1,'Lễ tân'),
(2,'Phục vụ'),
(3,'Chuyên viên'),
(4,'Giám sát'),
(5,'Quản lý'),
(6,'Giám đốc');

INSERT INTO trinh_do (id_trinh_do,ten_trinh_do)
VALUES
(1,'Trung cấp'),
(2,'Cao đẳng'),
(3,'Đại học'),
(4,'Sau đại học');

INSERT INTO bo_phan (id_bo_phan,ten_bo_phan)
VALUES
(1,'Sale - Marketing'),
(2,'Hành chính'),
(3,'Phục vụ'),
(4,'Quản lý');

INSERT INTO loai_khach (id_loai_khach,ten_loai_khach)
VALUES
(1,'Diamond'),
(2,'Platinium'),
(3,'Gold'),
(4,'Silver'),
(5,'Member');

INSERT INTO kieu_thue (id_kieu_thue,ten_kieu_thue, gia)
VALUES
(1,'Năm', 100000000),
(2,'Tháng', 300000000),
(3,'Ngày', 2000000),
(4,'Giờ', 500000);

INSERT INTO loai_dich_vu (id_loai_dich_vu,ten_loai_dich_vu)
VALUES
(1,'Villa'),
(2,'House'),
(3,'Room');

INSERT INTO dich_vu_di_kem (id_dich_vu_di_kem,ten_dich_vu_di_kem, gia, don_vi, trang_thai_kha_dung)
VALUES
(1,'massage', 700000, 1, 'Còn'),
(2,'karaoke', 400000, 1, 'Còn'),
(3,'Thức ăn', 300000, 1, 'Còn '),
(4,'Nước uống', 100000, 1, 'Còn '),
(5,'Thuê xe', 2000000, 1, 'Còn');

INSERT INTO nhan_vien (ho_ten_nhan_vien, id_vi_tri, id_trinh_do, id_bo_phan, ngay_sinh, so_cmnd, luong, so_dien_thoai, email, dia_chi)
VALUES
('Nguyễn Văn Tuấn', 1, 3, 4, '1965-04-04', '201451309', 3000000, '0904134089', 'abcdfg@gmail.com', 'Hà Nội'),
('Võ Trương Sơn', 2, 4, 4, '2001-12-10', '200356067', 3000000, '0901134023', 'vts123@gmail.com', 'Tp. HCM'),
('Bùi Thị Hạnh', 3, 3, 4, '1999-09-08', '200457145', 28000000, '090208945', 'qwer6234@gmail.com', 'Đà Nẵng'),
('Phan Văn Đức', 4, 4, 2, '1996-04-12', '201457009', 9000000, '090610450', 'pvd12@gmail.com', 'Hải Châu');

INSERT INTO khach_hang (id_loai_khach, ho_ten, ngay_sinh, so_cmnd, so_dien_thoai, email, dia_chi)
VALUES
(1, 'Nguyễn Văn Công ', '2001-07-21', '123456789', '0907436912', 'nvc07@gmail.com', 'Đà Nẵng'),
(2, 'Nguyễn Văn Kiên', '1975-04-10', '987654321', '18001090', 'nvt04@gmail.com', 'Quảng Trị'),
(3, 'Nguyễn Văn Hùng', '1995-03-10', '123789456', '095678921', 'fghloi1234@gmail.com', 'Sài Gòn');

INSERT INTO dich_vu (ten_dich_vu, dien_tich, so_tang, so_nguoi_toi_da, chi_phi_thue, id_kieu_thue, id_loai_dich_vu, trang_thai)
VALUES
('Thuê Villa 1', 350, 3, 10, 4000000, 1, 1, 'Còn phòng'),
('Thuê house 3', 500, 3, 10, 4200000, 2, 1, 'Còn phòng'),
('Thuê Room 4', 150, 1, 4, 3000000, 4, 3, 'Còn phòng');

INSERT INTO hop_dong (id_hop_dong , id_nhan_vien, id_khach_hang, id_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, tong_tien )
VALUES
(1 ,3, 1, 2, '2020-10-05', '2020-11-04', 5000000 ,5000000),
(2 ,2, 3, 3, '2021-05-12', '2021-05-17', 6500000 ,6500000),
(3 ,1, 2, 1, '2019-04-20', '2019-05-29', 3000000 ,3000000);

INSERT INTO hop_dong_chi_tiet (id_hop_dong, id_dich_vu_di_kem, so_luong)
VALUES
(1,4,5),
(2,3,3),
(3,5,1);


