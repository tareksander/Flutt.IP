import 'dart:async';

import 'package:flutt_ip/api/url.dart';

import 'oauth.dart';
import 'package:chopper/chopper.dart';

/// Data for OAuth2 clients
class OAuth2Data extends OAuthData {
  final String clientID;

  OAuth2Data(this.clientID);
}


const _oAuth2RedirectURL = "flutt.ip://oauth2";

class OAuth2Authenticator implements Authenticator {
  final OAuth2Data data;
  final OAuthHost host;
  final String refreshToken;
  String? accessToken;

  OAuth2Authenticator(this.data, this.host, this.refreshToken);

  @override
  FutureOr<Request?> authenticate(Request request, Response response, [Request? originalRequest]) {
    if (! isHostSecure(request, host.host)) return null;
    
    return null;
  }

}


