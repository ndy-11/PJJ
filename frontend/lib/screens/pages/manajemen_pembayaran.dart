import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ManajemenPembayaranPage extends StatefulWidget {
  @override
  _ManajemenPembayaranPageState createState() =>
      _ManajemenPembayaranPageState();
}

class _ManajemenPembayaranPageState extends State<ManajemenPembayaranPage> {
  final _siswaIdController = TextEditingController();
  final _tagihanController = TextEditingController();

  void _tambahTagihan() async {
    try {
      await ApiService.tambahTagihan(
        _siswaIdController.text,
        int.parse(_tagihanController.text),
      );
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Tagihan berhasil ditambahkan")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Gagal menambahkan tagihan")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manajemen Pembayaran")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _siswaIdController,
              decoration: InputDecoration(labelText: "ID Siswa"),
            ),
            TextField(
              controller: _tagihanController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Total Tagihan"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _tambahTagihan,
              child: Text("Tambah Tagihan"),
            ),
          ],
        ),
      ),
    );
  }
}
