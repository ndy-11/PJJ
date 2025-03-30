import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import '/services/api_service.dart';

class QRScanPage extends StatefulWidget {
  @override
  _QRScanPageState createState() => _QRScanPageState();
}

class _QRScanPageState extends State<QRScanPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  bool isProcessing = false;

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) async {
      if (!isProcessing && scanData.code != null) {
        // Pastikan scanData.code tidak null
        isProcessing = true;
        try {
          await ApiService.absensi(
            scanData.code!,
          ); // Pakai "!" karena sudah dicek di atas
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("Absensi berhasil")));
          Navigator.pop(context);
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Gagal absen: ${e.toString()}")),
          );
        }
        isProcessing = false;
      }
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Scan QR Code")),
      body: QRView(key: qrKey, onQRViewCreated: _onQRViewCreated),
    );
  }
}
