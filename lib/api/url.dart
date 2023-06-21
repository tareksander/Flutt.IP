import 'package:chopper/chopper.dart';

bool isHostSecure(Request? r, String host) {
  if (r == null) return false;
  if (r.url.scheme != "https") return false;
  return r.url.host == host;
}
