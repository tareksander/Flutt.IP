
import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:flutt_ip/api/url.dart';

class BasicAuthenticator implements Authenticator {
  String header;
  String host;

  BasicAuthenticator(this.host, String user, String password) : header = "Basic ${base64Encode(utf8.encode("$user:$password"))}";
  
  
  @override
  FutureOr<Request?> authenticate(Request request, Response response, [Request? originalRequest]) {
    // if we tried already, it's not going to work
    if (originalRequest?.headers["Authorization"] != null) return null;
    // only send over https to the configured host
    if (! isHostSecure(request, host)) return null;
    request.headers["Authorization"] = header;
    return request;
  }
  
}


