USE furuma_management;

-- Task 7 Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.

SELECT dich_vu.id_dich_vu ,dich_vu.ten_dich_vu,dich_vu.dien_tich,dich_vu.so_nguoi_toi_da,dich_vu.chi_phi_thue,loai_dich_vu.ten_loai_dich_vu 
FROM dich_vu 
JOIN hop_dong  ON hop_dong.id_dich_vu = dich_vu.id_dich_vu
JOIN loai_dich_vu ON loai_dich_vu.id_loai_dich_vu = dich_vu.id_loai_dich_vu
WHERE year(ngay_lam_hop_dong) = 2018 AND dich_vu.id_loai_dich_vu NOT IN (SELECT dich_vu.id_dich_vu
FROM dich_vu JOIN hop_dong on hop_dong.id_dich_vu = dich_vu.id_dich_vu
WHERE year(hop_dong.ngay_lam_hop_dong)= 2019);