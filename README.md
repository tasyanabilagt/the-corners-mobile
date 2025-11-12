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

### Tugas 8
## 1. Perbedaan antara Navigator.push() dan Navigator.pushReplacement() pada Flutter.
Navigator.push() berfungsi untuk menambahkan halaman baru di bagian atas stack dari halaman yang sedang aktif. Ketika pengguna menekan tombol 'Back', maka halaman sebelumnya akan muncul kembali dengan mengambil halaman dari top of stack yang disimpan. Contoh penggunaan dalam aplikasi: saat user membuka halaman Add Product atau Tambah Produk dari Home page melalui drawer. 

Sementara itu, Navigator.pushReplacement() berfungsi untuk mengganti halaman aktif dengan halaman baru. Halaman lama akan dihapus dari stack, jadi tidak bisa dikembalikan dengan tombol 'Back' karena halaman tersebut sudah tidak ada pada stack. Dalam implementasi, Navigator.pushReplacement() cocok untuk fitur checkout karena ketika pengguna checkout aksinya tidak dapat dikembalikan, sehingga kita tidak perlu menyimpan halaman sebelumnya.

## 2. Pemanfaatan Hierarchy Widget (Scaffold, AppBar, Drawer)
Scaffold berfungsi sebagai penyedia struktur dasar dari setiap halaman yang dibuat (AppBar, Drawer, dan body)
AppBar berfungsi untuk menampilkan judul halaman dan memberikan identitas yang konsisten
Drawer berfungsi sebagai navigasi utama antar halaman, misalnya antara Home Page dan Add Product Page. Dengan memanfaatkan Hierarchy Widget ini, setiap halaman memiliki konsistensi yang sama, sehingga pengalaman pengguna bisa terasa lebih nyaman dan stabil. 

## 3. Kelebihan menggunakan layout widget seperti Padding, SingleChildScrollView, dan ListView saat menampilkan elemen-elemen form.
Widget layput seperti Padding, SingleChildSrollView dan ListView berguna untuk mengatur tata letak dan responsivitas form itu sendiri.
Padding berfungsi untuk memberi jarak agar elemen posisinya tidak terlalu rapat. Contoh penggunaan: Setiap TextFormField dibungkus dengan Padding(all: 8.0), artinya dalam form jika terdapat field berupa text, jarak antara field tersebut di setiap sisi terhadap border adalah 8.0

SingleChildScrollView berfungsi agar setiap halaman dapat discroll. Hal ini penting agar form yang dibuat tidak overflow saat keyboard muncul jika memiliki banyak field input. Contoh penggunaan: Seluruh form dibungkus dengan SingleChildScrollView, salah satunya form create product yang dapat discroll.

ListView biasanya dipakai di halaman daftar produk, untuk menampilkan banyak item dalam mode scroll view. Contoh penggunaan: Nantinya akan digunakan untuk daftar produk yang ada di The Corners (Future use)

Kelebihan pengunaan layout widget adalah tampilan form menjadi lebih rapi, konsisten, tidak tumpang tindih, dan tetap nyaman dilihat meskipun layar kecil.

## 4. Bagaimana kamu menyesuaikan warna tema agar aplikasi Football Shop memiliki identitas visual yang konsisten dengan brand toko?
Untuk menunjukkan identitas toko The Corners, aplikasi ini menggunakan kombinasi warna, struktur halaman, dan gaya desain yang konsisten dengan versi web-nya.

Warna biru digunakan sebagai warna utama (primary color) karena merepresentasikan profesionalitas, kepercayaan, dan kestabilan brand. Warna merah dipakai sebagai warna aksen pada elemen penting seperti logo “The Corners” dan tombol aksi (misalnya tombol Save di halaman Add Product) untuk memberikan kesan energik dan bersemangat khas dunia olahraga.

Selain itu, warna putih dan abu muda dipilih sebagai latar belakang untuk menjaga kesan bersih dan modern, sekaligus membantu fokus pengguna tetap pada konten produk. Semua elemen antarmuka seperti kartu, form input, dan tombol menggunakan rounded corners serta bayangan halus (soft shadow) agar tampilannya terasa modern dan ringan.

Struktur layout disusun secara konsisten menggunakan Scaffold, AppBar, dan Drawer pada setiap halaman supaya pengalaman pengguna terasa seragam. Sementara warna pada tombol besar di halaman utama (biru untuk All Products, hijau untuk My Products, dan merah untuk Create Product) tetap dipertahankan sebagai ciri khas visual utama dari The Corners.

Dengan cara ini, aplikasi Flutter The Corners tetap mempertahankan identitas visual toko yang sporty, clean, dan profesional, sekaligus memberikan pengalaman pengguna yang familiar antara versi web dan mobile-nya.