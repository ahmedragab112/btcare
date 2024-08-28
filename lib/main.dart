import 'package:btcare/app/btcare.dart';
import 'package:btcare/core/cache/cache_helper.dart';
import 'package:btcare/core/helper/observer.dart';
import 'package:btcare/core/provider/notification_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:provider/provider.dart';
import 'package:timezone/data/latest_all.dart' as tz;

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()!
      .requestNotificationsPermission();
  Bloc.observer = MyBlocObserver();
  CacheHelper().init();
  runApp(ChangeNotifierProvider(
    create: (context) => alarmprovider(),
    child: const BtCare(),
  ));
}
