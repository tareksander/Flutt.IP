

import 'package:chopper/chopper.dart';
import 'package:flutt_ip/api/basic_authenticator.dart';
import 'package:flutt_ip/api/jsonapi/routes/headers.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const demoServer = "demo.studip.de";
  const user = "test_admin";
  const password = "testing";
  
  test("Test BasicAuthenticator working.", () {
    var c = ChopperClient(authenticator: BasicAuthenticator(demoServer, user, password));
    return c.get(Uri.parse("https://demo.studip.de/jsonapi.php/v1/users/me"), headers: apiHeaders).then((value) {
      expect(value.statusCode, 200);
    });
  });
  
  test("Test BasicAuthenticator not working over http.", () {
    var c = ChopperClient(
      authenticator: BasicAuthenticator(demoServer, user, password),);
    return c.get(Uri.parse("http://demo.studip.de/jsonapi.php/v1/users/me"),
        headers: apiHeaders).then((value) {
      expect(value.statusCode, 401);
    });
  });
  test("Test BasicAuthenticator not working on other hosts", () {
    var c = ChopperClient(
      authenticator: BasicAuthenticator("test.example", user, password),);
    return c.get(Uri.parse("https://demo.studip.de/jsonapi.php/v1/users/me"),
        headers: apiHeaders).then((value) {
      expect(value.statusCode, 401);
    });
  });
}

