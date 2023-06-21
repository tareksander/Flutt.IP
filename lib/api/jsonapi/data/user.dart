import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class User {
  String id;
  String username;
  String formattedName;
  String familyName;
  String givenName;
  String namePrefix;
  String nameSuffix;
  String permission;
  String? email;
  String? phone;
  String? homepage;
  String? address;

  factory User.fromJSON(Map<String, dynamic> data) => _$UserFromJson(data);

  User(
      this.id,
      this.username,
      this.formattedName,
      this.familyName,
      this.givenName,
      this.namePrefix,
      this.nameSuffix,
      this.permission,
      this.email,
      this.phone,
      this.homepage,
      this.address);
}
