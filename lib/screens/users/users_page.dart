import 'package:flutter/material.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil Pengguna'), backgroundColor: const Color(0xFF0D47A1)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const CircleAvatar(radius: 50, backgroundColor: Colors.grey, child: Icon(Icons.person, size: 50, color: Colors.white)),
            const SizedBox(height: 16),
            const Text('Ahmad Nabil Bahroin', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const Text('nabil@mail.com', style: TextStyle(color: Colors.grey)),
            const Divider(height: 32),
            ListTile(leading: const Icon(Icons.settings), title: const Text('Pengaturan Akun'), onTap: () {}),
            ListTile(
              leading: const Icon(Icons.logout, color: Colors.red),
              title: const Text('Keluar Aplikasi', style: TextStyle(color: Colors.red)),
              onTap: () => Navigator.pushReplacementNamed(context, '/login'),
            ),
          ],
        ),
      ),
    );
  }
}