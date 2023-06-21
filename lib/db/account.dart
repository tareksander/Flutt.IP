

import 'package:drift/drift.dart';



enum AuthMethod {
  // Don't rename values, they are saved as strings in the DB
  /// HTTP Basic Authentication, storing the password in the database
  basic,
  /// HTTP Basic Authentication, storing the password only in memory
  basicNotSaved,
  /// Open a WebView for the user to log in, extract the session cookie
  cookie,
  /// Let the user authorize the app as an OAuth1 application
  oauth1,
  /// Let the user authorize the app as an OAuth2 application
  oauth2,
}

class Account extends Table {
  /// Stud.IP username
  TextColumn get username => text()();
  /// Stud.IP user id
  TextColumn get id => text()();
  /// host + path to Stud.IP, such that adding /jsonapi.php/v1/ results in valid API routes
  TextColumn get url => text()();
  
  TextColumn get auth => textEnum<AuthMethod>()();
  
  /// For auth = basic, this is the password.
  /// For auth = oauth1 or oauth2, this is the access/refresh token.
  /// Other auth methods leave this empty.
  TextColumn get secret => text().nullable()();
  
  
  
  
  @override
  Set<Column<Object>>? get primaryKey => {username, url};
}






