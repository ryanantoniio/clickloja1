class User {
  late String username;
  late String password;

  User(this.username, this.password);

  //converte um map em user
  User.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
  }

  //converte o  user em map
  Map<String, dynamic> toJson() {
    return {
      'username': username,
      'password': password,
    };
  }
}
