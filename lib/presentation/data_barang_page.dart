import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';
import 'package:intl/date_symbol_data_local.dart';

class DataBarangPage extends StatefulWidget {
  const DataBarangPage({super.key});

  @override
  State<DataBarangPage> createState() => _DataBarangPageState();
}

class _DataBarangPageState extends State<DataBarangPage> {
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController jumlahBarangController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  String? dateError;
  DateTime? selectedDate;
  String? selectedValueTransaksi;
  List<String> jenisTransaksi = ['Barang Masuk', 'Barang Keluar'];
  String? selectedValueBarang;
  List<String> jenisBarang = ['Carrier', 'Sleeping Bag', 'Tenda', 'Sepatu'];

  final Map<String, int> hargaBarang = {
    'Carrier': 500000,
    'Sleeping Bag': 300000,
    'Tenda': 1000000,
    'Sepatu': 400000,
  };

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        tanggalController.text =
            tanggalController.text = DateFormat(
              'EEEE, dd MMMM yyyy',
              'id_ID',
            ).format(selectedDate!);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('id_ID', null).then((_) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
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
          "Pendataan Barang",
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
              Text("Tanggal Transaksi"),
              const SizedBox(height: 10),
              TextFormField(
                controller: tanggalController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Tanggal Transaksi",
                  prefixIcon: IconButton(
                    onPressed: _selectDate,
                    icon: Icon(Icons.date_range),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tanggal tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: "Jenis Transaksi",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                value: selectedValueTransaksi,
                items:
                    jenisTransaksi
                        .map(
                          (String item) =>
                              DropdownMenuItem(value: item, child: Text(item)),
                        )
                        .toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValueTransaksi = newValue;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih Jenis Transaksi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField(
                decoration: InputDecoration(
                  labelText: "Jenis Barang",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                value: selectedValueBarang,
                items:
                    jenisBarang
                        .map(
                          (String item) =>
                              DropdownMenuItem(value: item, child: Text(item)),
                        )
                        .toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedValueBarang = newValue;
                    if (newValue != null) {
                      int harga = hargaBarang[newValue] ?? 0;
                      hargaController.text = NumberFormat.currency(
                        locale: 'id_ID',
                        symbol: 'Rp ',
                        decimalDigits: 2,
                      ).format(harga);
                    }
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih Jenis Barang';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Jumlah Barang"),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: jumlahBarangController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter
                                .digitsOnly, // Hanya menerima digit
                          ],
                          decoration: InputDecoration(
                            hintText: "Jumlah Barang",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Jumlah Barang tidak boleh kosong';
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
                        Text("Harga Satuan"),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: hargaController,
                          readOnly: true,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.currency_bitcoin),
                            hintText: "Harga Satuan",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Harga tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
