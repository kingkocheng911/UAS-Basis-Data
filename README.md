# Pengembangan Design Database Berdasarkan Nota Pembelian BBM di Pertamina

Repository ini berisi hasil perancangan dan implementasi **basis data relasional** yang dikembangkan berdasarkan **nota pembelian bahan bakar di SPBU Pertamina**.  
Proyek ini dibuat sebagai bagian dari **UAS Mata Kuliah Basis Data** Program Studi Teknik Informatika.

## 📌 Deskripsi Proyek
Pengelolaan data transaksi pembelian BBM pada SPBU sering kali masih bergantung pada nota fisik, yang memiliki keterbatasan dalam pencatatan, pencarian, dan pelaporan data.  
Melalui proyek ini, data transaksi dari nota pembelian ditransformasikan ke dalam **sistem basis data terstruktur** menggunakan **MySQL**, dengan menerapkan konsep:
- Normalisasi hingga **Third Normal Form (3NF)**
- **Entity Relationship Diagram (ERD)**
- Implementasi **SQL (DDL, DML, TCL)**
- Query pelaporan untuk kebutuhan manajemen

## 🎯 Tujuan
- Merancang struktur basis data transaksi pembelian BBM
- Menerapkan normalisasi untuk menghindari redundansi data
- Mengimplementasikan relasi antar tabel menggunakan ERD
- Menghasilkan laporan transaksi menggunakan query SQL (JOIN, VIEW, agregasi)

## 🧩 Ruang Lingkup
- Studi kasus terbatas pada transaksi pembelian BBM di SPBU Pertamina
- Implementasi menggunakan **MySQL & MySQL Workbench**
- Tidak mencakup pengembangan antarmuka (GUI/Web)
- Output berupa hasil eksekusi query dan laporan data

## 🗂️ Struktur Database
Entitas utama dalam sistem ini meliputi:
- **Pelanggan** : Data konsumen
- **Pegawai** : Operator SPBU
- **BBM** : Jenis BBM, harga, dan stok
- **Transaksi** : Header transaksi
- **Detail Transaksi** : Rincian pembelian BBM

Relasi antar tabel dirancang menggunakan **Primary Key dan Foreign Key** sesuai ERD.

## ⚙️ Fitur Database
- Normalisasi hingga **3NF**
- **Trigger** untuk otomatisasi pengurangan stok BBM
- **Stored Procedure** untuk input data pelanggan
- **View** laporan penjualan harian
- Query JOIN untuk mencetak struk digital transaksi

## 🛠️ Teknologi yang Digunakan
- Database : **MySQL**
- Tools : **MySQL Workbench**
- Bahasa : **SQL**

## 📊 Contoh Output
- Laporan detail transaksi (JOIN multi tabel)
- Rekap penjualan harian (VIEW)
- Otomatisasi stok BBM menggunakan Trigger

## 📁 Dokumen Pendukung
- ERD Database
- Script SQL (DDL, DML, Trigger, Stored Procedure)
- Laporan proyek (PDF)

## 👨‍🎓 Tim Pengembang
- **Muhammad Shafiq Shidiq** (240103196)
- **Yogi Eka Saputra** (240103205)
- **Lintang Putra Ramadhan** (240103220)

## 🏫 Institusi
Program Studi Teknik Informatika  
Fakultas Ilmu Komputer  
Universitas Duta Bangsa Surakarta  
Tahun 2026

## 📎 Referensi
- Jurnal dan literatur terkait basis data, sistem informasi SPBU, dan normalisasi database

---

📌 *Repository ini dibuat untuk tujuan akademik dan pembelajaran.*
