import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ucp1/presentation/detail_cust_page.dart';

class DataPelangganPage extends StatefulWidget {
  final String namaPengguna;
  const DataPelangganPage({super.key, required this.namaPengguna});

  @override
  State<DataPelangganPage> createState() => _DataPelangganPageState();
}

class _DataPelangganPageState extends State<DataPelangganPage> {
  final TextEditingController namaCustController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController noHpController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController provinsiController = TextEditingController();
  final TextEditingController kodePosController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
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
          "Data Pelanggan",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Nama Pelanggan"),
              const SizedBox(height: 10),
              TextFormField(
                controller: namaCustController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Nama Cust',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan nama pelanggan';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Email"),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'Email',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Silakan masukkan email';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("No Hp"),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: noHpController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'No Hp',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Silakan masukkan No Hp';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Text("Alamat"),
              const SizedBox(height: 10),
              TextFormField(
                controller: alamatController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Alamat',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Silakan masukkan alamat';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Provinsi"),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: provinsiController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'Provinsi',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Silakan masukkan provinsi';
                            }
                            return null;
                          },
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
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                          ],
                          controller: kodePosController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            hintText: 'Kode Pos',
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Silakan masukkan kode pos';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 70),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color.fromARGB(255, 88, 45, 29),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => DetailCustPage(
                                namaPengguna: widget.namaPengguna,
                                nama: namaCustController.text,
                                email: emailController.text,
                                noHp: noHpController.text,
                                alamat: alamatController.text,
                                provinsi: provinsiController.text,
                                kodePos: kodePosController.text,
                              ),
                        ),
                      );
                    }
                  },
                  child: Text("Simpan"),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    elevation: 0,
                    foregroundColor: Color.fromARGB(255, 88, 45, 29),
                    side: const BorderSide(
                      color: Color.fromARGB(255, 175, 174, 174),
                      width: 1, // ketebalan border
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    namaCustController.clear();
                    emailController.clear();
                    noHpController.clear();
                    alamatController.clear();
                    provinsiController.clear();
                    kodePosController.clear();
                  },
                  child: Text("Reset"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
