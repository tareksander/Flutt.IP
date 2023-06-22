

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
    if (response.headers["content-type"] != "application/vnd.api+json") {
      if (BodyType == Uint8List) {
        return response.copyWith(body: response.bodyBytes as BodyType);
      }
      return Response(response.base, null, error: response.error);
    }
    if (BodyType == List<InnerType>) {
      try {
        var json = (jsonDecode(response.bodyString) as Map<String, dynamic>)["data"];
        var list = List<InnerType>.empty(growable: true);
        for (var v in json) {
          print(v);
          var vj = v as Map<String, dynamic>;
          vj.addAll(vj["attributes"]);
          var it = Decoder.fromJson<InnerType>(vj);
          if (it != null) list.add(it);
        }
        return Response(response.base, list as BodyType);
      } catch (err) {
        print(err);
        return Response(response.base, null, error: response.error);
      }
    } else {
      try {
        var json = (jsonDecode(response.bodyString) as Map<String, dynamic>)["data"];
        json.addAll(json["attributes"]);
        return Response(response.base, Decoder.fromJson<BodyType>(json));
      } catch (err) {
        print(err);
        return Response(response.base, null, error: response.error);
      }
    }
  }
  
}





