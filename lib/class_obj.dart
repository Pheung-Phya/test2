import 'dart:io';

void main(List<String> args) {
  List<Map<String, dynamic>> list = [];

  late int id;
  late String name;
  late String gender;
  late double salary;

  while (true) {
    stdout.write('\nChoose an operation:\n1. Create\n2. Read\n3. Search\n4. Sort\n5. Delete\n6. Update\n7. Exit\n');
    int choice = int.parse(stdin.readLineSync()!);

    switch (choice) {
      case 1:
        // Create (Add new records)
        for (int i = 0; i < 3; i++) {
          stdout.write('Enter ID     : ');
          id = int.parse(stdin.readLineSync()!);
          stdout.write('Enter Name   : ');
          name = stdin.readLineSync()!;
          stdout.write('Enter Gender : ');
          gender = stdin.readLineSync()!;
          stdout.write('Enter Salary : ');
          salary = double.parse(stdin.readLineSync()!);
          list.add({'id': id, 'name': name, 'gender': gender, 'salary': salary});
        }
        break;

      case 2:
        // Read (Display all records)
        if (list.isEmpty) {
          print('No records to display.');
        } else {
          for (var item in list) {
            item.forEach((key, value) => stdout.write('$value \t'));
            stdout.write('\n');
          }
        }
        break;

      case 3:
        // Search (Find record by name)
        stdout.write('Enter Name to search: ');
        String search = stdin.readLineSync()!;
        bool found = false;
        for (var map in list) {
          if (map.containsValue(search)) {
            map.forEach((key, value) => stdout.write('$value \t'));
            stdout.write('\n');
            found = true;
          }
        }
        if (!found) print('No record found for name: $search');
        break;

      case 4:
        // Sort (Sort by name)
        list.sort((a, b) => a['name'].compareTo(b['name']));
        print('Records sorted by name.');
        break;

      case 5:
        // Delete (Remove record by name)
        stdout.write('Enter Name to delete: ');
        String del = stdin.readLineSync()!;
        list.removeWhere((element) => element['name'] == del);
        print('Record(s) deleted.');
        break;

      case 6:
        // Update (Find and update record by name)
        stdout.write('Enter Name to Update: ');
        String update = stdin.readLineSync()!;
        bool updated = false;
        for (int i = 0; i < list.length; i++) {
          if (list[i]['name'] == update) {
            stdout.write('Enter new ID     : ');
            id = int.parse(stdin.readLineSync()!);
            stdout.write('Enter new Name   : ');
            name = stdin.readLineSync()!;
            stdout.write('Enter new Gender : ');
            gender = stdin.readLineSync()!;
            stdout.write('Enter new Salary : ');
            salary = double.parse(stdin.readLineSync()!);

            // Update the record directly
            list[i] = {'id': id, 'name': name, 'gender': gender, 'salary': salary};
            print('Record updated.');
            updated = true;
            break;
          }
        }
        if (!updated) print('No record found with name: $update');
        break;

      case 7:
        // Exit the loop and program
        print('Exiting...');
        return;

      default:
        print('Invalid choice. Please select a valid option.');
    }
  }
}
