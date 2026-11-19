# TugasKu – Aplikasi Pencatat Tugas Kuliah

## Deskripsi Aplikasi

**TugasKu** merupakan aplikasi mobile berbasis Flutter yang dikembangkan untuk membantu mahasiswa dalam mencatat, mengelola, dan memantau tugas kuliah beserta tenggat waktu pengerjaannya.

Aplikasi ini memungkinkan pengguna untuk menambahkan tugas, melihat daftar dan detail tugas, mengubah informasi tugas, serta menghapus tugas yang sudah tidak diperlukan.

Aplikasi ini dibuat sebagai pemenuhan Ujian Tengah Semester (UTS) mata kuliah Pemrograman Mobile.

## Identitas Pengembang

| Keterangan | Informasi |
|---|---|
| Nama | Akbar Syam Al Ghamar |
| NIM | C2483207013 |
| Mata Kuliah | Pemrograman Mobile |
| Dosen Pengampu | Alamsyah Firdaus, M.Kom. |

## Teknologi yang Digunakan

- Flutter SDK
- Bahasa Pemrograman Dart
- Visual Studio Code
- Android Emulator / Smartphone Android
- Git dan GitHub

## Fitur Aplikasi

Aplikasi TugasKu memiliki beberapa fitur utama:

1. **Daftar Tugas**  
   Menampilkan seluruh tugas kuliah beserta mata kuliah, tenggat, prioritas, dan status penyelesaian.

2. **Tambah Tugas (Create)**  
   Menambahkan tugas baru melalui formulir yang tersedia.

3. **Detail Tugas (Read)**  
   Menampilkan informasi lengkap dari tugas yang dipilih.

4. **Edit Tugas (Update)**  
   Mengubah informasi tugas yang sudah tersimpan.

5. **Hapus Tugas (Delete)**  
   Menghapus tugas dengan konfirmasi sebelum data dihapus.

6. **Validasi Form**  
   Memastikan data yang dimasukkan sesuai dengan ketentuan.

7. **Status Tugas**  
   Menampilkan status tugas yang sudah selesai maupun belum selesai.

8. **Ringkasan Tugas**  
   Menampilkan jumlah total tugas, tugas selesai, dan tugas belum selesai.

## Struktur Folder

```text
tugas_ku/
│
├── lib/
│   ├── main.dart
│   │
│   ├── models/
│   │   └── tugas.dart
│   │
│   ├── screens/
│   │   ├── daftar_tugas.dart
│   │   ├── form_tugas.dart
│   │   └── detail_tugas.dart
│   │
│   └── widgets/
│       └── kartu_tugas.dart
│
├── screenshots/
│
├── pubspec.yaml
├── README.md
└── .gitignore
```

*Catatan: Struktur folder disesuaikan dengan file yang benar-benar digunakan dalam proyek.*

## Cara Instalasi dan Menjalankan Aplikasi

Ikuti langkah-langkah berikut untuk menjalankan aplikasi TugasKu.

### 1. Clone Repository
```bash
git clone https://github.com/USERNAME/REPOSITORY.git
```
### 2. Masuk ke Folder Project
```bash
cd tugas_ku
```
### 3. Install Dependencies
```bash
flutter pub get
```
### 4. Jalankan Aplikasi
```bash
flutter run```

Pastikan Flutter SDK dan perangkat Android atau emulator sudah tersedia.

## Penyimpanan Data

Aplikasi ini menggunakan `List` sebagai penyimpanan data sementara di dalam memori.

Data tidak disimpan secara permanen ke database. Oleh karena itu, data akan kembali ke kondisi awal ketika aplikasi dijalankan ulang.

## Dokumentasi Screenshot

Berikut merupakan dokumentasi tampilan aplikasi TugasKu.

| No. | Nama Screenshot | Keterangan |
|---|---|---|
| 1 | 01_Halaman_Utama.png | Halaman utama aplikasi |
| 2 | 02_Halaman_Daftar.png | Halaman daftar tugas |
| 3 | 03_Form_Tambah.png | Form tambah tugas |
| 4 | 04_Halaman_Detail.png | Detail tugas |
| 5 | 05_Form_Edit.png | Form edit tugas |
| 6 | 06_Konfirmasi_Hapus.png | Konfirmasi penghapusan |
| 7 | 07_Hasil_Tambah.png | Hasil penambahan tugas |
| 8 | 08_Hasil_Update.png | Hasil perubahan tugas |
| 9 | 09_Hasil_Delete.png | Hasil penghapusan tugas |
| 10 | 10_Validasi_Form.png | Validasi formulir |

Screenshot dapat dilihat pada folder `screenshots` di repository ini.

## Video Demonstrasi

Video demonstrasi proses pengembangan dan pengujian aplikasi TugasKu dapat dilihat melalui tautan berikut:

**Link YouTube:** [Masukkan URL Video YouTube]

## Repository GitHub

Source code aplikasi TugasKu dapat diakses melalui repository berikut:

**Link GitHub:** [Masukkan URL Repository]

---

## Penutup

Aplikasi TugasKu dikembangkan sebagai implementasi pembelajaran Pemrograman Mobile menggunakan Flutter dan Dart, khususnya materi widget dan layout, navigasi, form dan validasi, serta pengolahan data menggunakan konsep CRUD.
