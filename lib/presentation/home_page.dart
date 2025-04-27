import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String namaPengguna;
  const HomePage({super.key, required this.namaPengguna});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage("assets/fri.jpeg"),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // supaya rata kiri
          children: [
            Text(
              'Selamat Datang',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            Text(
              '$namaPengguna',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.logout,
              color: Colors.white,
            ), // Ikon kanan (+)
            onPressed: () {
              // Tambahkan aksi di sini
            },
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.network(
              "https://img.freepik.com/premium-vector/hand-drawn-pempek-palembang-indonesian-traditional-food-background_141928-606.jpg",
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 50,
                      bottom: 50,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.group_add, size: 60, color: Colors.white),
                        Text(
                          "Data Piket",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(
                      left: 10,
                      right: 10,
                      top: 50,
                      bottom: 50,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.dashboard_customize_rounded,
                          size: 60,
                          color: Colors.white,
                        ),
                        Text(
                          "Data Pelanggan",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(50),
              width: 400,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.receipt_long_rounded,
                    size: 60,
                    color: Colors.white,
                  ),
                  Text(
                    "Barang Masuk / Keluar",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
