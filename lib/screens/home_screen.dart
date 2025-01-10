import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // Pastikan ini ada

class HomeScreen extends StatelessWidget {
  final List<Map<String, String>> servicesData = [
    {
      'image': 'assets/images/table_rent.jpg',
      'description': 'al BilTable Rent - Professionliard Tables'
    },
    {
      'image': 'assets/images/lessons.jpg',
      'description': 'Private Lessons - Learn from the Experts'
    },
    {
      'image': 'assets/images/tournaments.jpg',
      'description': 'Tournaments - Compete & Win Prizes'
    },
    {
      'image': 'assets/images/snacks.jpg',
      'description': 'Snacks & Drinks - Enjoy Refreshments'
    },
    {
      'image': 'assets/images/merchandise.jpg',
      'description': 'Merchandise - Stylish Billiard Gear'
    },
  ];

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Billiard Center',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/login');
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Menu
            Container(
              padding: const EdgeInsets.all(16),
              child: GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  menuItem('Services', Icons.pool, Colors.blue, () {
                    // Tambahkan navigasi ke halaman Services
                  }),
                  menuItem('Pricing', Icons.attach_money, Colors.teal, () {
                    // Tambahkan navigasi ke halaman Pricing
                  }),
                  menuItem('Gallery', Icons.photo, Colors.orange, () {
                    // Tambahkan navigasi ke halaman Gallery
                  }),
                  menuItem('Tournaments', Icons.emoji_events, Colors.red, () {
                    // Tambahkan navigasi ke halaman Tournaments
                  }),
                  menuItem('Contact Us', Icons.phone, Colors.purple, () {
                    // Tambahkan navigasi ke halaman Contact
                  }),
                  menuItem('Bookings', Icons.calendar_today, Colors.green, () {
                    // Tambahkan navigasi ke halaman Bookings
                  }),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Highlighted Services (Horizontal Scroll)
            SizedBox(
              height: 150,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: servicesData.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 150,
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
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10)),
                          child: Image.asset(
                            servicesData[index]['image']!,
                            fit: BoxFit.cover,
                            height: 100,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            servicesData[index]['description']!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 12, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),

            // Detailed Services List (Vertical Scroll)
            ListView.builder(
              itemCount: servicesData.length,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  height: 100,
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
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10),
                        ),
                        child: Image.asset(
                          servicesData[index]['image']!,
                          fit: BoxFit.cover,
                          width: 100,
                          height: double.infinity,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            servicesData[index]['description']!,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(color: Colors.black),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: 'Contact',
          ),
        ],
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(
                context, '/explore'); // Tambahkan navigasi ke Explore
          } else if (index == 2) {
            Navigator.pushNamed(
                context, '/contact'); // Tambahkan navigasi ke Contact
          }
        },
      ),
    );
  }

  Widget menuItem(
      String title, IconData icon, Color color, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: Colors.white, size: 36),
          ),
          const SizedBox(height: 8),
          Text(
            title,
            style: GoogleFonts.poppins(fontSize: 12),
          ),
        ],
      ),
    );
  }
}
