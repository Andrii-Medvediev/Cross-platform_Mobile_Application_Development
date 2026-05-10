import 'package:json_annotation/json_annotation.dart';

part 'client_model.g.dart';

@JsonSerializable()
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

  factory ClientModel.fromJson(Map<String, dynamic> json) =>
      _$ClientModelFromJson(json);

  Map<String, dynamic> toJson() => _$ClientModelToJson(this);
}
