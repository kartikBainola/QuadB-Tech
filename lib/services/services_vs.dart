import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthApiService {
  static const String _baseUrl = 'https://api.tvmaze.com';

  Future<List<dynamic>> fetchAllShows() async {
    final response = await http.get(Uri.parse('$_baseUrl/search/shows?q=all'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load shows');
    }
  }

  Future<List<dynamic>> searchShows(String query) async {
    final response =
        await http.get(Uri.parse('$_baseUrl/search/shows?q=$query'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to search shows');
    }
  }
}
