import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '/services/api_service.dart';

class UploadTugasPage extends StatefulWidget {
  final String siswaId;

  UploadTugasPage({required this.siswaId});

  @override
  _UploadTugasPageState createState() => _UploadTugasPageState();
}

class _UploadTugasPageState extends State<UploadTugasPage> {
  File? _selectedFile;

  void _pickFile() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedFile = File(pickedFile.path);
      });
    }
  }

  void _uploadFile() async {
    if (_selectedFile == null) return;

    try {
      await ApiService.uploadTugas(widget.siswaId, _selectedFile!);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Tugas berhasil diupload")));
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Gagal mengupload tugas")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Upload Tugas")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            _selectedFile != null
                ? Image.file(_selectedFile!)
                : Text("Pilih file tugas"),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _pickFile, child: Text("Pilih File")),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _uploadFile, child: Text("Upload")),
          ],
        ),
      ),
    );
  }
}
