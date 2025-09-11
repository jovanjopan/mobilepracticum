# Laporan Praktikum Mobile Programming
# Modul 4  
## Widget Flexible dan Expanded  

### Nama  
**Jovan Faizan Ardiansyah**  
NIM: 230605110138  
Kelas: C  

---

### Tujuan  
Tujuan dari praktikum ini adalah untuk mempelajari dan mengimplementasikan konsep pengaturan tata letak widget pada Flutter dengan memanfaatkan kombinasi **Row**, **Expanded**, dan **Flexible**. Melalui praktikum ini, mahasiswa diharapkan dapat memahami bagaimana distribusi ruang antar widget dapat diatur agar terlihat proporsional sesuai kebutuhan desain. Selain itu, praktikum ini bertujuan untuk membangun sebuah user interface sederhana berupa **control bar pemutar musik** yang ditempatkan di bagian bawah layar, lengkap dengan tombol-tombol kontrol seperti **Shuffle, Previous, Play, Next, dan Repeat**.  

---

### Langkah-Langkah  
- Membuat project baru Flutter.  
- Mengatur tema aplikasi menggunakan `ThemeData.dark()`.  
- Membuat struktur `Scaffold` dengan `AppBar` dan `body`.  
- Menambahkan `bottomNavigationBar` sebagai control bar.  
- Membungkus control bar dengan `Container` serta memberi padding dan warna latar gelap.  
- Menyusun tombol kontrol menggunakan `Row`.  
- Menambahkan lima tombol ikon: **Shuffle, Previous, Play, Next, dan Repeat**.  
- Mengatur distribusi ruang dengan `Expanded` untuk empat tombol dan `Flexible` untuk tombol Play.  
- Memberi warna putih pada semua ikon.  
- Menjalankan aplikasi dan menguji tampilan control bar.  

---

### Kesimpulan  
Berdasarkan hasil praktikum, dapat disimpulkan bahwa penggunaan **Expanded** dan **Flexible** pada Flutter sangat membantu dalam mengatur distribusi ruang agar elemen-elemen kontrol dapat tampil proporsional. `Expanded` digunakan untuk membagi ruang secara merata pada tombol **Shuffle, Previous, Next, dan Repeat**, sedangkan `Flexible` dengan `flex: 2` diterapkan pada tombol **Play** agar tampil lebih besar dan menjadi fokus utama pada control bar. Selain itu, dengan memanfaatkan `ThemeData.dark()` serta `Container` berwarna gelap, tampilan aplikasi menjadi lebih menarik dan kontras dengan ikon berwarna putih. Dengan demikian, praktikum ini berhasil mencapai tujuan yaitu membangun sebuah UI sederhana untuk control bar pemutar musik dengan desain yang rapi, fungsional, dan estetis.  

---
