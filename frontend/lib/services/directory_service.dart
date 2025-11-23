import 'dart:convert';
import 'package:http/http.dart' as http;

class Directory {
  final String title;
  final String description;
  final List<String> imageFolderNames;

  Directory({
    required this.title,
    required this.description,
    required this.imageFolderNames,
  });

  factory Directory.fromJson(Map<String, dynamic> json) {
    return Directory(
      title: json['title'] as String,
      description: (json['description'] as String?) ?? '',
      imageFolderNames: (json['imageFolderNames'] as List<dynamic>)
          .map((e) => e.toString())
          .toList(),
    );
  }
}

class DirectoryService {
  final String baseUrl;

  DirectoryService({this.baseUrl = 'http://localhost:3001'});

  Future<List<Directory>> getAll() async {
    final resp = await http.get(Uri.parse('$baseUrl/directories'));
    if (resp.statusCode != 200) {
      throw Exception('HTTP ${resp.statusCode}: ${resp.body}');
    }
    final data = jsonDecode(resp.body);
    if (data is! List) {
      throw Exception('Resposta não é uma lista');
    }
    return data
        .map<Directory>((e) => Directory.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  Future<http.Response> deleteDirectory(String directoryTitle) async {
		final body = {'title': directoryTitle};
    return await http.delete(
			Uri.parse('$baseUrl/directories'), 
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
			body: jsonEncode(body)
		);
  }
}

