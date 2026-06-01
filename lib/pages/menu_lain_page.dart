import 'package:flutter/material.dart';

class MenuLainPage extends StatelessWidget {
  const MenuLainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu Lainnya', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF0D47A1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildMenuItem(context, Icons.help_outline, 'Pusat Bantuan & Pengaduan'),
          _buildMenuItem(context, Icons.privacy_tip_outlined, 'Kebijakan Privasi'),
          _buildMenuItem(context, Icons.info_outline, 'Tentang Aplikasi LaPak Bantul'),
        ],
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context, IconData icon, String title) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: Icon(icon, color: const Color(0xFF0D47A1)),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(Icons.chevron_right),
        onTap: () { // <-- Perbaikan: Menggunakan onTap bawaan ListTile yang benar
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Membuka $title')),
          );
        },
      ),
    );
  }
}