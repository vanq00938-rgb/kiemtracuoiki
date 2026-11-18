CREATE DATABASE qlsuachua;
USE qlsuachua;

CREATE TABLE nguoidung (
    ma_nguoidung INT AUTO_INCREMENT PRIMARY KEY,
    ten_dangnhap VARCHAR(50) NOT NULL,
    mat_khau VARCHAR(100) NOT NULL,
    ho_ten VARCHAR(100) NOT NULL,
    so_dien_thoai VARCHAR(15),
    vai_tro VARCHAR(20) NOT NULL
);

INSERT INTO nguoidung (ma_nguoidung, ten_dangnhap, mat_khau, ho_ten, so_dien_thoai, vai_tro) VALUES
(1, 'admin', '123456', 'Quản Trị Hệ Thống', '0901112223', 'quan_tri'),
(2, 'thosuapham', '123456', 'Phạm Văn Thông', '0912333444', 'tho_sua'),
(3, 'thole', '123456', 'Lê Văn Thợ', '0915556677', 'tho_sua'),
(4, 'khachhang1', '123456', 'Nguyễn Văn Khánh', '0988777666', 'khach_hang'),
(5, 'khachhang2', '123456', 'Trần Thị Lan', '0977888999', 'khach_hang'),
(6, 'hoangtung', '123456', 'Hoàng Thanh Tùng', '0966111222', 'khach_hang'),
(7, 'minhphuong', '123456', 'Vũ Minh Phương', '0933444555', 'khach_hang');


CREATE TABLE danhmucthietbi (
    ma_danhmuc INT AUTO_INCREMENT PRIMARY KEY,
    ten_danhmuc VARCHAR(100) NOT NULL,
    mo_ta TEXT
);

INSERT INTO danhmucthietbi (ma_danhmuc, ten_danhmuc, mo_ta) VALUES
(1, 'Điều hòa không khí', 'Sửa chữa, nạp gas, bảo dưỡng điều hòa các hãng'),
(2, 'Tủ lạnh', 'Khắc phục sự cố không lạnh, hỏng lốc, rò nước'),
(3, 'Máy giặt', 'Sửa máy giặt không vắt, không cấp nước'),
(4, 'Bình nóng lạnh', 'Bảo dưỡng và sửa chữa bình nước nóng');


CREATE TABLE phieusuachua (
    ma_phieu INT AUTO_INCREMENT PRIMARY KEY,
    ma_khachhang INT NOT NULL,
    ma_thosua INT,
    ma_danhmuc INT NOT NULL,
    ten_thietbi VARCHAR(100) NOT NULL,
    mo_ta_loi TEXT,
    dia_chi_sua VARCHAR(255),
    trang_thai VARCHAR(20) DEFAULT 'cho_xu_ly',
    FOREIGN KEY (ma_khachhang) REFERENCES nguoidung(ma_nguoidung),
    FOREIGN KEY (ma_thosua) REFERENCES nguoidung(ma_nguoidung),
    FOREIGN KEY (ma_danhmuc) REFERENCES danhmucthietbi(ma_danhmuc)
);

INSERT INTO phieusuachua (ma_phieu, ma_khachhang, ma_thosua, ma_danhmuc, ten_thietbi, mo_ta_loi, dia_chi_sua, trang_thai) VALUES
(1, 4, 2, 1, 'Điều hòa Daikin 12000BTU', 'Máy chạy nhưng không thổi ra hơi lạnh, cục nóng không quạt', 'Số 10, Cầu Giấy, Hà Nội', 'dang_xu_ly'),
(2, 5, NULL, 2, 'Tủ lạnh Panasonic Inverter', 'Ngăn mát không lạnh, phát ra tiếng kêu lạ', 'Số 25, Đống Đa, Hà Nội', 'cho_xu_ly'),
(3, 6, 3, 3, 'Máy giặt LG cửa ngang 9kg', 'Báo lỗi LE, không vắt được nước', 'Số 120, Hai Bà Trưng, Hà Nội', 'hoan_thanh'),
(4, 7, 2, 4, 'Bình nóng lạnh Ariston 30L', 'Bật không lên đèn, nước không nóng', 'Số 55, Thanh Xuân, Hà Nội', 'hoan_thanh');


CREATE TABLE hoadon (
    ma_hoadon INT AUTO_INCREMENT PRIMARY KEY,
    ma_phieu INT NOT NULL,
    tong_tien DECIMAL(12,2) NOT NULL,
    phuong_thuc_tt VARCHAR(50),
    trang_thai_tt VARCHAR(20) DEFAULT 'chua_tra',
    FOREIGN KEY (ma_phieu) REFERENCES phieusuachua(ma_phieu)
);

INSERT INTO hoadon (ma_hoadon, ma_phieu, tong_tien, phuong_thuc_tt, trang_thai_tt) VALUES
(1, 1, 450000.00, 'Chuyển khoản', 'chua_tra'),
(2, 3, 650000.00, 'Tiền mặt', 'da_tra'),
(3, 4, 300000.00, 'Chuyển khoản', 'da_tra');


CREATE TABLE thanhviennhom (
    id INT AUTO_INCREMENT PRIMARY KEY,
    ma_sinh_vien VARCHAR(20) NOT NULL,
    ho_ten VARCHAR(100) NOT NULL,
    vai_tro_trong_nhóm VARCHAR(100),
    ten_de_tai VARCHAR(255)
);

INSERT INTO thanhviennhom (id, ma_sinh_vien, ho_ten, vai_tro_trong_nhóm, ten_de_tai) VALUES
(1, 'SV_QUYET', 'Phí Văn Quyết', 'Nhóm trưởng / Lập trình Backend & Database', 'Website Tiếp nhận Yêu cầu Sửa chữa Thiết bị Điện'),
(2, 'SV_THANHVIEN2', 'Nguyễn Minh Phúc', 'Tìm thông tin / Tài liệu', 'Website Tiếp nhận Yêu cầu Sửa chữa Thiết bị Điện'),
(3, 'SV_THANHVIEN3', 'Trần Duy Việt', 'Thiết kế tài liệu / Sơ đồ phân tích', 'Website Tiếp nhận Yêu cầu Sửa chữa Thiết bị Điện'),
(7, 'SV_THANHVIEN4', 'Phạm Văn Hưng', 'Kiểm thử hệ thống & Báo cáo', 'Website Tiếp nhận Yêu cầu Sửa chữa Thiết bị Điện');