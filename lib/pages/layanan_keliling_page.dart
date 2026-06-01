import 'package:flutter/material.dart';

class LayananKelilingPage extends StatelessWidget {
  const LayananKelilingPage({super.key});

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
        title: const Text('Layanan Keliling', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Pilihan Tanggal Horizontal
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildDateTile('21/01/2024', isSelected: true),
                _buildDateTile('25/01/2024'),
                _buildDateTile('28/01/2024'),
              ],
            ),
            const SizedBox(height: 20),
            const Text('Hari ini, 21 Januari 2024', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.w500)),
            const SizedBox(height: 16),

            // Daftar Mobil Keliling
            _buildMobilCard('Mobil 01', 'Mangir lor & Manager tengah, sendang', '08:00 - 16:00'),
            const SizedBox(height: 12),
            _buildMobilCard('Mobil 02', 'Mangir lor & Manager tengah, sendang', '08:00 - 16:00'),
          ],
        ),
      ),
    );
  }

  Widget _buildDateTile(String date, {bool isSelected = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFF0D47A1) : Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Icon(Icons.calendar_today, size: 14, color: isSelected ? Colors.white : Colors.black87),
          const SizedBox(width: 6),
          Text(date, style: TextStyle(color: isSelected ? Colors.white : Colors.black87, fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildMobilCard(String title, String lokasi, String jam) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // <--- UBAH DI SINI (Tambahkan kata 'Space')
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.location_on, size: 14, color: Colors.grey),
                    const SizedBox(width: 4),
                    Expanded(child: Text(lokasi, style: const TextStyle(color: Colors.grey, fontSize: 12), overflow: TextOverflow.ellipsis)),
                  ],
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(color: const Color(0xFF0D47A1), borderRadius: BorderRadius.circular(4)),
            child: Text(jam, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }
}