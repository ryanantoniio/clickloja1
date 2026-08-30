class User {
  late String username;
  late String password;

  User(this.username, this.password);

  // Converte um Map (resultado do banco) em objeto User
  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  // Converte o objeto User em Map para persistência no banco
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
