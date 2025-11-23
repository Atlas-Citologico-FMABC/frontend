import 'dart:convert';

import 'package:http/http.dart' as http;

class ImageService {
	final String baseUrl = 'http://localhost:3001';

  Future<http.Response> getAllImages() async {
    return await http.get(Uri.parse('$baseUrl/images'));
  }

  Future<http.Response> updateImage(String imageFolderName, String newTitle, String newDescription) async {
		final Map<String, dynamic> body = {'title': newTitle, 'description': newDescription};
    return await http.put(
			Uri.parse('$baseUrl/images/$imageFolderName'), 
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
			body: jsonEncode(body));
  }

  Future<http.Response> deleteImage(String imageFolderName) async {
    return await http.delete(Uri.parse('$baseUrl/images/$imageFolderName'));
  }

}
