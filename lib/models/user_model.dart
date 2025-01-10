class UserModel {
  final String uid;
  final String? name;
  final String email;

  UserModel({required this.uid, this.name, required this.email});

  factory UserModel.fromMap(Map<String, dynamic> data, String documentId) {
    return UserModel(
      uid: documentId,
      name: data['name'],
      email: data['email'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
    };
  }
}
