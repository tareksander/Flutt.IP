
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AppTheme {
  // Don't change these names, they are used in the SharedPreferences
  cupertino, material, fluent, native, studip, macos;
}


const _themeKey = "theme";
const _firstStartKey = "firstStart";

const _activeUsernameKey = "username";
const _activeURLKey = "url";


class ActiveAccount {
  String username;
  String url;

  ActiveAccount(this.username, this.url);
}

class _ActiveAccountNotifier extends StateNotifier<AsyncValue<ActiveAccount?>> {
  _ActiveAccountNotifier() : super(const AsyncLoading()) {
    _fetch();
  }

  Future<void> _fetch() async {
    var p = await SharedPreferences.getInstance();
    var username = p.getString(_activeUsernameKey), url = p.getString(_activeURLKey);
    if (username == null || url == null) {
      state = const AsyncData(null);
    } else {
      state = AsyncData(ActiveAccount(username, url));
    }
  }

  void setActiveAccount(ActiveAccount? a) async {
    var p = await SharedPreferences.getInstance();
    state = AsyncData(a);
    if (a == null) {
      await p.remove(_activeUsernameKey);
      await p.remove(_activeURLKey);
    } else {
      await p.setString(_activeUsernameKey, a.username);
      await p.setString(_activeURLKey, a.url);
    }
  }
}


final activeAccountProvider = StateNotifierProvider<_ActiveAccountNotifier,
    AsyncValue<ActiveAccount?>>((ref) {
  return _ActiveAccountNotifier();
});


class ThemeNotifier extends StateNotifier<AsyncValue<AppTheme>> {
  ThemeNotifier() : super(const AsyncLoading()) {
    _fetch();
  }
      
  Future<void> _fetch() async {
    var p = await SharedPreferences.getInstance();
    state = AsyncData(AppTheme.values.byName(p.getString(_themeKey) ??
        AppTheme.material.name));
  }
  
  void setTheme(AppTheme t) async {
    var p = await SharedPreferences.getInstance();
    state = AsyncData(t);
    await p.setString(_themeKey, t.name);
  }
}



final themeProvider = StateNotifierProvider<ThemeNotifier, AsyncValue<AppTheme>>((ref)  {
  return ThemeNotifier();
});



Future<bool> firstAppStart() async {
  var p = await SharedPreferences.getInstance();
  var first = p.getBool(_firstStartKey) ?? true;
  await p.setBool(_firstStartKey, false);
  return first;
}










