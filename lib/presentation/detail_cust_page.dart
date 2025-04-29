import 'package:flutter/material.dart';
import 'package:ucp1/presentation/home_page.dart';

class DetailCustPage extends StatelessWidget {
  final String namaPengguna;
  final String nama;
  final String alamat;
  final String noHp;
  final String email;
  final String provinsi;
  final String kodePos;
  const DetailCustPage({
    super.key,
    required this.namaPengguna,
    required this.nama,
    required this.alamat,
    required this.noHp,
    required this.email,
    required this.provinsi,
    required this.kodePos,
  });

  @override
  Widget build(BuildContext context) {
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
          "Detail $nama",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: Image.asset(
                    "assets/fri.jpeg",
                    width: 150, // Lebar dan tinggi harus sama
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  nama,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                Text(email, style: TextStyle(fontSize: 16)),
                const SizedBox(height: 10),
                Text(noHp, style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Alamat"),
              const SizedBox(height: 10),
              TextFormField(
                initialValue: alamat,
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Provinsi"),
                        const SizedBox(height: 10),
                        TextFormField(
                          initialValue: provinsi,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Kode Pos"),
                        const SizedBox(height: 10),
                        TextFormField(
                          initialValue: kodePos,
                          readOnly: true,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) => HomePage(namaPengguna: namaPengguna),
                      ),
                      (route) => false,
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 88, 45, 29),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text("Selesai"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
