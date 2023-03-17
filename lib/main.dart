import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'my_app_page.dart';

void main() async {
  // Initialize hive
  await Hive.initFlutter();
// Open the peopleBox
  await Hive.openBox('peopleBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}