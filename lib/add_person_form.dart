import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import 'person.dart';

class AddPersonForm extends StatefulWidget {
  const AddPersonForm({Key? key}) : super(key: key);
  @override
  _AddPersonFormState createState() => _AddPersonFormState();
}

class _AddPersonFormState extends State<AddPersonForm> {
  final _nameController = TextEditingController();
  final _countryController = TextEditingController();
  final _personFormKey = GlobalKey<FormState>();
  late final Box box;

  @override
  void initState() {
    super.initState();
    // Get reference to an already opened box
    box = Hive.box('peopleBox');
  }

  // Add info to people box
  _addInfo() async {
    Person newPerson = Person(
      name: _nameController.text,
      country: _countryController.text,
    );
    box.add(newPerson);
    print('Info added to box!');
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _personFormKey,
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
                 
                    _addInfo();
                    Navigator.of(context).pop();
                  
                },
                child:const Text('Add'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
