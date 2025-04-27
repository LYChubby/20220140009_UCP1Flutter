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
    );
  }
}
