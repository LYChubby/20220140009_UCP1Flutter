import 'package:flutter/material.dart';
import 'package:ucp1/presentation/data_barang_page.dart';
import 'package:ucp1/presentation/data_pelanggan_page.dart';
import 'package:ucp1/presentation/data_piket_page.dart';

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
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            Text(
              '$namaPengguna',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
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
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                "https://img.freepik.com/premium-vector/hand-drawn-pempek-palembang-indonesian-traditional-food-background_141928-606.jpg",
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 50),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) =>
                                  DataPiketPage(namaPengguna: namaPengguna),
                        ),
                      );
                    },
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
                          const SizedBox(height: 8),
                          Text(
                            "Data Piket",
                            style: const TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DataPelangganPage(),
                        ),
                      );
                    },
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
                          const SizedBox(height: 8),
                          Text(
                            "Data Pelanggan",
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DataBarangPage()),
                );
              },
              child: Container(
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
                    const SizedBox(height: 8),
                    Text(
                      "Barang Masuk / Keluar",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
