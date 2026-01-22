create database spbu;
use spbu;

create table jenis_bbm(
	id_jenis int primary key auto_increment,
    jenis_bahan_bakar varchar(100) not null
);
create table pompa(
	id_pompa int primary key auto_increment,
    no_pompa int not null
);
create table bahan_bakar(
	id_barang int primary key auto_increment,
    id_jenis int,
    harga_per_liter int not null,
    stock_bahan_bakar int not null,
    id_pompa int,
    constraint fk_jenis foreign key (id_jenis) references jenis_bbm(id_jenis),
    constraint fk_pompa foreign key (id_pompa) references pompa(id_pompa)
);
create table pelanggan (
	id_pelanggan int primary key auto_increment,
    nama_pelanggan varchar(100)
);
create table pegawai (
	id_pegawai int primary key auto_increment,
    operator varchar(100) not null,
    shift varchar(50) not null
);
create table transaksi (
	id_transaksi int primary key auto_increment,
    tgl_transaksi date not null,
    totalharga_transaksi int not null,
    volume_bahan_bakar int not null
);
create table detail_transaksi(
	id_detail int primary key auto_increment,
    id_transaksi int,
    id_pegawai int,
    id_barang int,
    id_pelanggan int,
    constraint fk_transaksi foreign key (id_transaksi) references transaksi(id_transaksi),
    constraint fk_pegawai foreign key (id_pegawai) references pegawai(id_pegawai),
    constraint fk_pelanggan foreign key (id_pelanggan) references pelanggan(id_pelanggan),
    constraint fk_barang foreign key (id_barang) references bahan_bakar(id_barang)
);

INSERT INTO jenis_bbm (jenis_bahan_bakar) VALUES ('Pertalite'), ('Pertamax');

INSERT INTO pompa (no_pompa) VALUES (1), (2);

INSERT INTO pegawai (operator, shift) VALUES ('Andi', 'Pagi'), ('Siti', 'Siang');

INSERT INTO pelanggan (nama_pelanggan) VALUES ('wowo');

INSERT INTO bahan_bakar (id_jenis, harga_per_liter, stock_bahan_bakar, id_pompa) 
VALUES (1, 10000, 5000, 1), (2, 13500, 2000, 2);

DELIMITER //
CREATE TRIGGER kurangi_stok_bbm 
AFTER INSERT ON detail_transaksi
FOR EACH ROW
BEGIN
    UPDATE bahan_bakar 
    SET stock_bahan_bakar = stock_bahan_bakar - (SELECT volume_bahan_bakar FROM transaksi WHERE id_transaksi = NEW.id_transaksi)
    WHERE id_barang = NEW.id_barang;
END //
DELIMITER ;

INSERT INTO transaksi (id_transaksi, tgl_transaksi, totalharga_transaksi, volume_bahan_bakar) 
VALUES (1, '2026-01-20', 100000, 10);

INSERT INTO detail_transaksi (id_detail, id_transaksi, id_pegawai, id_barang, id_pelanggan)
VALUES (1, 1, 1, 1, 1);

SELECT * FROM bahan_bakar;

DELIMITER //

CREATE PROCEDURE tambah_pelanggan_baru(IN p_nama VARCHAR(100))
BEGIN
    INSERT INTO pelanggan (nama_pelanggan) 
    VALUES (p_nama);
END //

DELIMITER ;

CALL tambah_pelanggan_baru('mulyo');

SELECT * FROM pelanggan;

SELECT 
    t.id_transaksi AS 'ID',
    t.tgl_transaksi AS 'Tanggal',
    p.nama_pelanggan AS 'Nama Pelanggan',
    j.jenis_bahan_bakar AS 'Jenis BBM',
    t.volume_bahan_bakar AS 'Liter',
    t.totalharga_transaksi AS 'Total Harga'
FROM detail_transaksi d
JOIN transaksi t ON d.id_transaksi = t.id_transaksi
JOIN pelanggan p ON d.id_pelanggan = p.id_pelanggan
JOIN bahan_bakar b ON d.id_barang = b.id_barang
JOIN jenis_bbm j ON b.id_jenis = j.id_jenis;

INSERT INTO transaksi (id_transaksi, tgl_transaksi, totalharga_transaksi, volume_bahan_bakar) 
VALUES (2, '2026-01-20', 135000, 10);

INSERT INTO detail_transaksi (id_detail, id_transaksi, id_pegawai, id_barang, id_pelanggan)
VALUES (4, 2, 1, 2, 2);

SELECT 
    t.id_transaksi AS 'No Struk', 
    p.nama_pelanggan AS 'Pelanggan', 
    j.jenis_bahan_bakar AS 'Produk BBM', 
    t.volume_bahan_bakar AS 'Liter', 
    t.totalharga_transaksi AS 'Total Bayar'
FROM transaksi t
JOIN detail_transaksi dt ON t.id_transaksi = dt.id_transaksi
JOIN pelanggan p ON dt.id_pelanggan = p.id_pelanggan
JOIN bahan_bakar b ON dt.id_barang = b.id_barang
JOIN jenis_bbm j ON b.id_jenis = j.id_jenis;

CREATE OR REPLACE VIEW rekap_penjualan_harian AS
SELECT 
    t.tgl_transaksi AS 'Tanggal',
    COUNT(t.id_transaksi) AS 'Jumlah Transaksi',
    SUM(t.volume_bahan_bakar) AS 'Total Liter Terjual',
    SUM(t.totalharga_transaksi) AS 'Total Omzet'
FROM transaksi t
GROUP BY t.tgl_transaksi;

SELECT * FROM rekap_penjualan_harian;