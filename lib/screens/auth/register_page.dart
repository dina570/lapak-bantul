import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(elevation: 0, backgroundColor: Colors.transparent, leading: const BackButton(color: Colors.black)),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Buat Akun Baru', style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF0D47A1))),
            const SizedBox(height: 24),
            TextField(decoration: InputDecoration(labelText: 'Nama Lengkap', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
            const SizedBox(height: 16),
            TextField(decoration: InputDecoration(labelText: 'Email', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
            const SizedBox(height: 16),
            TextField(obscureText: true, decoration: InputDecoration(labelText: 'Password', border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)))),
            const SizedBox(height: 24),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0D47A1), padding: const EdgeInsets.symmetric(vertical: 16)),
              onPressed: () => Navigator.pop(context),
              child: const Text('Daftar Sekarang', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}