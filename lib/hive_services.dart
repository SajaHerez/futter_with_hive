import 'package:hive/hive.dart';

class HiveServices {
  Box box;
  HiveServices(this.box);

  addInfo() async {
    // Add info to people box key and value
    box.put("name", "saja");
    box.put('country', 'PS');
    print('Info added to box!');
    //Hive also supports integer keys, so you can use auto-incrementing keys.
    box.add("shahed"); // index 0
  }

  getInfo() {
    // Get info from people box
    String country = "";
    if (box.containsKey("name") && box.containsKey("country")) {
      String name = box.get('name');
      country = box.get('country');
      print('my name is $name , My home is $country');
    }

    //If you are using auto-incrementing values, you can read using the index,like this:
    String sis = box.getAt(0); // retrieves the value with index 0
    print('my sis is $sis , My home is $country');
  }

  updateInfo() {
// Update info of people box
//  you can use the same put() method that you originally used to store the value.
//   This will update the value present at that key with the newly provided value.
    box.put('name', 'saja Hz');
    print('Info updated in box!');

    //If you are using auto-incrementing values, you can use the putAt() method
    // for updating the value present at a particular index
    box.putAt(0, 'shahed Hz');
  }

  deleteInfo() {
    // Delete info from people box
    box.delete('name');
    box.delete('country');
    print('Info deleted from box!');

    // If you are using auto-incrementing values,
    //you can use deleteAt() method by providing the index.

    box.deleteAt(0);
  }
}
