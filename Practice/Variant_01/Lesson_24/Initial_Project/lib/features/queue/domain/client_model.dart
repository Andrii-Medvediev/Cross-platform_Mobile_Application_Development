class ClientModel {
  final int id;
  final String firstName;
  final String lastName;
  final int age;
  final String email;

  const ClientModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.age,
    required this.email,
  });

  factory ClientModel.fromJson(Map<String, dynamic> json) {
    return ClientModel(
      id: json['id'] as int,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      age: json['age'] as int,
      email: json['email'] as String,
    );
  }
}
