import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'siswa_dashboard.dart';
import 'keuangan_dashboard.dart';
import 'admin_dashboard.dart';

class DashboardPage extends StatefulWidget {
  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String? role;

  @override
  void initState() {
    super.initState();
    _loadUserRole();
  }

  Future<void> _loadUserRole() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      role = prefs.getString('role');
    });
  }

  @override
  Widget build(BuildContext context) {
    if (role == null) return CircularProgressIndicator();

    return Scaffold(
      appBar: AppBar(title: Text("Dashboard")),
      body:
          role == "siswa"
              ? SiswaDashboard()
              : role == "keuangan"
              ? KeuanganDashboard()
              : AdminDashboard(),
    );
  }
}
