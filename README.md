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
