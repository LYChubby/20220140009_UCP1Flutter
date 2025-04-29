import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DetailPiketPage extends StatelessWidget {
  final String tugas;
  final String tanggal;
  final String namaPengguna;
  const DetailPiketPage({
    super.key,
    required this.tugas,
    required this.namaPengguna,
    required this.tanggal,
  });

  @override
  Widget build(BuildContext context) {
    final formattedDate = DateFormat(
      'EEEE, dd MMMM yyyy',
      'id_ID',
    ).format(DateTime.parse(tanggal));
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 88, 45, 29),
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
        ),
        title: Text(
          "Detail $tugas",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    formattedDate,
                    style: TextStyle(
                      color: Color.fromARGB(255, 88, 45, 29),
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.all(12.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 88, 45, 29),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Text(
                    namaPengguna,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(bottom: 10),
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 88, 45, 29),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(tugas, style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
