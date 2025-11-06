import './node_service.dart';
import 'package:http/http.dart' as http;

class ProfessorService {
  final NodeService _nodeService = NodeService();

  Future<http.Response> loginProfessor(Map<String, dynamic> userData) async {
    return await _nodeService.post('/professor/login', userData);
  }
}
