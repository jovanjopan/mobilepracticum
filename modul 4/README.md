# 🎶 Praktikum Mobile Programming  
## Widget Flexible & Expanded  

### 👤 Identitas  
- **Nama:** Jovan Faizan Ardiansyah  
- **NIM:** 230605110138  
- **Kelas:** C  

---

### 🎯 Tujuan  
Di praktikum ini, tujuannya simpel: belajar gimana cara ngatur layout di Flutter biar rapi dan proporsional. Caranya dengan pakai kombinasi **Row**, **Expanded**, dan **Flexible**.  
Output akhirnya berupa **Control Bar pemutar musik** di bagian bawah layar, lengkap dengan tombol: **Shuffle, Previous, Play, Next, dan Repeat**. Jadi hasilnya kayak player musik beneran dengan tombol Play yang lebih dominan di tengah.  

---

### 🛠️ Langkah-Langkah  
1. Bikin project baru Flutter.  
2. Atur tema aplikasi pakai `ThemeData.dark()` biar tampilannya dark mode.  
3. Bangun struktur dasar aplikasi dengan `Scaffold` (ada AppBar & body).  
4. Tambahin `bottomNavigationBar` buat control bar.  
5. Bungkus control bar dengan `Container`, kasih padding & warna latar gelap (`Colors.black54`).  
6. Susun tombol kontrol dalam `Row`.  
7. Tambahin lima tombol ikon: **Shuffle, Previous, Play, Next, Repeat**.  
8. Bagi ruang tombol pakai `Expanded` (4 tombol) dan `Flexible` (khusus Play biar lebih besar).  
9. Set semua ikon berwarna putih biar kontras sama background.  
10. Jalankan aplikasi dan cek hasilnya. 🎉  

---

### ✅ Kesimpulan  
Dari praktikum ini bisa ditarik kesimpulan kalau kombinasi **Expanded** dan **Flexible** di Flutter itu powerful banget buat ngatur layout.  
- **Expanded**: ngebagi ruang rata buat Shuffle, Previous, Next, dan Repeat.  
- **Flexible (flex: 2)**: bikin tombol Play lebih gede & jadi pusat perhatian.  

Ditambah lagi dengan `ThemeData.dark()` dan background gelap, tampilannya jadi lebih kece, modern, dan nyaman dilihat. Jadi, praktikum ini sukses bikin UI sederhana tapi fungsional untuk control bar musik. 🎧  

---

✨ Hasil akhirnya: Control bar musik yang rapi, proporsional, dan estetik!  
