import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  final String baseUrl = 'http://localhost:8080/api'; // Change this to your backend URL
  String? _token;

  void setToken(String token) {
    _token = token;
  }

  Future<http.Response> post(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = {
      'Content-Type': 'application/json',
      if (_token != null) 'Authorization': 'Bearer $_token',
    };
    final body = json.encode(data);

    return await http.post(url, headers: headers, body: body);
  }

  Future<http.Response> get(String endpoint) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = {
      if (_token != null) 'Authorization': 'Bearer $_token',
    };

    return await http.get(url, headers: headers);
  }

  Future<http.Response> put(String endpoint, Map<String, dynamic> data) async {
    final url = Uri.parse('$baseUrl$endpoint');
    final headers = {
      'Content-Type': 'application/json',
      if (_token != null) 'Authorization': 'Bearer $_token',
    };
    final body = json.encode(data);

    return await http.put(url, headers: headers, body: body);
  }
}
