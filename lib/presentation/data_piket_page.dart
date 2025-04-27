import 'package:flutter/material.dart';

class DataPiketPage extends StatefulWidget {
  const DataPiketPage({super.key});

  @override
  State<DataPiketPage> createState() => _DataPiketPageState();
}

class _DataPiketPageState extends State<DataPiketPage> {
  final TextEditingController tugasController = TextEditingController();
  List<String> daftarTugas = [];
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
    );
  }
}
