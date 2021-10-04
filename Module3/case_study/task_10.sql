USE furuma_management;

-- Task 10 Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).

SELECT hop_dong.id_hop_dong, hop_dong.ngay_lam_hop_dong ,hop_dong.ngay_ket_thuc,hop_dong.tien_dat_coc,
count(hop_dong_chi_tiet.id_hop_dong_chi_tiet) AS 'so_luong_dich_vu_di_kem'
FROM hop_dong 
JOIN hop_dong_chi_tiet ON hop_dong.id_hop_dong = hop_dong_chi_tiet.id_hop_dong
GROUP BY hop_dong.id_hop_dong;