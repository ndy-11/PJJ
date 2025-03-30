# 📚 Aplikasi PJJ (Pembelajaran Jarak Jauh)

Aplikasi **PJJ** adalah platform berbasis **web** dan **Android** yang dirancang untuk mendukung proses pembelajaran jarak jauh (PJJ) bagi sekolah Islam Terpadu (SDIT & SMPIT). Aplikasi ini menyediakan fitur utama seperti **pembayaran uang sekolah, upload tugas, serta absensi menggunakan QR Code dengan verifikasi wajah dan lokasi sekolah**.

## ✨ **Fitur Utama**

### 🔹 **1. Pembayaran Uang Sekolah**
- Siswa dapat melihat total tagihan, riwayat pembayaran, serta mencetak **invoice dalam format PDF**.
- Admin Keuangan dapat mengelola pembayaran, termasuk menambah, mengedit, dan menghapus transaksi.
- Dukungan metode pembayaran manual serta **subsidi atau bantuan dana** bagi siswa tertentu.

### 📄 **2. Upload Tugas**
- Siswa dapat **mengunggah tugas dalam berbagai format** seperti PDF, DOCX, atau gambar.
- Guru dapat melihat dan menilai tugas yang telah diunggah oleh siswa.
- Notifikasi tugas yang telah dikumpulkan untuk memudahkan monitoring.

### 📍 **3. Absensi Siswa Menggunakan QR Code & Lokasi**
- Siswa dapat melakukan **scan QR Code** di lingkungan sekolah untuk absensi otomatis.
- Verifikasi tambahan menggunakan **pengenalan wajah (face recognition)**.
- Sistem akan memvalidasi **lokasi siswa harus berada di dekat sekolah** agar absensi valid.

## 👤 **Role Pengguna**

| Role | Akses |
|------|-------|
| **Superadmin** | Memiliki akses penuh untuk mengelola sistem, pengguna, dan semua fitur aplikasi. |
| **Keuangan** | Mengelola pembayaran, invoice, dan laporan keuangan. |
| **Siswa** | Mengakses tugas, melakukan pembayaran, dan melakukan absensi dengan QR Code. |

## 🏗 **Teknologi yang Digunakan**
- **Frontend:** Flutter (untuk Web & Android)
- **Backend:** Node.js & PostgreSQL
- **Autentikasi:** JWT (JSON Web Token)
- **QR Code & Face Recognition:** OpenCV & Firebase ML Kit
- **Lokasi:** Google Maps API

## 🚀 **Cara Menjalankan Aplikasi**
### **Untuk Web**
```sh
flutter build web
flutter serve
```
### **Untuk Android**
```sh
flutter build apk
flutter install
```

## 📞 **Kontak & Dukungan**
Jika Anda memiliki pertanyaan atau membutuhkan bantuan, silakan hubungi:
📧 Email: sandyirawan53@gmail.com
