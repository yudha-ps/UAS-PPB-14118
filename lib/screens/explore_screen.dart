import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BilliardExploreScreen extends StatelessWidget {
  final List<Map<String, dynamic>> billiardLocations = [
    {
      'title': 'Billiard Center Jakarta',
      'description': 'Terletak di pusat kota Jakarta, Billiard Center Jakarta '
          'menawarkan meja billiard premium dengan suasana modern. Fasilitas mencakup '
          'lounge eksklusif, area kompetisi, dan layanan makanan ringan.',
      'image': 'assets/images/billiard_jakarta.webp',
    },
    {
      'title': 'Billiard Center Bali',
      'description':
          'Berada di kawasan Seminyak, Billiard Center Bali menghadirkan '
              'suasana santai dengan meja billiard berkualitas tinggi. Cocok untuk Anda yang ingin '
              'memadukan liburan dengan hiburan olahraga.',
      'image': 'assets/images/billiard_bali.webp',
    },
    {
      'title': 'Billiard Center Surabaya',
      'description': 'Terletak di jantung kota Surabaya, Billiard Center Surabaya '
          'menawarkan kenyamanan maksimal dengan tim profesional yang siap memberikan pengalaman '
          'bermain billiard terbaik.',
      'image': 'assets/images/billiard_surabaya.webp',
    },
    {
      'title': 'Billiard Center Bandung',
      'description':
          'Dikelilingi oleh suasana sejuk Bandung, Billiard Center Bandung '
              'menyediakan meja billiard berkualitas tinggi dengan fokus pada kenyamanan dan kesenangan.',
      'image': 'assets/images/billiard_bandung.webp',
    },
    {
      'title': 'Billiard Center Yogyakarta',
      'description': 'Billiard Center Yogyakarta menghadirkan nuansa tradisional '
          'dengan layanan modern. Terletak dekat pusat kota, ideal untuk turnamen '
          'dan hiburan keluarga.',
      'image': 'assets/images/billiard_yogyakarta.webp',
    },
  ];

  BilliardExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lokasi Billiard',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: billiardLocations.length,
        itemBuilder: (context, index) {
          final billiard = billiardLocations[index];
          return GestureDetector(
            onTap: () => _showLocationDetail(
              context,
              billiard['title']!,
              billiard['description']!,
              billiard['image']!,
            ),
            child: _buildBilliardCard(
              billiard['title']!,
              billiard['description']!,
              billiard['image']!,
            ),
          );
        },
      ),
    );
  }

  Widget _buildBilliardCard(String title, String description, String image) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          // Gambar Lokasi Billiard
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              image,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          // Informasi Lokasi Billiard
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _showLocationDetail(
      BuildContext context, String title, String description, String image) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            title,
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  image,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Tutup',
                style: GoogleFonts.poppins(
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
