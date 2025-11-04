# README

## 1. Widget Tree pada Flutter

Dalam Flutter, widget tree adalah struktur hierarki yang menunjukkan bagaimana widget-widget tersusun membentuk tampilan aplikasi. Flutter membangun UI dari widget paling atas (root) kemudian bercabang menjadi widget-widget lain layaknya sebuah pohon. Setiap widget dapat memiliki satu atau beberapa widget di dalamnya, yang disebut sebagai child. Widget yang membungkus widget lain disebut parent. Parent berperan untuk mengatur tata letak, ukuran, dan pengaturan tampilan child, sedangkan child mengikuti aturan yang ditentukan oleh parent. Hubungan parent-child ini membuat Flutter fleksibel dalam membangun UI secara modular serta mudah untuk dibaca dan dikelola.

## 2. Widget yang Digunakan dan Fungsinya

| Widget           | Fungsi                                                                 |
|------------------|-------------------------------------------------------------------------|
| `MaterialApp`     | Root aplikasi untuk mengatur tema, navigasi, dan struktur Material Design |
| `Scaffold`        | Menyediakan struktur dasar layar seperti AppBar, body, dan SnackBar   |
| `AppBar`          | Menampilkan header aplikasi pada bagian atas layar                    |
| `Text`            | Menampilkan teks                                                      |
| `Padding`         | Memberikan jarak di sekitar widget                                    |
| `Column`          | Menyusun widget secara vertikal                                       |
| `Row`             | Menyusun widget secara horizontal                                     |
| `Card`            | Menampilkan konten dalam bentuk kartu dengan bayangan (elevation)     |
| `Container`       | Membungkus widget dan memberi properti seperti padding & ukuran       |
| `SizedBox`        | Memberikan jarak antar widget                                         |
| `GridView.count`  | Menampilkan item dalam grid dengan jumlah kolom tertentu              |
| `Icon`            | Menampilkan ikon                                                      |
| `Material`        | Memberikan efek Material seperti rounded corner dan warna             |
| `InkWell`         | Memberikan efek klik (ripple effect) pada widget                      |
| `SnackBar`        | Menampilkan pesan singkat di bagian bawah layar                       |
| `MediaQuery`      | Mendapat informasi ukuran layar untuk responsive UI                   | | Fungsi |
|--------|---------|
| `MaterialApp` | Sebagai root aplikasi untuk konfigurasi tema, navigasi, dan struktur Material Design |
| `Scaffold` | Menyediakan struktur dasar layar seperti AppBar, body, dan SnackBar |
| `AppBar` | Menampilkan header aplikasi pada bagian atas layar |
| `Text` | Menampilkan teks |
| `Padding` | Memberikan jarak di sekitar widget |
| `Column` | Menyusun widget secara vertikal |
| `Row` | Menyusun widget secara horizontal |
| `Card` | Menampilkan konten dalam bentuk kartu dengan bayangan (elevation) |
| `Container` | Membungkus widget lain dan memberi properti seperti padding, width, dan height |
| `SizedBox` | Memberikan jarak kosong antar widget |
| `GridView.count` | Menampilkan item dalam bentuk grid dengan jumlah kolom tertentu |
| `Icon` | Menampilkan ikon |
| `Material` | Memberikan efek dan styling material seperti rounded corner dan warna |
| `InkWell` | Memberikan efek klik (ripple effect) pada widget |
| `SnackBar` | Menampilkan pesan singkat di bagian bawah layar |
| `ScaffoldMessenger` | Mengatur penampilan SnackBar |
| `MediaQuery` | Mengambil informasi ukuran layar untuk menyesuaikan UI |
| `SingleChildScrollView` | Membuat halaman bisa di-scroll ketika konten melebihi tinggi layar |

## 3. Fungsi MaterialApp

Widget `MaterialApp` berfungsi sebagai pembungkus utama aplikasi Flutter yang menggunakan Material Design. Widget ini mengatur berbagai konfigurasi penting seperti tema aplikasi, routing untuk navigasi antar halaman, judul aplikasi, serta menentukan halaman pertama (home) yang akan ditampilkan. `MaterialApp` sering dijadikan widget root karena memberikan struktur dasar bagi aplikasi agar dapat menggunakan komponen-komponen Material Design seperti AppBar, Button, Scaffold, dan SnackBar. Dengan menggunakan `MaterialApp`, pengembangan aplikasi menjadi lebih konsisten dan sesuai standar UI modern.

## 4. StatelessWidget vs StatefulWidget

`StatelessWidget` adalah jenis widget yang tidak memiliki state atau kondisi yang dapat berubah setelah widget tersebut dibangun. Widget ini cocok digunakan untuk tampilan yang bersifat statis dan tidak membutuhkan pembaruan data, seperti teks, ikon, atau layout sederhana. Sementara itu, `StatefulWidget` adalah widget yang memiliki state dan dapat berubah selama aplikasi berjalan. Perubahan state dapat menyebabkan UI di-rebuild menggunakan `setState()`. StatefulWidget digunakan ketika tampilan harus berubah secara dinamis, seperti form input, counter, toggle, atau perubahan data dari API. Pemilihan widget tergantung pada apakah UI perlu diperbarui saat aplikasi berjalan. Jika UI bersifat tetap, gunakan StatelessWidget; jika UI berubah, gunakan StatefulWidget.

## 5. BuildContext pada Flutter

`BuildContext` adalah objek yang merepresentasikan lokasi sebuah widget di dalam widget tree. BuildContext digunakan Flutter untuk mengetahui posisi widget, mengakses parent widget, dan mendapatkan data seperti tema, ukuran layar, atau memanggil fungsi yang membutuhkan konteks tampilan, misalnya menampilkan SnackBar atau melakukan navigasi. BuildContext penting karena memungkinkan widget berinteraksi dengan widget lain di tree. Di dalam metode `build`, BuildContext diberikan sebagai parameter sehingga widget dapat membangun UI berdasarkan konteksnya. Contohnya, `Theme.of(context)` untuk mengambil tema, dan `ScaffoldMessenger.of(context)` untuk menampilkan SnackBar.

