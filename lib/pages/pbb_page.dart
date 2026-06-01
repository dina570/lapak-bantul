import 'package:flutter/material.dart';

class PbbPage extends StatefulWidget {
  const PbbPage({super.key});

  @override
  State<PbbPage> createState() => _PbbPageState();
}

class _PbbPageState extends State<PbbPage> {
  final TextEditingController _nopController = TextEditingController();
  bool _showResult = false;

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
        title: const Text('PBB', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Kolom Pencarian NOP
            TextField(
              controller: _nopController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Masukan NOP...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Color(0xFF0D47A1), width: 2),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  // Jika diinputkan nomor (seperti di foto 5), tampilkan hasil list SPPT
                  _showResult = value.isNotEmpty;
                });
              },
            ),
            const SizedBox(height: 30),

            // Logika Tampilan: Jika Kosong (Foto 4) vs Jika Ada Isi (Foto 5)
            Expanded(
              child: !_showResult
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.receipt_long, 
                            size: 80, 
                            color: const Color(0xFF0D47A1).withOpacity(0.8), // Kata const di dalam Color aman, bukan di luar
                          ),
                          const SizedBox(height: 16), // Memperbaiki tulisan const & SizedBox yang terpotong
                          const Text(
                            'Masukan NOP untuk melihat\nrincian pajak.',
                            textAlign: TextAlign.center, // Sudah diperbaiki menjadi 'center' dengan huruf kecil
                            style: TextStyle(
                              color: Colors.grey, 
                              fontSize: 14, 
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView(
                      children: [
                        _buildSpptCard(context, 'SPPT 2021', 'DS. Ngireng-ireng RT01/RW01', '200.000', false),
                        const SizedBox(height: 16),
                        _buildSpptCard(context, 'SPPT 2020', 'DS. Ngireng-ireng RT01/RW01', '176.000', true),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSpptCard(BuildContext context, String tahun, String alamat, String jumlah, bool isLunas) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(tahun, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: isLunas ? Colors.green : Colors.red[400],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  isLunas ? 'Lunas' : 'Belum lunas',
                  style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(Icons.location_on, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              Text(alamat, style: const TextStyle(color: Colors.grey, fontSize: 13)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(Icons.monetization_on, size: 16, color: Colors.grey),
              const SizedBox(width: 6),
              const Text('NJOP Bumi dan Bangunan ', style: TextStyle(color: Colors.grey, fontSize: 13)),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(color: const Color(0xFF0D47A1), borderRadius: BorderRadius.circular(4)),
                child: Text(jumlah, style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold)),
              ),
            ],
          ),
          const Divider(height: 24),
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, '/detail-sppt'),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text('Lihat Detail', style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 13)),
                Icon(Icons.chevron_right, color: Colors.grey, size: 18),
              ],
            ),
          )
        ],
      ),
    );
  }
}