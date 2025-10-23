-- Xóa database cũ nếu tồn tại để tránh lỗi
DROP DATABASE IF EXISTS FILEBENH;

-- Tạo lại database với bảng mã chuẩn
CREATE DATABASE FILEBENH CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE FILEBENH;

--
-- Bảng TenTrieuChung ĐÃ SỬA LỖI
-- -> Thêm cột ID làm khóa chính để định danh
--
CREATE TABLE TenTrieuChung (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  TrieuChung NVARCHAR(500) NOT NULL
);

--
-- Bảng DuaLoiKhuyen ĐÃ SỬA LỖI
-- -> Thêm cột TrieuChung_ID để liên kết với bảng TenTrieuChung
--
CREATE TABLE DuaLoiKhuyen (
  ID INT PRIMARY KEY AUTO_INCREMENT,
  TrieuChung_ID INT NOT NULL,
  ChuanDoan NVARCHAR(500) NOT NULL,
  LoiKhuyen NVARCHAR(500) NOT NULL,
  FOREIGN KEY (TrieuChung_ID) REFERENCES TenTrieuChung(ID)
);

--
-- Thêm dữ liệu mẫu ĐÃ SỬA LỖI để có sự liên kết
--
-- Bộ triệu chứng 1: Ho, Đau họng -> liên kết với Chẩn đoán Cảm cúm
INSERT INTO TenTrieuChung(ID, TrieuChung) VALUES (1, 'Ho, Đau họng');
INSERT INTO DuaLoiKhuyen(TrieuChung_ID, ChuanDoan, LoiKhuyen) VALUES (1, 'Có thể bạn đang bị cảm cúm', 'Ban nên nghỉ ngơi nhiều hơn');

-- Thêm một vài dữ liệu khác để kiểm tra
INSERT INTO TenTrieuChung(ID, TrieuChung) VALUES (2, 'Ho, phát ban');
INSERT INTO DuaLoiKhuyen(TrieuChung_ID, ChuanDoan, LoiKhuyen) VALUES (2, 'Nghi ngờ sốt phát ban', 'Cần theo dõi nhiệt độ và đi khám nếu sốt cao không hạ.');