import 'package:json_annotation/json_annotation.dart';

part 'course.g.dart';


@JsonSerializable(fieldRename: FieldRename.kebab)
class Course {
  String id;
  //String courseNumber;
  String title;
  String? subtitle;
  String? description;


  Course(this.id, this.title, this.subtitle, this.description,
      this.startSemester, this.endSemester);

  @JsonKey(readValue: _readStartSemester, includeToJson: false)
  String startSemester;

  @JsonKey(readValue: _readEndSemester, includeToJson: false)
  String endSemester;

  factory Course.fromJSON(Map<String, dynamic> data) => _$CourseFromJson(data);

  static Object? _readStartSemester(Map<dynamic, dynamic> data, String key) {
    return data["relationships"]["start-semester"]["data"]["id"];
  }

  static Object? _readEndSemester(Map<dynamic, dynamic> data, String key) {
    return data["relationships"]["end-semester"]["data"]["id"];
  }
}


