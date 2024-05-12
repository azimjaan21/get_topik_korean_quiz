class UserModel {
  final String id;
  final String email;
  final String password;
  final String phoneNumber;
  final String name;
  final String? profilePicture;

  UserModel({
    required this.id,
    required this.email,
    required this.password,
    required this.phoneNumber,
    required this.name,
    this.profilePicture,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      password: json['password'],
      phoneNumber: json['phoneNumber'],
      name: json['name'],
      profilePicture: json['profilePicture'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'phoneNumber': phoneNumber,
      'name': name,
      'profilePicture': profilePicture,
    };
  }
}
