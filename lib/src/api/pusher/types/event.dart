import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Customer extends Object with _$CustomerSerializerMixin {
  final String firstname;
  final String lastname;

  Company company;

  Customer(this.firstname, this.lastname, this.company);

  // Boilerplate code needed to wire-up generated code
  factory Customer.fromJson(Map<String, dynamic> json) =>
      _$CustomerFromJson(json);
}

@JsonSerializable()
class Company extends Object with _$CompanySerializerMixin {
  Company(this.name);

  String name;

  // Boilerplate code needed to wire-up generated code
  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
