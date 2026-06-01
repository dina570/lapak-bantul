import 'package:flutter/material.dart';
import '../../services/auth_service.dart'; // <--- Penting: Menghubungkan ke layanan Google SSO

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Inisialisasi layanan Auth
    final AuthService _authService = AuthService();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Selamat Datang',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28, 
                fontWeight: FontWeight.bold, 
                color: Color(0xFF0D47A1)
              ),
            ),
            const SizedBox(height: 32),
            
            // Input Email
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 16),
            
            // Input Password
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Password',
                prefixIcon: const Icon(Icons.lock),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 24),

            // TOMBOL LOGIN MANUAL
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D47A1),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () => Navigator.pushReplacementNamed(context, '/home'),
              child: const Text('Masuk', style: TextStyle(color: Colors.white, fontSize: 16)),
            ),

            const SizedBox(height: 20),
            const Text('atau masuk dengan', textAlign: TextAlign.center, style: TextStyle(color: Colors.grey)),
            const SizedBox(height: 20),

            // ==========================================
            // FITUR WAJIB: TOMBOL SSO LOGIN GOOGLE
            // ==========================================
            OutlinedButton.icon(
              icon: Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/1200px-Google_%22G%22_logo.svg.png',
                height: 24,
              ),
              label: const Text('Google Sign-In', style: TextStyle(color: Colors.black87, fontSize: 16)),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 12),
                side: const BorderSide(color: Colors.grey),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              onPressed: () async {
                // Memanggil fungsi SSO Google dari auth_service.dart
                var user = await _authService.signInWithGoogle();
                if (user != null) {
                  // Jika berhasil login, pindah ke HomePage
                  Navigator.pushReplacementNamed(context, '/home');
                } else {
                  // Jika gagal/batal, munculkan pesan singkat
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Login Google Dibatalkan")),
                  );
                }
              },
            ),
            // ==========================================

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Belum punya akun?'),
                TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/register'),
                  child: const Text('Daftar'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}