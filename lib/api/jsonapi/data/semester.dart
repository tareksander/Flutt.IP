import 'package:json_annotation/json_annotation.dart';

part 'semester.g.dart';


@JsonSerializable(fieldRename: FieldRename.kebab)
class Semester {
  String id;
  String title;
  String? description;
  String? token;
  DateTime start;
  DateTime end;
  DateTime startOfLectures;
  DateTime endOfLectures;
  bool visible;

  factory Semester.fromJSON(Map<String, dynamic> data) => _$SemesterFromJson(data);

  Semester(this.id, this.title, this.description, this.token, this.start,
      this.end, this.startOfLectures, this.endOfLectures, this.visible);
}

