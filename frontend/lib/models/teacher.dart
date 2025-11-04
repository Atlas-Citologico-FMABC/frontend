class Teacher {
  final String nome;
  final String email;

  Teacher({required this.nome, required this.email});

  factory Teacher.fromJson(Map<String, dynamic> j) {
    return Teacher(
      nome: j['nome'] ?? '',
      email: j['email'] ?? '',
    );
  }
}
