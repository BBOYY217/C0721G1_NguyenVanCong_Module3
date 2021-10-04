USE furuma_management;

-- Task 2 :Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu làmột trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.

SELECT * 
FROM nhan_vien
WHERE ((ho_ten_nhan_vien LIKE 'H%') OR  (ho_ten_nhan_vien LIKE "T%") OR (ho_ten_nhan_vien LIKE "K%"))  AND length(ho_ten_nhan_vien) <= 15;