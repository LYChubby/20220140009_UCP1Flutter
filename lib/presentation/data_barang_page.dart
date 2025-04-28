import 'package:flutter/material.dart';

class DataBarangPage extends StatefulWidget {
  const DataBarangPage({super.key});

  @override
  State<DataBarangPage> createState() => _DataBarangPageState();
}

class _DataBarangPageState extends State<DataBarangPage> {
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController jumlahBarangController = TextEditingController();
  final TextEditingController jenisTransController = TextEditingController();
  final TextEditingController jenisBarangController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold();
  }
}
