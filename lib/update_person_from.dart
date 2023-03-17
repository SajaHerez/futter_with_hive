import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'person.dart';

class UpdatePersonForm extends StatefulWidget {
  const UpdatePersonForm({
    Key? key,
    required this.index,
    required this.person,
  }) : super(key: key);
  final int index;
  final Person person;

  @override
  _UpdatePersonFormState createState() => _UpdatePersonFormState();
}

class _UpdatePersonFormState extends State<UpdatePersonForm> {
  late final _nameController;
  late final _countryController;
  late final Box box;

  // ...

  // Update info of people box
  _updateInfo() {
    Person newPerson = Person(
      name: _nameController.text,
      country: _countryController.text,
    );
    box.putAt(widget.index, newPerson);
    print('Info updated in box!');
  }

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('peopleBox');
    // Show the current values
    _nameController = TextEditingController(text: widget.person.name);
    _countryController = TextEditingController(text: widget.person.country);
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         const Text('Name'),
          TextFormField(
            controller: _nameController,
          ),
        const  SizedBox(height: 24.0),
        const  Text('Home Country'),
          TextFormField(
            controller: _countryController,
          ),
       const    Spacer(),
          Padding(
            padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 24.0),
            child: SizedBox(
              width: double.maxFinite,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                    _updateInfo();
                    Navigator.of(context).pop();
                  
                },
                child:const Text('Update'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
