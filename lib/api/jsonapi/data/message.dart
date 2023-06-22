import 'package:json_annotation/json_annotation.dart';
import 'package:drift/drift.dart' as drift;
import 'dart:convert';

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

  @JsonKey(readValue: _readRecipients, includeToJson: false)
  List<String> recipients;

  factory Message.fromJSON(Map<String, dynamic> data) => _$MessageFromJson(data);


  Message(this.id, this.subject, this.message, this.mkdate, this.priority,
      this.isRead, this.sender, this.recipients);

  static Object? _readSender(Map<dynamic, dynamic> data, String key) {
    return data["relationships"]["sender"]["data"]["id"];
  }

  static Object? _readRecipients(Map<dynamic, dynamic> data, String key) {
    return (data["relationships"]["recipients"]["data"] as List<dynamic>).map((e) => e["id"]).toList();
  }
}
