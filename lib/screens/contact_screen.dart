import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactScreen extends StatelessWidget {
  final List<Map<String, String>> contactList = [
    {
      'title': 'Billiard Center Jakarta',
      'address': 'Jl. Sudirman No.1, Jakarta, Indonesia',
      'phone': '+62 21 1234 5678',
      'email': 'info.jakarta@billiardcenter.com',
    },
    {
      'title': 'Billiard Center Bali',
      'address': 'Jl. Sunset Road No.88, Bali, Indonesia',
      'phone': '+62 361 9876 5432',
      'email': 'info.bali@billiardcenter.com',
    },
    {
      'title': 'Billiard Center Surabaya',
      'address': 'Jl. Darmo No.10, Surabaya, Indonesia',
      'phone': '+62 31 7654 3210',
      'email': 'info.surabaya@billiardcenter.com',
    },
    {
      'title': 'Billiard Center Bandung',
      'address': 'Jl. Asia Afrika No.25, Bandung, Indonesia',
      'phone': '+62 22 4567 8901',
      'email': 'info.bandung@billiardcenter.com',
    },
    {
      'title': 'Billiard Center Yogyakarta',
      'address': 'Jl. Malioboro No.99, Yogyakarta, Indonesia',
      'phone': '+62 274 6789 0123',
      'email': 'info.yogyakarta@billiardcenter.com',
    },
  ];

  ContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Contact Us',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: contactList.length,
        itemBuilder: (context, index) {
          final contact = contactList[index];
          return GestureDetector(
            onTap: () => _showContactDetail(
              context,
              contact['title']!,
              contact['address']!,
              contact['phone']!,
              contact['email']!,
            ),
            child: _buildContactCard(
              contact['title']!,
              contact['address']!,
              contact['phone']!,
              contact['email']!,
            ),
          );
        },
      ),
    );
  }

  Widget _buildContactCard(
      String title, String address, String phone, String email) {
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
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 8.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Icon(Icons.location_on, color: Colors.green),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Text(
                    address,
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.phone, color: Colors.green),
                const SizedBox(width: 8.0),
                Text(
                  phone,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.email, color: Colors.green),
                const SizedBox(width: 8.0),
                Text(
                  email,
                  style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showContactDetail(BuildContext context, String title, String address,
      String phone, String email) {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.location_on, color: Colors.green),
                  const SizedBox(width: 8.0),
                  Expanded(child: Text(address)),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.phone, color: Colors.green),
                  const SizedBox(width: 8.0),
                  Text(phone),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.email, color: Colors.green),
                  const SizedBox(width: 8.0),
                  Text(email),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
