// ignore_for_file: camel_case_types, non_constant_identifier_names, depend_on_referenced_packages

import 'dart:convert';

import 'package:btcare/app/btcare.dart';
import 'package:btcare/features/patient/machine/data/models/timer_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'package:intl/intl.dart';

import 'package:timezone/timezone.dart' as tz;

class alarmprovider extends ChangeNotifier {
  late SharedPreferences preferences;

  List<Model> modelist = [];

  List<String> listofstring = [];

  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

  late BuildContext context;

  SetAlaram(String label, String dateTime, bool check, String repeat, int id,
      int milliseconds) {
    modelist.add(Model(
        label: label,
        dateTime: dateTime,
        check: check,
        when: repeat,
        id: id,
        milliseconds: milliseconds));
    notifyListeners();
  }

  EditSwitch(int index, bool check) {
    modelist[index].check = check;
    notifyListeners();
  }

  GetData() async {
    preferences = await SharedPreferences.getInstance();

    List<String>? cominglist = preferences.getStringList("data");

    if (cominglist == null) {
    } else {
      modelist = cominglist.map((e) => Model.fromJson(json.decode(e))).toList();
      notifyListeners();
    }
  }

  SetData() {
    listofstring = modelist.map((e) => json.encode(e.toJson())).toList();
    preferences.setStringList("data", listofstring);
    notifyListeners();
  }

  Inituilize(con) async {
    context = con;
    var androidInitilize =
        const AndroidInitializationSettings('@mipmap/ic_launcher');
    var iOSinitilize = const DarwinInitializationSettings();
    var initilizationsSettings =
        InitializationSettings(android: androidInitilize, iOS: iOSinitilize);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin!.initialize(initilizationsSettings,
        onDidReceiveNotificationResponse: onDidReceiveNotificationResponse);
  }

  void onDidReceiveNotificationResponse(
      NotificationResponse notificationResponse) async {
    final String? payload = notificationResponse.payload;
    if (notificationResponse.payload != null) {
      debugPrint('notification payload: $payload');
    }
    Navigator.push(
        context, MaterialPageRoute<void>(builder: (context) => const BtCare()));
  }

  ShowNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'your channel id',
      'your channel name',
      channelDescription: 'your channel description',
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
    );

    const NotificationDetails notificationDetails =
        NotificationDetails(android: androidNotificationDetails);
    await flutterLocalNotificationsPlugin!.show(
        0, 'plain title', 'plain body', notificationDetails,
        payload: 'item x');
  }

  SecduleNotification(DateTime datetim, int Randomnumber) async {
    int newtime =
        datetim.millisecondsSinceEpoch - DateTime.now().millisecondsSinceEpoch;
    await flutterLocalNotificationsPlugin!.zonedSchedule(
      Randomnumber,
      'Alarm Clock',
      DateFormat().format(DateTime.now()),
      tz.TZDateTime.now(tz.local).add(Duration(milliseconds: newtime)),
      const NotificationDetails(
          android: AndroidNotificationDetails(
              'your channel id', 'your channel name',
              channelDescription: 'your channel description',
              sound: RawResourceAndroidNotificationSound("alarm"),
              autoCancel: false,
              playSound: true,
              priority: Priority.max)),
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  CancelNotification(int notificationid) async {
    await flutterLocalNotificationsPlugin!.cancel(notificationid);
  }
}
