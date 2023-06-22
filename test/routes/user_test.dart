import 'package:chopper/chopper.dart';
import 'package:flutt_ip/api/basic_authenticator.dart';
import 'package:flutt_ip/api/jsonapi/routes/headers.dart';
import 'package:flutt_ip/api/jsonapi/jsonapi.dart';
import 'package:flutt_ip/api/jsonapi/routes/users.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const demoServer = "demo.studip.de";
  const user = "test_admin";
  const password = "testing";

  var c = ChopperClient(
      authenticator: BasicAuthenticator(demoServer, user, password),
      converter: JSONAPIConverter(),
      baseUrl: Uri.parse("https://$demoServer/"));
  var u = Users.create(c);
  
  
  test("Users.me", () {
    return u.me().then((value) {
      expect(value.statusCode, 200);
      assert(value.body != null);
    });
  });
  
  
  test("Users.search", () {
    return u.search(name: "test_").then((value) {
      expect(value.statusCode, 200);
      assert(value.body != null);
    });
  });

  test("Users.search", () {
    return u.search(name: "test_").then((value) {
      expect(value.statusCode, 200);
      assert(value.body != null);
    });
  });
  
}

