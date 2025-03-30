import 'package:flutter/material.dart';
import '../services/api_service.dart';

class RincianPembayaranPage extends StatefulWidget {
  final String siswaId;

  RincianPembayaranPage({required this.siswaId});

  @override
  _RincianPembayaranPageState createState() => _RincianPembayaranPageState();
}

class _RincianPembayaranPageState extends State<RincianPembayaranPage> {
  Map<String, dynamic>? pembayaranData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    try {
      var data = await ApiService.getPaymentDetails(widget.siswaId);
      setState(() {
        pembayaranData = data;
        isLoading = false;
      });
    } catch (e) {
      print("Error: $e");
      setState(() => isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Rincian Pembayaran")),
      body:
          isLoading
              ? Center(child: CircularProgressIndicator())
              : pembayaranData == null
              ? Center(child: Text("Data tidak ditemukan"))
              : Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Tagihan: Rp. ${pembayaranData!['total_tagihan']}",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Jumlah Bayar: Rp. ${pembayaranData!['jumlah_bayar']}",
                      style: TextStyle(fontSize: 18),
                    ),
                    Text(
                      "Sisa Bayar: Rp. ${pembayaranData!['sisa_bayar']}",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(height: 20),
                    LinearProgressIndicator(
                      value: (pembayaranData!['persenBayar'] / 100),
                      backgroundColor: Colors.grey[300],
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                    ),
                    SizedBox(height: 10),
                    Text("Progress: ${pembayaranData!['persenBayar']}%"),
                  ],
                ),
              ),
    );
  }
}
