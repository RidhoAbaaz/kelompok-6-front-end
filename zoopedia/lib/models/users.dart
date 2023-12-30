// ignore_for_file: non_constant_identifier_names

class Users {
  // definisikan field dari product
  final int id;
  final String username;
  final String tanggal_lahir;
  final String gender;
  final String region;
  final String no_telepon;
  final String email;
  final String password;

  //constructor product
  Users({
    required this.id,
    required this.username,
    required this.tanggal_lahir,
    required this.gender,
    required this.region,
    required this.no_telepon,
    required this.email,
    required this.password,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      id: json['id'] ?? 0,
      username: json['username'] ?? '',
      tanggal_lahir: json['tanggal_lahir'] ?? '',
      gender: json['gender'] ?? '',
      region: json['region'] ?? '',
      no_telepon: json['no_telepon'] ?? '',
      email: json['email'] ?? '',
      password: json['password'] ?? '',
    );
  }
}
