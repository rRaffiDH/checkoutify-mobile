# checkout_ify
## Tugas 7

1. Jelaskan apa yang dimaksud dengan stateless widget dan stateful widget, dan jelaskan perbedaan dari keduanya.

**Stateless Widget:** Widget yang bersifat statis, artinya tidak memiliki keadaan state yang dapat berubah. Setelah widget ini dibuat, ia tidak akan berubah atau memperbarui tampilannya selama aplikasi berjalan.

**Stateful Widget:** Widget yang bersifat dinamis, artinya memiliki keadaan state yang bisa berubah. Jika state berubah, widget akan membangun ulang (rebuild) tampilan UI yang sesuai dengan perubahan tersebut.

**Perbedaan:**
- Stateless widget tidak memiliki State dan tampilannya tetap selama aplikasi berjalan.
- Stateful widget memiliki State, dan tampilannya dapat berubah berdasarkan perubahan yang terjadi di dalam State.

2. Sebutkan widget apa saja yang kamu gunakan pada proyek ini dan jelaskan fungsinya.

- **MaterialApp:** Widget root (utama) untuk aplikasi Flutter, berisikan judul, tema, dan halaman utama.
- **AppBar:** Menampilkan toolbar di bagian atas layar dengan opsi seperti judul dan tombol aksi.
- **SnackBar:** Memberikan pesan notifikasi sementara di bagian bawah layar, digunakan saat user menekan tombol.

3. Apa fungsi dari `setState()`? Jelaskan variabel apa saja yang dapat terdampak dengan fungsi tersebut.

`setState()` adalah method yang digunakan dalam Stateful Widget untuk memberitahu framework bahwa ada perubahan pada data yang menyebabkan UI perlu di-render ulang.

**Variabel yang Terdampak oleh `setState()`:**
- Variabel-variabel yang dideklarasikan di dalam kelas State dari Stateful Widget.
- Setiap variabel yang berubah nilai dan mempengaruhi UI, seperti variabel penampung status switch, nilai input, atau daftar item yang ditampilkan.

4. Jelaskan perbedaan antara `const` dengan `final`.

- `const` digunakan untuk nilai yang sudah diketahui dan tetap saat kompilasi.
- `final` digunakan untuk nilai yang tidak akan berubah setelah inisialisasi pertama, tetapi bisa ditentukan pada runtime.

5. Jelaskan bagaimana cara kamu mengimplementasikan checklist-checklist di atas.

- Membuat proyek Checkoutify dengan perintah `flutter create checkout_ify`.
- Membuat tiga tombol sederhana dengan ikon dan teks, dan menampilkannya menggunakan `GridView.count`.
- Mengatur warna tombol dan menampilkan pesan menggunakan `SnackBar` saat tombol ditekan.

## Tugas 8

1. Apa kegunaan `const` di Flutter? Jelaskan apa keuntungan ketika menggunakan `const`.

- `const` digunakan untuk membuat objek yang immutable dan compile-time constant.
- **Keuntungan:**
  - Optimasi performa dan penghematan memori.
  - Pengurangan overhead runtime.
  - Mencegah mutasi data yang tidak diinginkan.

2. Jelaskan dan bandingkan penggunaan `Column` dan `Row` pada Flutter.

- **Column:** Untuk tata letak vertikal (atas ke bawah).
  - Contoh:

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
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

- **Row:** Untuk tata letak horizontal (kiri ke kanan).
  - Contoh:

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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

3. Elemen input yang digunakan:
   - **TextFormField:** Untuk mengumpulkan data teks dari pengguna.
   - **ElevatedButton:** Tombol untuk menyimpan data.

4. Mengatur tema menggunakan `ThemeData` di `MaterialApp`.

```dart
MaterialApp(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green).copyWith(
      secondary: Colors.greenAccent,
    ),
  ),
);
```

5. Navigasi antar halaman menggunakan `Navigator`.

- **Navigator.push():**

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

- **Navigator.pushReplacement():**

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

- **Navigator.pop():**

```dart
onPressed: () {
  Navigator.pop(context);
  _formKey.currentState!.reset();
}
```
