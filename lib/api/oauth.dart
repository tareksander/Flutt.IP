import 'package:drift/drift.dart';

import 'oauth1.dart';
import 'oauth2.dart';
import 'package:chopper/chopper.dart';

/// Generic data for OAuth clients
abstract class OAuthData {}



Authenticator getOAuthAuthenticator(OAuthHost host, String token) {
  if (host.data is OAuth1Data) {
    return OAuth1Authenticator(host.data as OAuth1Data, host, token);
  }
  if (host.data is OAuth2Data) {
    return OAuth2Authenticator(host.data as OAuth2Data, host, token);
  }
  throw InvalidDataException("Invalid OAuthData subclass");
}

/// A Stud.IP system where the app was registered an an OAuth application
class OAuthHost {
  /// Hostname
  final String host;
  /// Path to Stud.IP on the host
  final String path;
  final OAuthData data;

  const OAuthHost(this.host, this.path, this.data);
}


/// The list of Stud.IP installations where the app was registered
const Set<OAuthHost> oauthHosts = {
  
};


