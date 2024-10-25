import 'dart:convert';
import 'dart:io';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiClient {
  static const String baseUrl = 'https://api.eatlify.app:4404/';
  final storage = const FlutterSecureStorage();
  String? _accessToken;

  Future<void> writeRefreshToken(String refreshToken) async {
    await storage.write(key: 'refresh_token', value: refreshToken);
  }

  // Logic for refreshing the token
  Future<bool> refresh() async {
    String? refreshKey = await storage.read(key: "refresh_token");
    final prefs = await SharedPreferences.getInstance();
    final String? userId = prefs.getString('user');

    if (refreshKey == null || userId == null) {
      return false;
    }

    final response = await http.post(
      Uri.parse('${baseUrl}refresh'),
      headers: {'Content-Type': 'application/json'},
      body:
          jsonEncode({'refresh_token': refreshKey, "user": int.parse(userId)}),
    );

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body) as Map<String, dynamic>;
      _accessToken = responseData['access_token'];
      return true;
    }

    return false;
  }

  // Send GET request
  Future<http.Response> get(String endpoint) async {
    await _checkRefreshToken();
    final response = await http.get(
      Uri.parse(baseUrl + endpoint),
      headers: _buildHeaders(),
    );
    return _handleResponse(response);
  }

  // Send POST request
  Future<http.Response> post(String endpoint, Map<String, dynamic> data) async {
    await _checkRefreshToken();
    final response = await http.post(
      Uri.parse(baseUrl + endpoint),
      headers: _buildHeaders(),
      body: jsonEncode(data),
    );
    return _handleResponse(response);
  }

  // Build the request headers
  Map<String, String> _buildHeaders() {
    return {
      'Content-Type': 'application/json',
      if (_accessToken != null)
        HttpHeaders.authorizationHeader: 'Bearer $_accessToken',
    };
  }

  // Handle response (this is where you can handle errors, parse JSON, etc.)
  http.Response _handleResponse(http.Response response) {
    if (response.statusCode == 401) {
      // If unauthorized, you might want to log out or refresh token
    }
    return response;
  }

  // Check if token is expired and refresh it if necessary
  Future<void> _checkRefreshToken() async {
    if (_accessToken == null || _isTokenExpired()) {
      await refresh();
    }
  }

  bool _isTokenExpired() {
    //TODO: Implement logic to check if the token has expired (e.g., using JWT expiration field)
    return true;
  }
}
