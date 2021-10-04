USE furuma_management;

-- Task 4 Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT khach_hang.id_khach_hang,khach_hang.ho_ten,count(hop_dong.id_hop_dong)
FROM khach_hang
JOIN hop_dong ON khach_hang.id_khach_hang = hop_dong.id_khach_hang
WHERE khach_hang.id_loai_khach = 1
GROUP BY khach_hang.ho_ten
ORDER BY count(hop_dong.id_hop_dong) ASC;