import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

// 1. Impor Sistem Navigasi Utama & Halaman Login
import 'main_navigation.dart';
import 'screens/auth/login_page.dart';

// 2. Impor File Halaman Asli Anda (Sesuaikan nama file jika ada yang berbeda)
import 'pages/pbb_page.dart';             // File halaman PBB asli Anda
import 'pages/bphtb_page.dart';           // File halaman BPHTB asli Anda
import 'pages/layanan_keliling_page.dart'; // File halaman Layanan Keliling asli Anda
import 'pages/informasi_pajak_page.dart';  // File halaman Info asli Anda
import 'pages/rekap_page.dart';           // File halaman Rekap asli Anda
import 'pages/menu_lain_page.dart';       // File halaman Menu Lain asli Anda

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint("Firebase sudah terinisialisasi: \$e");
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LaPak Bantul',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      initialRoute: '/login', 
      routes: {
        '/login': (context) => const LoginPage(),
        '/home': (context) => const MainNavigation(), // Masuk ke navigasi utama yang ada Beranda, Riwayat, Profil
        
        // =========================================================================
        // KUNCI PERBAIKAN: Menghubungkan Rute Langsung ke Class Halaman Asli Anda
        // =========================================================================
        '/pbb': (context) => const PbbPage(),                         // Memanggil isi PBB asli
        '/bphtb': (context) => const BphtbPage(),                     // Memanggil isi BPHTB asli
        '/layanan-keliling': (context) => const LayananKelilingPage(), // Memanggil isi Layanan Keliling asli
        '/informasi-pajak': (context) => const InformasiPajakPage(),   // Memanggil isi Info asli
        '/rekap': (context) => const RekapPage(),                     // Memanggil isi Rekap asli
        '/menu-lain': (context) => const MenuLainPage(),               // Memanggil isi Menu Lain asli
      },
    );
  }
}