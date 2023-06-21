import 'dart:async';

import 'package:flutt_ip/api/url.dart';

import 'oauth.dart';
import 'package:chopper/chopper.dart';

/// Data for OAuth1 clients
class OAuth1Data extends OAuthData {
  final String clientID;
  final String clientSecret;

  OAuth1Data(this.clientID, this.clientSecret);
}

const _oAuth1RedirectURL = "flutt.ip://oauth1";

class OAuth1Authenticator implements Authenticator {
  final OAuth1Data data;
  final OAuthHost host;
  /// The Access token
  final String token;
  
  OAuth1Authenticator(this.data, this.host, this.token);

  @override
  FutureOr<Request?> authenticate(Request request, Response response, [Request? originalRequest]) {
    if (! isHostSecure(request, host.host)) return null;
    
    return null;
  }
  
}



