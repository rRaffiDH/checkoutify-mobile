# checkout_ify
## Tugas 7
1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.
Stateless Widget: Widget yang bersifat statis, artinya tidak memiliki keadaan state yang dapat berubah. Setelah widget ini dibuat, ia tidak akan berubah atau memperbarui tampilannya selama aplikasi berjalan.

Stateful Widget: Widget yang bersifat dinamis, artinya memiliki keadaan state yang bisa berubah. Jika state berubah, widget akan membangun ulang (rebuild) tampilan UI yang sesuai dengan perubahan tersebut.

Perbedaan :
Stateless widget tidak memiliki State dan tampilannya tetap selama aplikasi berjalan.
Stateful widget memiliki State, dan tampilannya dapat berubah berdasarkan perubahan yang terjadi di dalam State.

2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.
MaterialApp : Widget root (utama) untuk aplikasi Flutter, berisikan judul, tema, dan halaman utama
AppBar: Menampilkan toolbar di bagian atas layar dengan opsi seperti judul dan tombol aksi, pada proyek saya digunakan untuk menampilkan tulisan checkoutify
SnackBar : Memberikan pesan notifikasi sementara di bagian bawah layar, digunakan saat user menekan tombol

3. Apa fungsi dari setState()? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.
setState() adalah method yang digunakan dalam Stateful Widget untuk memberitahu framework bahwa ada perubahan pada data yang menyebabkan UI perlu di-render ulang. Saat kita memanggil setState(), Flutter akan menjalankan ulang fungsi build() untuk memperbarui UI.

Variabel yang Terdampak oleh setState():
Variabel-variabel yang dideklarasikan di dalam kelas State dari Stateful Widget.
Setiap variabel yang berubah nilai dan mempengaruhi UI, seperti variabel penampung status switch, nilai input, atau daftar item yang ditampilkan.

4. Jelaskan perbedaan antara const dengan final.
const dipakai untuk nilai yang sudah diketahui dan tetap saat kompilasi.
final dipakai untuk nilai yang tidak akan berubah setelah inisialisasi pertama, tetapi bisa ditentukan pada runtime.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.
- Membuat proyek Checkoutify dengan command `flutter create checkout_ify`
- Membuat Tiga Tombol Sederhana dengan Ikon dan Teks
    - Tombol-tombol untuk Lihat Daftar Produk, Tambah Produk, dan Logout sudah dibuat dalam bentuk item ItemHomepage yang diinstansiasi dalam variabel items di dalam MyHomePage.
    - Setiap tombol memiliki ikon dan teks yang sesuai:
        - Lihat Daftar Produk dengan ikon `Icons.list`
        - Tambah Produk dengan ikon `Icons.add`
        - Logout dengan ikon `Icons.logout`
    - Tombol-tombol ini dirender dalam bentuk `GridView.count` di dalam body widget Scaffold, dengan setiap item direpresentasikan oleh ItemCard.
- Warna-warna tombol sudah diimplementasikan pada setiap ItemHomepage sebagai berikut:
    - Lihat Daftar Produk memiliki warna biru `Colors.blue`
    - Tambah Produk memiliki warna hijau `Colors.green`
    - Logout memiliki warna merah `Colors.red`
- Setiap warna diterapkan pada properti color di dalam ItemHomepage dan digunakan dalam ItemCard melalui `Material(color: item.color)` untuk mewarnai latar belakang setiap tombol.
- Fungsi onTap pada InkWell di dalam ItemCard akan memunculkan Snackbar ketika tombol ditekan.
- Snackbar menampilkan pesan dinamis yang sesuai dengan tombol yang ditekan, berkat penggunaan `item.name` untuk menentukan nama tombol.
    - Jika tombol Lihat Daftar Produk ditekan, maka Snackbar akan menunjukkan "Kamu telah menekan tombol Lihat Daftar Produk".
    - Jika tombol Tambah Produk ditekan, Snackbar akan menunjukkan "Kamu telah menekan tombol Tambah Produk".
    - Jika tombol Logout ditekan, Snackbar akan menunjukkan "Kamu telah menekan tombol Logout".
- Untuk memastikan Snackbar tidak bertumpuk, kode menggunakan `ScaffoldMessenger.of(context)..hideCurrentSnackBar()` sebelum menampilkan Snackbar baru.

## Tugas 8
1. Apa kegunaan const di Flutter? Jelaskan apa keuntungan ketika menggunakan const pada kode Flutter. Kapan sebaiknya kita menggunakan const, dan kapan sebaiknya tidak digunakan?
    - Dalam Flutter, kata kunci const digunakan untuk membuat nilai yang bersifat konstan (immutable) dan compile-time constant. Artinya, nilai tersebut tidak bisa berubah setelah diinisialisasi dan akan dievaluasi saat kompilasi
    - Keuntungan Menggunakan const :
        - Optimasi Performa: Objek yang di-deklarasikan sebagai const akan dibuat hanya satu kali di memori, sehingga lebih hemat memori.
        - Pengurangan Overhead Runtime: Karena objek sudah dievaluasi saat kompilasi, tidak perlu lagi dievaluasi saat runtime.
        - Mencegah Mutasi Data: const menjamin objek bersifat immutable, sehingga lebih aman dan menghindari perubahan data yang tidak diinginkan.
    - Kapan Menggunakan const
        - Saat Anda memiliki nilai tetap yang tidak akan berubah selama aplikasi berjalan
        - Saat membuat widget stateless di Flutter, gunakan const untuk widget yang tidak berubah agar widget tidak di-rebuild
        - Saat bekerja dengan koleksi (List, Map, Set) yang immutable.
    - Kapan Sebaiknya Tidak Menggunakan const
        - Saat nilai dapat berubah selama runtime
        - Jika objek tersebut membutuhkan evaluasi yang tidak bisa dilakukan saat compile-time

2. Jelaskan dan bandingkan penggunaan Column dan Row pada Flutter. Berikan contoh implementasi dari masing-masing layout widget ini!
    - Column dan Row adalah widget dasar untuk membuat tata letak vertikal atau horizontal.
    - Column :
        - Digunakan untuk menampilkan widget secara vertikal (atas ke bawah)
        - Implementasi : 

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh Column")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Tengah pada sumbu utama
          crossAxisAlignment: CrossAxisAlignment.start, // Kiri pada sumbu silang
          children: <Widget>[
            Text("Item 1"),
            Text("Item 2"),
            Text("Item 3"),
          ],
        ),
      ),
    );
  }
}
```

    - Row : 
        - Digunakan untuk menampilkan widget secara horizontal (kiri ke kanan)
        - Implementasi : 

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Contoh Row")),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center, // Tengah pada sumbu utama
          crossAxisAlignment: CrossAxisAlignment.center, // Tengah pada sumbu silang
          children: <Widget>[
            Icon(Icons.star, color: Colors.blue, size: 50),
            Icon(Icons.star, color: Colors.red, size: 50),
            Icon(Icons.star, color: Colors.green, size: 50),
          ],
        ),
      ),
    );
  }
}
```

3. Sebutkan apa saja elemen input yang kamu gunakan pada halaman form yang kamu buat pada tugas kali ini. Apakah terdapat elemen input Flutter lain yang tidak kamu gunakan pada tugas ini? Jelaskan!
    - Elemen Input yang Digunakan : 
        - TextFormField
            - Digunakan untuk mengumpulkan data dari pengguna dalam bentuk teks. Di sini, terdapat lima TextFormField untuk mengumpulkan informasi produk:
                - Product Name: Mengumpulkan nama produk.
                - Product Price: Mengumpulkan harga produk.
                - Product Stock: Mengumpulkan jumlah stok produk.
                - Product Description: Mengumpulkan deskripsi produk.
                - Product Image: Mengumpulkan URL atau path gambar produk.
        - ElevatedButton
            - Digunakan sebagai tombol untuk menyimpan data produk yang telah diisi oleh pengguna.
    - Elemen Input yang Tidak Digunakan
        - DropdownButtonFormField
            - Menampilkan daftar pilihan dalam bentuk dropdown
        - Checkbox 
            - Menampilkan kotak centang untuk pilihan boolean (true/false)
        - DatePicker
            - Menampilkan dialog untuk memilih tanggal
        - Slider dan masih banyak lagi
            - Menyediakan kontrol untuk memilih nilai dari rentang tertentu
            - Masih banyak lagi input yang belum digunakan

4. Bagaimana cara kamu mengatur tema (theme) dalam aplikasi Flutter agar aplikasi yang dibuat konsisten? Apakah kamu mengimplementasikan tema pada aplikasi yang kamu buat?
    - Menggunakan properti theme pada widget MaterialApp. Dengan menggunakan tema, kita dapat menjaga konsistensi tampilan dan gaya di seluruh aplikasi
    - colorScheme : 
        - Menggunakan ColorScheme.fromSwatch() untuk menentukan warna utama (primarySwatch) dengan warna hijau (Colors.green).
        - Menggunakan .copyWith() untuk menetapkan warna sekunder (secondary) menjadi Colors.greenAccent.
    - Penggunaan Tema di Widget Lain : 
        - AppBar : backgroundColor: Theme.of(context).colorScheme.primary
        - LeftDrawer : color: Theme.of(context).colorScheme.primary

5. Bagaimana cara kamu menangani navigasi dalam aplikasi dengan banyak halaman pada Flutter?
    - Menerapkan navigasi antar halaman menggunakan Navigator. Di Flutter, ada beberapa cara untuk menangani navigasi antar halaman (routing), yaitu dengan memanfaatkan Navigator secara eksplisit melalui Navigator.push(), Navigator.pushReplacement(), dan Navigator.pop().
    - Navigator.push() pada ItemCard : 
```dart
onTap: () {
  if (item.name == "Add Product") {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ProductFormPage()),
    );
  }
}
```

    - Navigator.pushReplacement() pada LeftDrawer : 

```dart
onTap: () {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => MyHomePage(),
    ),
  );
}
```

    - Navigator.pop() pada ProductFormPage : 

```dart
onPressed: () {
  Navigator.pop(context);
  _formKey.currentState!.reset();
},
```
## Tugas 9
1. Jelaskan mengapa kita perlu membuat model untuk melakukan pengambilan ataupun pengiriman data JSON? Apakah akan terjadi error jika kita tidak membuat model terlebih dahulu?

  - Model membantu dalam parsing JSON menjadi objek Dart yang dapat digunakan dalam aplikasi. Menggunakan model, kita dapat mengkonversi data JSON dengan mudah menggunakan metode seperti fromJson() dan toJson().
  - Model membantu dalam validasi data yang diterima dari backend. Jika data JSON tidak sesuai dengan struktur model, kita dapat menangani kesalahan lebih awal.
  - Menggunakan model memastikan bahwa data yang digunakan di seluruh aplikasi memiliki struktur yang konsisten.
  - Ya, jika kita tidak membuat model, kita mungkin menghadapi kesulitan dalam memproses data JSON, terutama saat data kompleks. Aplikasi juga akan lebih rentan terhadap error ketika mencoba mengakses field yang tidak ada. Tanpa model, kita harus memproses JSON secara manual, yang lebih rawan error dan sulit dikelola.

2. Jelaskan fungsi dari library http yang sudah kamu implementasikan pada tugas ini

  - Library http di Flutter digunakan untuk melakukan komunikasi dengan server menggunakan protokol HTTP.
  - Mengirim Permintaan HTTP: Mengirim request seperti GET, POST, PUT, dan DELETE ke API backend.
  - Menerima Respons HTTP: Menerima respons dari server, yang biasanya berupa data dalam format JSON.
  - Parsing Respons: Mengambil data dari respons HTTP dan mengonversinya menjadi objek Dart.

3. Jelaskan fungsi dari CookieRequest dan jelaskan mengapa instance CookieRequest perlu untuk dibagikan ke semua komponen di aplikasi Flutter.

  - CookieRequest adalah objek yang digunakan untuk melakukan permintaan HTTP yang membutuhkan sesi dan autentikasi menggunakan cookie. Server Django menggunakan cookie untuk melacak sesi pengguna yang sedang login.
  - CookieRequest perlu dibagikan ke seluruh komponen aplikasi agar semua bagian aplikasi dapat mengirim permintaan yang memerlukan autentikasi tanpa harus membuat instance baru. Dengan menggunakan Provider, instance CookieRequest dapat diakses secara global di seluruh aplikasi, menjaga sesi pengguna tetap konsisten.

4. Jelaskan mekanisme pengiriman data mulai dari input hingga dapat ditampilkan pada Flutter.

  - Input Data di Form Flutter: Pengguna mengisi formulir input di aplikasi Flutter untuk memasukkan data produk seperti nama, harga, stok, dan deskripsi.
  - Validasi Input: Setelah pengguna mengisi formulir, aplikasi Flutter melakukan validasi pada setiap input (misalnya, memastikan harga adalah angka dan kolom nama tidak kosong). Jika ada kesalahan, pengguna akan diminta untuk memperbaiki input.
  - Mengirim Data ke Backend (Django): Jika validasi berhasil, aplikasi Flutter mengirim data produk dalam format JSON ke server Django menggunakan HTTP request (POST). Data dikirim melalui jaringan dengan menggunakan URL API yang telah ditentukan.
  - Backend Django Memproses Data: Di server Django, request diterima dan data JSON diparsing. Django melakukan validasi tambahan (jika diperlukan) dan kemudian menyimpan data ke dalam database menggunakan model yang sesuai.
  - Mengirim Respons ke Flutter: Setelah data disimpan, server Django mengirimkan respons dalam format JSON kembali ke aplikasi Flutter. Respons ini biasanya berisi status (success atau error) dan pesan notifikasi.
  - Menampilkan Notifikasi di Flutter: Aplikasi Flutter memeriksa respons yang diterima dari server. Jika status respons adalah success, aplikasi menampilkan pesan kepada pengguna bahwa data produk berhasil disimpan. Jika terdapat error, aplikasi menampilkan pesan kesalahan.
  - Mengambil dan Menampilkan Data: Setelah data disimpan, aplikasi dapat melakukan request baru (GET) untuk mengambil daftar produk yang sudah diperbarui dari backend. Data produk yang diterima ditampilkan di UI aplikasi dalam bentuk daftar produk.

5. Jelaskan mekanisme autentikasi dari login, register, hingga logout. Mulai dari input data akun pada Flutter ke Django hingga selesainya proses autentikasi oleh Django dan tampilnya menu pada Flutter.
  - Login : 
    - Input Data Login: Pengguna memasukkan username dan password pada form login di Flutter.
    - Mengirim Permintaan Login: Flutter mengirim request POST ke endpoint Django /auth/login/ dengan data username dan password.
    - Validasi di Backend: Django memvalidasi data login. Jika username dan password benar, Django membuat sesi untuk pengguna dan mengirimkan cookie sesi kembali ke Flutter.
    - Menyimpan Cookie Sesi di Flutter: Flutter menggunakan CookieRequest untuk menyimpan cookie sesi yang diterima dari Django. Cookie ini digunakan untuk melakukan request terotentikasi di masa depan.
    - Navigasi ke Halaman Beranda: Jika login berhasil, Flutter menampilkan pesan sukses dan mengarahkan pengguna ke halaman utama (MyHomePage). Jika gagal, pengguna akan melihat pesan error.
  - Register :
    - Input Data Registrasi: Pengguna mengisi form registrasi dengan username, password, dan konfirmasi password di Flutter.
    - Mengirim Permintaan Register: Flutter mengirim request POST ke endpoint Django /auth/register/ dengan data username dan password.
    - Validasi di Backend: Django memeriksa apakah username sudah ada di database dan apakah password valid. Jika validasi berhasil, Django membuat akun pengguna baru dan mengirimkan respons sukses ke Flutter.
    - Navigasi ke Halaman Login: Setelah registrasi berhasil, Flutter menampilkan pesan sukses dan mengarahkan pengguna kembali ke halaman login agar pengguna dapat masuk dengan akun yang baru dibuat.
  - Logout : 
    - Mengirim Permintaan Logout: Ketika pengguna menekan tombol logout, Flutter mengirim request POST ke endpoint Django /auth/logout/.
    - Hapus Sesi di Backend: Django menghapus sesi pengguna dan menghapus cookie sesi yang terkait, menandakan bahwa pengguna telah keluar dari akun mereka.
    - Hapus Cookie di Flutter: Flutter menghapus cookie sesi yang disimpan di aplikasi sehingga pengguna tidak dapat melakukan request terotentikasi lagi tanpa login ulang.
    - Navigasi ke Halaman Login: Setelah logout berhasil, Flutter menampilkan pesan sukses dan mengarahkan pengguna kembali ke halaman login.


6. Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas secara step-by-step! (bukan hanya sekadar mengikuti tutorial).
  - Mengimplementasikan fitur registrasi akun pada proyek tugas Flutter : 
    - Membuat halaman register dengan input username, password, dan konfirmasi password. Formulir ini juga dilengkapi dengan validasi sederhana untuk memastikan input tidak kosong dan password cocok dengan konfirmasi password.
    - Ketika pengguna menekan tombol "Register", aplikasi mengirim request POST ke endpoint Django /auth/register/. Data dikirim dalam format JSON menggunakan CookieRequest yang berisi username, password1, dan password2.
    - Di Django, fungsi register() memvalidasi data yang diterima. Jika password cocok dan username belum ada di database, Django membuat akun pengguna baru menggunakan User.objects.create_user(). Jika registrasi berhasil, Django mengirimkan respons sukses ke Flutter dengan status 200.
    - Setelah menerima respons sukses, Flutter menampilkan notifikasi menggunakan SnackBar dan mengarahkan pengguna kembali ke halaman login menggunakan Navigator.pushReplacement().
  - Membuat halaman login pada proyek tugas Flutter : 
    - Membuat halaman login dengan dua input: username dan password. Halaman ini juga dilengkapi tombol "Login".
    - Ketika pengguna menekan tombol "Login", aplikasi mengirim request POST ke endpoint /auth/login/ di Django dengan menggunakan CookieRequest. Data dikirim dalam format JSON yang berisi username dan password.
    - Django menggunakan fungsi authenticate() untuk memverifikasi username dan password. Jika valid, Django membuat sesi pengguna dengan fungsi auth_login() dan mengirim cookie sesi kembali ke Flutter.
    - Jika login berhasil, Flutter menyimpan cookie sesi dan menampilkan pesan sukses menggunakan SnackBar. Aplikasi kemudian mengarahkan pengguna ke halaman utama (MyHomePage). Jika gagal, ditampilkan dialog error menggunakan AlertDialog.
  - Mengintegrasikan sistem autentikasi Django dengan proyek tugas Flutter : 
    - Menggunakan library pbp_django_auth di Flutter yang mendukung autentikasi berbasis cookie. Ini memudahkan Flutter untuk menyimpan cookie sesi pengguna yang diterima dari Django.
    - Membagikan instance CookieRequest secara global menggunakan Provider sehingga semua komponen di aplikasi Flutter dapat mengakses sesi pengguna tanpa harus membuat instance baru.
    - Dengan menggunakan CookieRequest, setiap request yang dikirim dari Flutter secara otomatis menyertakan cookie sesi pengguna, memungkinkan backend Django untuk memverifikasi pengguna yang sedang login.
  - Membuat model kustom sesuai dengan proyek aplikasi Django.
    - Mendapatkan contoh respons JSON dari endpoint Django yang mengembalikan daftar produk. 
    - Menggunakan QuickType untuk mengubah respons JSON menjadi model Dart
    - Hasil konversi dari QuickType adalah model Dart yang dapat langsung digunakan di aplikasi Flutter. 
  - Membuat halaman yang berisi daftar semua item yang terdapat pada endpoint JSON di Django yang telah kamu deploy.
    - Pada metode fetchProduct(), menggunakan CookieRequest untuk mengambil data dari API Django yang berlokasi di URL http://10.0.2.2:8000/json/ menggunakan metode GET.
    - JSON yang diterima kemudian diubah menjadi daftar objek Product menggunakan metode fromJson()
    - Jika data belum diterima, ditampilkan widget CircularProgressIndicator sebagai indikasi bahwa data sedang dimuat
    - Jika data sudah diterima dan terdapat produk, saya menggunakan ListView.builder untuk menampilkan daftar produk
    - Setiap item produk ditampilkan menggunakan widget Container dengan menampilkan model yang dimiliki tiap item
  - Membuat halaman detail untuk setiap item yang terdapat pada halaman daftar Item
    - Ketika pengguna menekan salah satu item pada halaman daftar, aplikasi menggunakan Navigator.push() untuk membuka halaman detail dan mengirim data item yang dipilih sebagai argumen
    - Pada halaman detail, saya menampilkan semua atribut item seperti name, price, description, dan stock. Saya menggunakan widget Text dan Padding untuk menampilkan informasi secara terstruktur
    - Tombol back otomatis dibuat dengan Navigator.push
  - Melakukan Filter pada Halaman Daftar Item
    - Memodifikasi endpoint Django sehingga hanya mengembalikan item yang dibuat oleh pengguna yang sedang login. Di Django, menggunakan filter query berdasarkan pengguna (request.user)
    - Ketika mengambil data dari API Django, Flutter hanya menerima daftar item yang terkait dengan pengguna yang login




