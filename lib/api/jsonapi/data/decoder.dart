
import 'package:flutt_ip/api/jsonapi/data/user.dart';

class Decoder {
  
  static T? fromJson<T>(Map<String, dynamic> json) {
    if (T is User) return User.fromJSON(json) as T?;
    return null;
  }
  
  
  
}

