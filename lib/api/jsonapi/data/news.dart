import 'package:json_annotation/json_annotation.dart';

part 'news.g.dart';

@JsonSerializable(fieldRename: FieldRename.kebab)
class News {
  String id;
  String title;
  /// Content in HTML
  String content;
  DateTime mkdate;
  DateTime chdate;
  DateTime publicationStart;
  DateTime publicationEnd;
  bool commentsAllowed;
  

  factory News.fromJSON(Map<String, dynamic> data) => _$NewsFromJson(data);
  
  News(this.id, this.title, this.content, this.mkdate, this.chdate,
      this.publicationStart, this.publicationEnd, this.commentsAllowed);
  
}
