import 'package:flutter/material.dart';

class SiswaDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Kirim Tugas")),
            ElevatedButton(onPressed: () {}, child: Text("Absen")),
            ElevatedButton(onPressed: () {}, child: Text("Bayar Sekolah")),
          ],
        ),
      ),
    );
  }
}
