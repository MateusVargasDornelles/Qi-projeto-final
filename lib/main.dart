import 'package:flutter/material.dart';
import 'package:ui_clock_and_alarm/add_alarm.dart';

import 'login_register.dart';

void main() => runApp(AlarmApp());

class AlarmApp extends StatefulWidget {
  _AlarmAppState createState() => _AlarmAppState();
}

class _AlarmAppState extends State<AlarmApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        initialRoute: '/Home',
        routes: {
          '/add-alarm': (context) => AddAlarm(),
        },
        theme: ThemeData(
            fontFamily: 'SourceSansPro',
            primaryColor: Color.fromARGB(255, 66, 8, 1),
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(secondary: Color(0xff65D1BA))),
        debugShowCheckedModeBanner: false,
        home: MyApp());
  }
}
