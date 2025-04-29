import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ucp1/presentation/home_page.dart';

class DetailBarangPage extends StatelessWidget {
  final String namaPengguna;
  final String tanggal;
  final String jenisTransaksi;
  final String jenisBarang;
  final String jumlahBarang;
  final String hargaSatuan;
  final String totalHarga;
  const DetailBarangPage({
    super.key,
    required this.namaPengguna,
    required this.tanggal,
    required this.jenisTransaksi,
    required this.jenisBarang,
    required this.jumlahBarang,
    required this.hargaSatuan,
    required this.totalHarga,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.only(
          top: 70.0,
          left: 16.0,
          right: 16.0,
          bottom: 16.0,
        ),
        children: [
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ClipOval(
                  child: Image.network(
                    "https://myim3banner.kloc.co/assets/uploads/payment_success_bg_1696413362.png",
                    width: 150, // Lebar dan tinggi harus sama
                    height: 150,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "Data Berhasil Disimpan",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 50),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Tanggal", style: TextStyle(fontSize: 20)),
                    Text(tanggal, style: TextStyle(fontSize: 20)),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Jenis Transaksi", style: TextStyle(fontSize: 20)),
                    Text(jenisTransaksi, style: TextStyle(fontSize: 20)),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Jenis Barang", style: TextStyle(fontSize: 20)),
                    Text(jenisBarang, style: TextStyle(fontSize: 20)),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Jumlah Barang", style: TextStyle(fontSize: 20)),
                    Text(jumlahBarang, style: TextStyle(fontSize: 20)),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Harga Satuan", style: TextStyle(fontSize: 20)),
                    Text(hargaSatuan, style: TextStyle(fontSize: 20)),
                  ],
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Total Harga", style: TextStyle(fontSize: 20)),
                    Text(
                      NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: "Rp. ",
                        decimalDigits: 2,
                      ).format(int.parse(totalHarga)),
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                const Divider(),
                const SizedBox(height: 30),
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
          ),
        ],
      ),
    );
  }
}
