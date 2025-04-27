import 'package:flutter/material.dart';

class DetailCustPage extends StatelessWidget {
  final String nama;
  final String alamat;
  final String noHp;
  final String email;
  final String provinsi;
  final String kodePos;
  const DetailCustPage({
    super.key,
    required this.nama,
    required this.alamat,
    required this.noHp,
    required this.email,
    required this.provinsi,
    required this.kodePos,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
