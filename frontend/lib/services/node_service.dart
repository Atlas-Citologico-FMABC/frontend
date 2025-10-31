import 'dart:convert';
import 'package:http/http.dart' as http;

class NodeService {
  final String baseUrl = 'http://localhost:3000';

  Future<int> post(String endpoint, Map<String, dynamic> body) async {
    var retorno = await http.post(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(body),
    );
		return retorno.statusCode;
  }

  // Testar
  Future<http.Response> get(String endpoint) async {
    return await http.get(Uri.parse('$baseUrl$endpoint'));
  }

  // Testar
  Future<http.Response> put(String endpoint, Map<String, dynamic> body) async {
    return await http.put(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: jsonEncode(body),
    );
  }

  // Testar
  Future<http.Response> delete(String endpoint) async {
    return await http.delete(
      Uri.parse('$baseUrl$endpoint'),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );
  }
}
