class User {
  final String id;
  final String username;
  final String email;

  User({required this.id, required this.username, required this.email});

  Map<String, dynamic> toMap() {
    return {'username': username, 'email': email};
  }
}
