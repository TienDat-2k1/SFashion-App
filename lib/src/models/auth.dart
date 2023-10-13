class Auth {
  final String id;
  final String name;
  final String email;
  final String photo;
  final String role;
  final bool active;
  final String refreshToken;

  Auth({
    required this.id,
    required this.name,
    required this.email,
    required this.photo,
    required this.role,
    required this.active,
    required this.refreshToken,
  });

  Auth.fromJson(Map<String, dynamic> map)
      : id = map['_id'],
        name = map['name'],
        email = map['email'],
        photo = map['photo'],
        role = map['role'],
        active = map['active'],
        refreshToken = map['refreshToken'];
}
