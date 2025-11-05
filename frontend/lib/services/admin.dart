import './node_service.dart';
import 'package:http/http.dart' as http;

class AdminService {
  final NodeService _nodeService = NodeService();

  Future<int> loginAdmin(Map<String, dynamic> userData) async {
    var res = await _nodeService.post('/admin/login', userData);
		return res;
  }

  //Testar
  Future<int> criarProfessor(Map<String, dynamic> userData) async {
    return await _nodeService.post('/admin/professores', userData);
  }

  //Testar
  Future<http.Response> listarProfessor() async {
    return await _nodeService.get('/admin/professores');
  }

  //Testar
  Future<http.Response> atualizarProfessor(String email, String senha, String nome) async {
    final body = {'nome': nome, 'senha': senha};
    return await _nodeService.put('/admin/professores/$email', body);
  }

  //Testar  
  Future<http.Response> deletarProfessor(String email) async {
    return await _nodeService.delete('/admin/professores/$email');
  }
}
