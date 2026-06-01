import 'package:flutter/material.dart';

class DetailSpptPage extends StatelessWidget {
  const DetailSpptPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('No. NOP 378429749820294337', style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 6),
            const Text(
              'AHMAD NABIL BAHROIN\nROGER SUMATRA',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87),
            ),
            const SizedBox(height: 4),
            const Text(
              'Alamat Lengkap WP : Kab Bantul, Kec. Sewon, DS. Ngireng-ireng, RT01/RW01',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
            const SizedBox(height: 24),

            _buildDetailField('Lokasi', 'DS. Ngireng-ireng, RT01/RW01', isBold: true),
            
            // Status Badge
            const SizedBox(height: 16),
            const Text('Status', style: TextStyle(color: Colors.grey, fontSize: 13)),
            const SizedBox(height: 6),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(color: Colors.green, borderRadius: BorderRadius.circular(4)),
                  child: const Text('Sudah Lunas', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
                ),
              ],
            ),

            _buildDetailField('Denda', 'Rp. 0'),
            _buildDetailField('NJOP Bumi', 'Rp. 300,000'),
            _buildDetailField('NJOP Bangunan', 'Rp. 0'),
            _buildDetailField('Luas Bumi', '227m'),
            _buildDetailField('Luas Bangunan', '0m'), // Sesuai baris terpotong di bawah gambar
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailField(String label, String value, {bool isBold = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 16),
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 13)),
        const SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            fontSize: 15,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 10),
        const Divider(height: 1, color: Colors.grey),
      ],
    );
  }
}