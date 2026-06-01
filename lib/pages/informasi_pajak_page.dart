import 'package:flutter/material.dart';

class InformasiPajakPage extends StatelessWidget {
  const InformasiPajakPage({super.key});

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
        title: const Text(
          'Informasi Pajak',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildDetailBerita(
            'SOP Pelayanan Pajak Daerah Masa Pandemi',
            '10 Jan 2026',
            'Pemerintah Kabupaten Bantul memberlakukan standar operasional prosedur baru guna mengoptimalkan pelayanan pajak daerah jarak jauh secara aman dan terintegrasi.',
          ),
          const SizedBox(height: 16),
          _buildDetailBerita(
            'Cara Aktivasi E-SPPT PBB P2 Kabupaten Bantul',
            '05 Jan 2026',
            'Wajib pajak kini dapat melakukan aktivasi e-SPPT secara mandiri melalui portal resmi LaPak Bantul untuk mempermudah pengecekan tagihan tahunan.',
          ),
        ],
      ),
    );
  }

  Widget _buildDetailBerita(String judul, String tanggal, String isi) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(judul, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
          const SizedBox(height: 6),
          Text(tanggal, style: const TextStyle(color: Colors.grey, fontSize: 12)),
          const Divider(height: 20),
          Text(isi, style: const TextStyle(color: Colors.black87, fontSize: 14, height: 1.4)),
        ],
      ),
    );
  }
}