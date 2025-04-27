import 'package:flutter/material.dart';

class DataPiketPage extends StatefulWidget {
  final String namaPengguna;
  const DataPiketPage({super.key, required this.namaPengguna});

  @override
  State<DataPiketPage> createState() => _DataPiketPageState();
}

class _DataPiketPageState extends State<DataPiketPage> {
  final TextEditingController tugasController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  late TextEditingController namaController = TextEditingController();
  List<String> daftarTugas = [];
  List<DateTime?> deadlines = [];
  String? dateError;
  DateTime? selectedDate;

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime(2021, 7, 25),
      firstDate: DateTime(2021),
      lastDate: DateTime(2022),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
        tanggalController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  void addTugas() {
    setState(() {
      daftarTugas.add(tugasController.text);
    });
  }

  @override
  void initState() {
    super.initState();
    namaController = TextEditingController(text: widget.namaPengguna);
  }

  @override
  void dispose() {
    namaController.dispose();
    super.dispose();
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
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Text(
          "Piket Gudang",
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
              Text("Nama Anggota"),
              const SizedBox(height: 10),
              TextFormField(
                controller: namaController,
                // enabled: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text("Pilih Tanggal"),
              const SizedBox(height: 10),
              TextFormField(
                controller: tanggalController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: 'Pilih Tanggal',
                  prefixIcon: IconButton(
                    onPressed: _selectDate,
                    icon: Icon(Icons.date_range),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Pilih Tanggal Terlebih Dahulu';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
