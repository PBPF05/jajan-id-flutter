# jajan.id

[![Staging](https://github.com/PBPF05/jajan-id-flutter/actions/workflows/staging.yaml/badge.svg)](https://github.com/PBPF05/jajan-id-flutter/actions/workflows/staging.yaml)
[![Pre-Release](https://github.com/PBPF05/jajan-id-flutter/actions/workflows/pre-release.yaml/badge.svg)](https://github.com/PBPF05/jajan-id-flutter/actions/workflows/pre-release.yaml)
[![Release](https://github.com/PBPF05/jajan-id-flutter/actions/workflows/release.yaml/badge.svg)](https://github.com/PBPF05/jajan-id-flutter/actions/workflows/release.yaml)
[![Build status](https://build.appcenter.ms/v0.1/apps/009e2f3a-0462-415a-94eb-8c5e7b5a0dc4/branches/main/badge)](https://appcenter.ms)

> Proyek ini dibuat untuk memenuhi tugas Proyek Akhir Semester pada mata kuliah Pemrograman Berbasis Platform (CSGE602022) yang diselenggarakan oleh Fakultas Ilmu Komputer, Universitas Indonesia pada Semester Gasal, Tahun Ajaran 2022/2023.

# Recording Penjelasan
Dapat dilihat di [video YouTube ini](https://youtu.be/9Vo8Jknvmws). Penjelasan secara teks dapat dilihat [di bagian implementasi di bawah](#implementasi).

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
   - Membuat halaman otentikasi login dan register
   - Membuat halaman awal yang mengarah ke halaman lainnya
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

## Implementasi
1. Home Page (Jeremy Mervin Juniandi Sitorus)
    * Menggunakan Stateful Widget (Login, Homepage, Kontak), Statless Widget (Register)
    * Implementasi Login:
        1. Menggunakan form untuk menerima input dari user (Username dan Password)
        1. Menggunakan DecorationImage untuk background pada login page
        1. Padding form username dan password dengan menggunakan Column, dan MainAxisAlignment Center
        1. Menggunakan InputDecoration sebagai placeholder dari masing masing form
        1. Button login menggunakan OutlinedButton yang jika di klik (onPressed) dan tervalidasi akan masuk ke halaman utama (Homepage). Dan jika tidak tervalidasi akan muncul pop up message yang diimplementasikan dengan ScaffoldMessenger
        1. Link ke halaman Register jika user belum mempunyai akun. Styling dengan TextStyle
        
    * Implementasi Register:
        1. Menggunakan form untuk menerima input dari user (Email, Username dan Password)
        1. Menggunakan TextEditingController untuk memvalidasi input username dan email dari user
        1. Padding form dengan menggunakan Column, dan MainAxisAlignment Center
        1. Menggunakan InputDecoration sebagai placeholder dari masing masing form
        1. Button register menggunakan OutlinedButton yang jika di klik (onPressed) dan tervalidasi akan memparse json ke path register flutter dan masuk ke halaman Login. Jika tidak tervalidasi akan muncul pop up message yang diimplementasikan dengan ScaffoldMessenger

    * Implementasi HomePage : 
        1. Membuat 4 buah card untuk mengalihkan ke masing masing modul
        1. Card dibuat dengan menggunakan TextButton dan Expanded, yang akan mengexpand Column.
        1. Membuat navbar pada bagian bawah untuk masuk ke halaman home dan logout. Navbar pada bagian bawah dibuat dengan menggunakan BottomNavigationBar

    * Implementasi Kontak : 
        1. Menggunakan form (TextFormField)  untuk menerima input dari user (Subject dan Pesan) dari user.
        1. Padding masing masing form sebesar 8 pixel
        1. Menggunakan InputDecoration sebagai placeholder dari masing masing form.
        1. Tombol kirim dibuat dengan menggunakan TextButton yang jika tervalidasi akan memunculkan sebuah message bahwa Pesan berhasil ditambahkan yang diimplementasikan dengan menggunakan fungsi showDialog

1. Katalog toko (Natasya Ashil Zhafirah)
    * Menggunakan Stateful Widget
    * Implementasi Search Toko:
        1. Menggunakan TextField dengan terdapat hintText: “Search Toko”.
        2. Menggunakan widget Expanded supaya dapat terpisah antara implementasi search Toko dan daftar Toko
        3. Menggunakan TextButton dengan Text “Search”, jika melakukan onPressed akan muncul showDialog yang niatnya untuk memunculkan Toko yang di search (tidak terealisasikan pada munculnya data Toko yang dicari).

    * Implementasi Daftar Toko:
        1. Menggunakan FutureBuilder dengan ListView untuk menampilkan list daftar Toko.
        2. Menggunakan Scaffold.
        3. Menggunakan widget Expanded supaya dapat terpisah antara implementasi search Toko dan daftar Toko
        4. Menggunakan Container untuk menampilkan daftar Toko dengan dibantu BoxDecoration untuk style-nya.
        5. Menggunakan Column untuk mengisi Text seperti nama Toko, deskripsi, serta lokasi, provinsi dan kota. Pada bagian nama Toko menggunakan widget Center supaya tulisan berada di tengah.
        6. Menggunakan Row untuk mengisi Text jadwal buka toko, range harga, dan kondisi dengan dibantu dengan icon untuk style-nya.
        7. Menggunakan TextButton dengan Text “Detail” yang nantinya jika melakukan onPressed akan menyambungkan pada modul lainnya yaitu Detail Toko.

2. Detail toko (Audrey Zefanya Priyambodo)
    * Detail Page - Stateful Widget
        1.Menggunakan SingleChildScrollView() untuk tampilan utama pada halaman detail.
        1. Menggunakan FutureBuilder() untuk menampilkan data toko dari daftar katalog.
        1. Menggunakan widget Image untuk menampilkan gambar pada halaman utama.
        1. Menggunakan widget padding untuk mengatur elemen.
        1. Menggunakan widget column untuk menempatkan detail seperti deskripsi, jam operasional dan harga.
        1. Menggunakan widget row untuk harga.
        1.  Menggunakan widget icon (IconButton) dengan event onTap() pada tombol back dan dengan event onPressed() pada tombol review. 
    * Review Form - Stateful Widget
        1. Menggunakan Center dan Column untuk layouting.
        1. Menggunakan widget padding untuk mengatur elemen.
        1. Menggunakan ElevatedButton() dengan event onPressed() untuk tombol submit.
        1. Menggunakan widget icon (IconButton) dengan event onTap() pada tombol back.
        1. Menggunakan TextField() untuk komentar serta nama user dengan labelText masing-masing.
    * Review Page - Stateless Widget
        1. Menggunakan Center() dan Column() untuk layouting.
        2. Menggunakan widget column untuk nama dan komentar.


3. Dashboard penjual (Divany Harryndira)
    * Implementasi halaman utama dashboard:
        1. Menggunakan FutureBuilder untuk memperoleh data dari web. Juga menggunakan conditional di mana tampilan dashboard akan berbeda antara pengguna yang tidak memiliki toko dengan penjual
        1. Pada halaman dashboard pengguna biasa (selanjutnya akan memakai term ini untuk pengguna yang tidak memiliki toko), digunakan:
            1. Widget Image untuk menampilkan gambar
            1. ElevatedButton yang memiliki event onTap() menuju ke halaman form membuat toko
            1. Center dan Column untuk layoutingnya.
        1. Pada halaman dashboard penjual digunakan:
            1. Column dan Row untuk layouting selain card
            1. Gridview untuk layouting card
            1. Card untuk menampilkan menu-menu
            1. ElevatedButton untuk buka tutup toko

4. Chat user-penjual (Rendy Arya Kemal)
    * Implementasi page history pesan
        1. Menggunakan StatefulWidget karena butuh melakukan fetching
        1. Menggunakan RefreshIndicator untuk fitur pull down to refresh
        1. Menggunakan FutureBuilder dengan ListBuilder separated untuk melakukan generasi list history.
        1. Untuk setiap history chat, dibuat Card dengan data tokoh dan pesan terakhir, dimana saat onTap akan berpindah ke menu Chat dengan tokoh tersebut.
        
    * Implementasi page chat
        1. Menggunakan StatefulWidget karena butuh fetching
        1. Membuat komponen baru yaitu ConversationContainer, dimana:
            1. Berupa StatelessWidget yang menerima messages dan scroll controller
            1. Melakukan generate chat menggunakan ListBuilder yang akan berisi Card setiap message
            1. Apabila ada kemungkinan pesan yang lebih lama, widget juga menaruh tombol “Load more” yang saat onTap akan mengambil pesan tersebut.
        1. Membuat layout page menggunakan Column, dimana childrennya yaitu
            1. ConversationContainer
            1. Row yang berisi Form dengan input dan button, yang saat onTap akan mengirim pesan
        1. Saat initState, akan:
            1. Melakukan fetching history pesan.
            1. Membuat Timer.periodic untuk meng-update pesan tiap 5 detik apabila ada pesan baru, akan disimpan
