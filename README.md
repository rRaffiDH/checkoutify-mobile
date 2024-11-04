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





## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
