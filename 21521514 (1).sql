--- Nguyễn Thị Thùy
--- MSSV: 21521514

--- BTTH 1
--- Câu I.1
Create table KHACHHANG
(
	MAKH char(4) not null primary key,
	HOTEN varchar(40),
	DCHI varchar(50) ,
	SODT  varchar(20),
	NGSINH smalldatetime,
	DOANHSO money ,
	NGDK smalldatetime
)
go
Create table NHANVIEN 
(
	MANV char(4) not null primary key,
	HOTEN varchar(40),
	SODT varchar(20),
	NGVL smalldatetime
)
go
Create table SANPHAM 
(	
	MASP char(4) not null primary key,
	TENSP varchar(40),
	DVT varchar(20),
	NUOCSX varchar(40) ,
	GIA  money 
) 
go
Create table HOADON
(
	SOHD int not null primary key,
	NGHD smalldatetime ,
	MAKH char(4) references KHACHHANG(MAKH),
	MANV char(4) references NHANVIEN(MANV),
	TRIGIA money 
)
go


Create table CTHD
(
	SOHD int references HOADON(SOHD) ,
	MASP char(4) references SANPHAM(MASP),
	SL int ,
	CONSTRAINT CTHD_pk PRIMARY KEY (SOHD, MASP)
)

go

--- Câu II.1
INSERT INTO NHANVIEN(MANV, HOTEN, SODT, NGVL)
VALUES ('NV01', 'Nguyen Nhu Nhut', '0927345678', '4/13/2006')
,('NV02', 'Le Thi Phi Yen',	'0987567390', '4/21/2006')
,('NV03', 'Nguyen Van B', '0997047382', '4/27/2006')
,('NV04', 'Ngo Thanh Tuan', '0913758498', '6/24/2006')
,('NV05', 'Nguyen Thi Truc Thanh', '0918590387', '7/20/2006')
;
SELECT  * FROM  NHANVIEN;

INSERT INTO KHACHHANG(MAKH, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK)
VALUES ('KH01', 'Nguyen Van A',	'731 Tran Hung Dao, Q5, TpHCM',	'8823451', '10/22/1960', 13060000, '7/22/2006')
, ('KH02', 'Tran Ngoc Han',	'23/5 Nguyen Trai, Q5, TpHCM',	'908256478', '4/3/1974', 280000, '7/30/2006')
, ('KH03','Tran Ngoc Linh',	'45 Nguyen Canh Chan, Q1, TpHCM','938776266', '6/12/1980', 3860000,	'8/5/2006')
, ('KH04', 'Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM', '917325476', '3/9/1965', 250000,	'10/2/2006')
, ('KH05',	'Le Nhat Minh',	'34 Truong Dinh, Q3, TpHCM', '8246108',	'3/10/1950', 21000,	'10/28/2006')
, ('KH06', 'Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM',	'8631738', '12/31/1981', 915000, '11/24/2006')
, ('KH07', 'Nguyen Van Tam', '32/3 Tran Binh Trong, Q5, TpHCM',	'916783565', '4/6/1971', 12500,	'12/1/2006')
, ('KH08', 'Phan Thi Thanh', '45/2 An Duong Vuong, Q5, TpHCM', '938435756',	'1/10/1971',365000, '12/13/2006')
, ('KH09',	'Le Ha Vinh', '873 Le Hong Phong, Q5, TpHCM','8654763',	'9/3/1979', 70000,	'1/14/2007')
, ('KH10', 'Ha Duy Lap', '34/34B Nguyen Trai, Q1, TpHCM', '8768904', '5/2/1983', 67500,	'1/16/2007')
;
SELECT  * FROM  KHACHHANG;

INSERT INTO SANPHAM(MASP, TENSP, DVT, NUOCSX, GIA)
VALUES ('BC01', 'But chi',	'cay',	'Singapore', 3000)
,('BC02','But chi','cay','Singapore',5000)
,('BC03','But chi','cay','Viet Nam',3500)
,('BC04','But chi','hop','Viet Nam',30000)
,('BB01','But bi','cay','Viet Nam',5000)
,('BB02','But bi','cay','Trung Quoc',7000)
,('BB03','But bi','hop','Thai Lan',100000)
,('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
,('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
,('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
,('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
,('TV05','Tap 100 trang','chuc','Viet Nam',23000)
,('TV06','Tap 200 trang','chuc','Viet Nam',53000)
,('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
,('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
,('ST02','So tay loai 1','quyen','Viet Nam',55000)
,('ST03','So tay loai 2','quyen','Viet Nam',51000)
,('ST04','So tay','quyen','Thai Lan',55000)
,('ST05','So tay mong','quyen','Thai Lan',20000)
,('ST06','Phan viet bang','hop','Viet Nam',5000)
,('ST07','Phan khong bui','hop','Viet Nam',7000)
,('ST08','Bong bang','cai','Viet Nam',1000)
,('ST09','But long','cay','Viet Nam',5000)
,('ST10','But long','cay','Trung Quoc',7000)
;
SELECT * from SANPHAM;
INSERT INTO HOADON(SOHD, NGHD, MAKH, MANV, TRIGIA) 
VALUES ('1001',	'7/23/2006','KH01', 'NV01',	320000)
, ('1002',	'8/12/2006',	'KH01',	'NV02',	840000)
, ('1003',	'8/23/2006',	'KH02',	'NV01',	100000)
, ('1004',	'9/1/2006',	'KH02',	'NV01',	180000)
, ('1005',	'10/20/2006', 'KH01', 'NV02', 3800000)
, ('1006', '10/16/2006', 'KH01', 'NV03',2430000)
, ('1007',	'10/28/2006', 'KH03', 'NV03', 510000)
, ('1008',	'10/28/2006',	'KH01',	'NV03',	440000)
, ('1009',	'10/28/2006',	'KH03',	'NV04',	200000)
, ('1010',	'11/1/2006',	'KH01',	'NV01',	5200000)
, ('1011',	'11/4/2006',	'KH04',	'NV03',	250000)
, ('1012',	'11/30/2006',	'KH05',	'NV03',	21000)
, ('1013',	'12/12/2006',	'KH06',	'NV01',	5000)
, ('1014',	'12/31/2006',	'KH03',	'NV02',	3150000)
, ('1015',	'1/1/2007',	'KH06',	'NV01',	910000)
, ('1016',	'1/1/2007',	'KH07',	'NV02',	12500)
, ('1017',	'1/2/2007',	'KH08',	'NV03',	35000)
, ('1018',	'1/13/2007', 'KH08',	'NV03',	330000)
, ('1019',	'1/13/2007',	'KH01',	'NV03',	30000)
, ('1020',	'1/14/2007',	'KH09',	'NV04',	70000)
, ('1021',	'1/16/2007',	'KH10',	'NV03',	67500)
, ('1022',	'1/16/2007',	NULL,	'NV03',	7000)
, ('1023', 	'1/17/2007', NULL,	'NV01',	330000)
;
SELECT * from HOADON;

INSERT INTO CTHD(SOHD, MASP, SL)
VALUES (1001,'TV02',10)
,(1001,'ST01',5)
,(1001,'BC01',5)
,(1001,'BC02',10)
,(1001,'ST08',10)
,(1002,'BC04',20)
,(1002,'BB01',20)
,(1002,'BB02',20)
,(1003,'BB03',10)
,(1004,'TV01',20)
,(1004,'TV02',10)
,(1004,'TV03',10)
,(1004,'TV04',10)
,(1005,'TV05',50)
,(1005,'TV06',50)
,(1006,'TV07',20)
,(1006,'ST01',30)
,(1006,'ST02',10)
,(1007,	'ST03',10)
,(1008,'ST04',8)
,(1009,'ST05',10)
,(1010,'TV07',50)
,(1010,'ST07',50)
,(1010,'ST08',100)
,(1010,'ST04',50)
,(1010,'TV03',100)
,(1011,'ST06',50)
,(1012,'ST07',3)
,(1013,'ST08',5)
,(1014,'BC02',80)
,(1014,'BB02',100)
,(1014,'BC04',60)
,(1014,'BB01',50)
,(1015,'BB02',30)
,(1015,'BB03',7)
,(1016,'TV01',5)
,(1017,'TV02',1)
,(1017,'TV03',1)
,(1017,'TV04',5)
,(1018,'ST04',6)
,(1019,'ST05',1)
,(1019,'ST06',2)
,(1020,'ST07',10)
,(1021,'ST08',5)
,(1021,'TV01',7)
,(1021,'TV02',10)
,(1022,'ST07',1)
,(1023,'ST04',6)
;
Select * from CTHD;

--- BTTH 2
--- CâuI.2
alter table SANPHAM add GHICHU varchar(20)
--- Câu I.3
alter table KHACHHANG add LOAIKH tinyint
--- Câu I.4
alter table SANPHAM alter column GHICHU varchar(100)
--- Câu I.5
alter table SANPHAM drop column GHICHU
--- Câu I.6 Đổi kiểu dữ liệu của thuộc tính LOAIKH
alter table KHACHHANG alter column LOAIKH varchar(50)

--- Câu II.2
select *into SANPHAM1 from SANPHAM
select *into KHACHHANG1 from KHACHHANG

--- Câu II.3
update SANPHAM1
set GIA = GIA*1.05
where NUOCSX = 'Thai Lan'

--- Câu II.4
update SANPHAM1
set GIA = GIA*0.95
where NUOCSX = 'Trung Quoc' and Gia <= 10000

--- Câu II.5
alter table KHACHHANG1 alter column LOAIKH varchar(50)
update KHACHHANG1
set LOAIKH = 'Vip'
where (NGDK < '1/1/2007' and DOANHSO >= 10000000) or (NGDK >= '1/1/2007' and DOANHSO >= 2000000)
Select * from KHACHHANG1

--- Câu III.1
select MASP, TENSP from SANPHAM
where NUOCSX = 'Trung Quoc'

--- Câu III.2
select MASP, TENSP from SANPHAM
where (DVT = 'cay') or (DVT = 'quyen')

--- Câu III.3
select MASP, TENSP from SANPHAM
where LEFT(MASP, 1) = 'B' and RIGHT(MASP, 2) = '01'