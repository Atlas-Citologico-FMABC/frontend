import 'package:http/http.dart' as http;

class ImageService {
	final String baseUrl = 'http://localhost:3001';

  Future<http.Response> getAllImages() async {
    return await http.get(Uri.parse('$baseUrl/images'));
  }
}
