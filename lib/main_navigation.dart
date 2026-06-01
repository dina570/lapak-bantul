import 'package:flutter/material.dart';
import 'home_page.dart';
// Impor berkas dari folder screens
import 'screens/splash/splash_screen.dart';
import 'screens/auth/login_page.dart';
import 'screens/auth/register_page.dart';
import 'screens/auth/forgot_password_page.dart';
import 'screens/users/users_page.dart';
import 'pages/layanan_keliling_page.dart';
import 'pages/pbb_page.dart';
import 'pages/detail_sppt_page.dart';
import 'pages/informasi_pajak_page.dart';
import 'pages/bphtb_page.dart';
import 'pages/rekap_page.dart';
import 'pages/menu_lain_page.dart';

// 1. HALAMAN RIWAYAT (Halaman Dummy)
class RiwayatPage extends StatelessWidget {
  const RiwayatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Aktivitas', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF0D47A1),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('Belum ada riwayat transaksi pajak.', style: TextStyle(color: Colors.grey)),
      ),
    );
  }
}

// =========================================================================
// 2. KODE BARU: HALAMAN PROFIL YANG SUDAH ADA ISINYA (BIAR TIDAK KOSONG)
// =========================================================================
class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profil Pengguna', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundColor: const Color(0xFF0D47A1),
        automaticallyImplyLeading: false, // Menghilangkan tombol back otomatis
        elevation: 0,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            // Foto Profil Lingkaran Besar
            const Center(
              child: CircleAvatar(
                radius: 60,
                backgroundColor: Color(0xFFE3F2FD),
                child: Icon(Icons.person, size: 70, color: Color(0xFF0D47A1)),
              ),
            ),
            const SizedBox(height: 20),
            
            // Nama Lengkap Pengguna
            const Text(
              'Dina Yulia Ningsih',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 5),
            // NIK atau Nomor Pajak
            const Text(
              'NIK: 340211XXXXXXXXXX',
              style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),

            // Kartu Detail Informasi Akun
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              elevation: 2,
              color: Colors.white,
              child: Column(
                children: const [
                  ListTile(
                    leading: Icon(Icons.email_outlined, color: Color(0xFF0D47A1)),
                    title: Text('Email'),
                    subtitle: Text('dinayulianingsih97@gmail.com'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.phone_android_outlined, color: Color(0xFF0D47A1)),
                    title: Text('Nomor Telepon'),
                    subtitle: Text('+62- 896-2994-2742'),
                  ),
                  Divider(height: 1),
                  ListTile(
                    leading: Icon(Icons.location_on_outlined, color: Color(0xFF0D47A1)),
                    title: Text('Alamat'),
                    subtitle: Text('Kecamatan Banyuwangi, Kabupaten Banyuwangi, banyuwangi'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40),

            // Tombol Keluar / Logout Resmi
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red[50],
                  foregroundColor: Colors.red,
                  side: const BorderSide(color: Colors.red),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                icon: const Icon(Icons.logout),
                label: const Text('Keluar dari Akun', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                onPressed: () {
                  // Kembali langsung ke halaman login asal
                  Navigator.pushReplacementNamed(context, '/login');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 3. JANGKAR UTAMA NAVIGASI BAWAH (BOTTOM NAVIGATION BAR)
class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});
  static const String initialRoute = '/home';

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomePage(),
    const RiwayatPage(),
    const ProfilPage(), // Menampilkan halaman profil berdesain baru di atas
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF0D47A1),
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Beranda'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Riwayat'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}