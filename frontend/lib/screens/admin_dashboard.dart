import 'package:flutter/material.dart';

class AdminDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Kelola User")),
            ElevatedButton(onPressed: () {}, child: Text("Kelola Pembayaran")),
          ],
        ),
      ),
    );
  }
}
