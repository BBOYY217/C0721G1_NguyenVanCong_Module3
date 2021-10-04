USE furuma_management;

-- Task 6 Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).

SELECT dich_vu.id_dich_vu ,dich_vu.ten_dich_vu ,dich_vu.dien_tich, dich_vu.chi_phi_thue, loai_dich_vu.ten_loai_dich_vu
FROM dich_vu 
JOIN loai_dich_vu  on dich_vu.id_loai_dich_vu= loai_dich_vu.id_loai_dich_vu
JOIN hop_dong on hop_dong.id_dich_vu=dich_vu.id_dich_vu
WHERE NOT( month((ngay_lam_hop_dong)) IN (1,2,3) and year(ngay_lam_hop_dong) = 2019);
