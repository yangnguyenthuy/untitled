class User {
  String username;
  String password;

  User({required this.username, required this.password});

  User.fromJson(Map<String, dynamic> json)
      : username = json['username'],
        password = json['password'];

  Map<String, dynamic> toJson() => {
    'username': username,
    'password': password,
  };
}