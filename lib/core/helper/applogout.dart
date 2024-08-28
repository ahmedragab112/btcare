
import 'package:btcare/core/cache/cache_helper.dart';

class AppLogout {
  factory AppLogout() {
    return _instance;
  }

  AppLogout._();

  static final AppLogout _instance = AppLogout._();

  Future<void> logout() async {
    await CacheHelper().clear();
  }
}
