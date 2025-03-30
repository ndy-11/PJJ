import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';

class ApiService {
  static const String baseUrl = "http://your-backend-url.com/api";

  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    final response = await Dio().post(
      "$baseUrl/auth/login",
      data: {"email": email, "password": password},
    );
    return response.data;
  }

  static Future<void> uploadTugas(String siswaId, File file) async {
    String? token = await _getToken();
    var uri = Uri.parse("$baseUrl/tugas/upload");
    var request =
        http.MultipartRequest('POST', uri)
          ..headers['Authorization'] = 'Bearer $token'
          ..fields['siswa_id'] = siswaId
          ..files.add(
            await http.MultipartFile.fromPath(
              'file',
              file.path,
              contentType: MediaType.parse(
                lookupMimeType(file.path) ?? 'application/octet-stream',
              ),
            ),
          );

    var response = await request.send();
    if (response.statusCode != 200) {
      throw Exception("Gagal mengupload tugas");
    }
  } // Tambahkan penutupan metode uploadTugas() di sini

  static Future<String?> _getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('token');
  }

  static Future<Map<String, dynamic>> getPaymentDetails(String siswaId) async {
    String? token = await _getToken();
    final response = await http.get(
      Uri.parse("$baseUrl/pembayaran/$siswaId/details"),
      headers: {"Authorization": "Bearer $token"},
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception("Gagal mengambil rincian pembayaran");
    }
  }

  static Future<void> tambahTagihan(String siswaId, int totalTagihan) async {
    String? token = await _getToken();
    final response = await http.post(
      Uri.parse("$baseUrl/pembayaran/tambah-tagihan"),
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json",
      },
      body: jsonEncode({"siswa_id": siswaId, "total_tagihan": totalTagihan}),
    );

    if (response.statusCode != 201) {
      throw Exception("Gagal menambahkan tagihan");
    }
  }
}
