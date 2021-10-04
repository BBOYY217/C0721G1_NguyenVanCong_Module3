USE furuma_management;

-- Task 11 Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.

SELECT * 
FROM dich_vu_di_kem;

SELECT dich_vu_di_kem.id_dich_vu_di_kem ,dich_vu_di_kem.ten_dich_vu_di_kem ,dich_vu_di_kem.gia ,dich_vu_di_kem.don_vi ,dich_vu_di_kem.trang_thai_kha_dung ,
khach_hang.ho_ten ,khach_hang.dia_chi
FROM dich_vu_di_kem 
JOIN hop_dong_chi_tiet ON dich_vu_di_kem.id_dich_vu_di_kem = hop_dong_chi_tiet.id_dich_vu_di_kem
JOIN hop_dong ON hop_dong_chi_tiet.id_hop_dong = hop_dong.id_hop_dong
JOIN khach_hang ON hop_dong.id_khach_hang = khach_hang.id_khach_hang
WHERE (khach_hang.id_loai_khach = 1) AND (khach_hang.dia_chi = "Vinh"  OR  khach_hang.dia_chi = "Quảng Ngãi");
