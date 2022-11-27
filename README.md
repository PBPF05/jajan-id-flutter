# jajan.id
> Proyek ini dibuat untuk memenuhi tugas Proyek Akhir Semester pada mata kuliah Pemrograman Berbasis Platform (CSGE602022) yang diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia pada Semester Gasal, Tahun Ajaran 2022/2023.

## Pengembang

Proyek ini dibuat oleh kelompok F05, yang terdiri dari:

- Audrey Zefanya Priyambodo (2106650443)
- Divany Harryndira (2106701734)
- Jeremy Mervin Juniandi Sitorus (2106654675)
- Natasya Ashil Zhafirah (2106650090)
- Rendy Arya Kemal (2106639945)

## Deskripsi Aplikasi
Nama Aplikasi: jajan.id

### Fungsi Aplikasi
jajan.id merupakan platform yang dibuat untuk pedagang kecil. Dengan begitu, diharapkan para pedagang dapat lebih diketahui oleh masyarakat sekitar, serta memperkuat semangat untuk terus berkreasi dan berinovasi dalam dagangannya. 

### Role

1. Registered User
   - Owner toko
     - Membuat ataupun menghapus toko
     - Menambah atau menghapus barang yang dijual
     - Mengatur jam operasional toko
     - Menjawab pertanyaan yang diajukan oleh konsumen melalui chat
   - User (konsumen)
     - Melihat detail dari masing-masing toko
     - Mengajukan pertanyaan kepada admin toko melalui chat

2. Guest
   - Dapat melihat daftar toko dan membuat akun.

## Daftar Modul

1. Home Page (Jeremy Mervin Juniandi Sitorus)
   - Menampilkan halaman awal berupa login, register, dan logout
   - Dapat mengirim pesan kontak
2. Katalog toko (Natasya Ashil Zhafirah)
   - Menampilkan halaman yang berisikan daftar toko yang dapat dilihat dan dipilih oleh user
   - Mengimplementasikan fitur pencarian toko
3. Detail toko (Audrey Zefanya Priyambodo)
   - Menampilkan halaman dari salah satu card yang dipilih oleh user, berisikan detail dari toko tersebut
   - Menampilkan daftar barang yang dijual
   - Memberi rating ke toko
4. Dashboard penjual (Divany Harryndira)
   - Membuka toko
   - Mengatur data toko yang ditampilkan di website
5. Chat user-penjual (Rendy Arya Kemal)
   - Menampilkan halaman chatting untuk user dan penjual dapat berkomunikasi

## Alur Integrasi
Integrasi dengan _web service_ yang telah dibuat berdasarkan berikut:
1. Membuat _endpoint_ otentikasi (login maupun logout) melalui JSON pada _web service_
2. Melakukan otentikasi pada aplikasi Flutter
3. Menyimpan _session cookie_ yang diberikan oleh _web service_
4. Melakukan alur aplikasi seperti biasa, namun menggunakan _session cookie_ yang telah didapat untuk melakukan _request_
