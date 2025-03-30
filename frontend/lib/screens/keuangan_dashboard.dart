import 'package:flutter/material.dart';

class KeuanganDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Tambah Pembayaran")),
            ElevatedButton(onPressed: () {}, child: Text("Edit Pembayaran")),
          ],
        ),
      ),
    );
  }
}
