

import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';

import 'package:chopper/chopper.dart';
import 'package:flutt_ip/api/jsonapi/data/decoder.dart';





class JSONAPIConverter implements Converter {
  @override
  FutureOr<Request> convertRequest(Request request) {
    return request;
  }

  @override
  FutureOr<Response<BodyType>> convertResponse<BodyType, InnerType>(Response response) {
    if (response.headers["Content-Type"] != "application/vnd.api+json") {
      if (BodyType is Uint8List?) {
        return response.copyWith(body: response.bodyBytes as BodyType);
      }
      return response.copyWith(body: null);
    }
    if (BodyType is List?) {
      try {
        var json = (jsonDecode(response.bodyString) as Map<String, dynamic>)["data"];
        var list = List<InnerType>.empty(growable: true);
        for (var v in json) {
          var vj = v as Map<String, dynamic>;
          vj.addAll(vj["attributes"]);
          var it = Decoder.fromJson<InnerType>(json);
          if (it != null) list.add(it);
        }
        return response.copyWith(body: list as BodyType);
      } catch (err) {
        return response.copyWith(body: null);
      }
    } else {
      try {
        var json = (jsonDecode(response.bodyString) as Map<String, dynamic>)["data"];
        json.addAll(json["attributes"]);
        return response.copyWith(body: Decoder.fromJson<BodyType>(json));
      } catch (err) {
        return response.copyWith(body: null);
      }
    }
  }
  
}





