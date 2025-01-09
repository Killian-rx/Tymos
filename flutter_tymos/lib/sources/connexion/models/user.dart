class User {
  final String id;
  final String email;
  final String password;

  User({
    required this.id,
    required this.email,
    required this.password,
  });

  factory User.fromMap(Map<String, dynamic> data, String documentId) {
    return User(
      id: documentId,
      email: data['email'] ?? '',
      password: data['password'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }
}
