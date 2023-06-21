import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class Message {
  String id;
  String subject;
  String message;
  DateTime mkdate;
  String priority;
  bool isRead;
  

  @JsonKey(readValue: _readSender, includeToJson: false)
  String sender;

  // TODO recipients list, if needed

  factory Message.fromJSON(Map<String, dynamic> data) => _$MessageFromJson(data);


  Message(this.id, this.subject, this.message, this.mkdate, this.priority,
      this.isRead, this.sender);

  static Object? _readSender(Map<dynamic, dynamic> data, String key) {
    return data["relationships"]["sender"]["data"]["id"];
  }
}
