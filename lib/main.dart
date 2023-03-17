import 'package:flutter/material.dart';
import 'package:futter_with_hive/person.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'info_screen.dart';
import 'my_app_page.dart';

void main() async {
  // Initialize hive
  await Hive.initFlutter();
  // Registering the adapter
  Hive.registerAdapter(PersonAdapter());
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
      home:  InfoScreen(),
    );
  }
}
