import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'hive_services.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late final Box box;
  late HiveServices hiveSer;
  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('peopleBox');
    hiveSer = HiveServices(box);
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: hiveSer.addInfo,
              child: const Text('Add'),
            ),
            ElevatedButton(
              onPressed: hiveSer.getInfo,
              child: const Text('Get'),
            ),
            ElevatedButton(
              onPressed: hiveSer.updateInfo,
              child: const Text('Update'),
            ),
            ElevatedButton(
              onPressed: hiveSer.deleteInfo,
              child: const Text('Delete'),
            ),
          ],
        ),
      ),
    );
  }
}
