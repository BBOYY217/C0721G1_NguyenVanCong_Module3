USE furuma_management;

-- Task 3 Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT *
FROM khach_hang
WHERE (year(curdate()) - year((ngay_sinh)) BETWEEN 18 AND 50) 
AND (dia_chi IN ("Đà Nẵng","Quảng Trị"));
