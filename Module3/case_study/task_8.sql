USE furuma_management;

-- 8.	Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.Học viên sử dụng theo 3 cách khác nhau để thực hiện yêu cầu trên
-- C1 
SELECT khach_hang.ho_ten
FROM khach_hang 
UNION SELECT khach_hang.ho_ten
FROM khach_hang ;
