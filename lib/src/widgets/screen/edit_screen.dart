import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:drift/drift.dart' as drift;
import 'package:master_drift_provider/src/data/local/helper/db_helper.dart';

class EditUserScreen extends StatefulWidget {
  final int userId;

  const EditUserScreen({super.key, required this.userId});

  @override
  State<EditUserScreen> createState() => _EditUserScreenState();
}

class _EditUserScreenState extends State<EditUserScreen> {
  late ReportDatabase _db;
  late UserData _UserData;

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController dateOfBirthController = TextEditingController();
  DateTime? _selectedDate;

  @override
  void initState() {
    super.initState();
    _db = ReportDatabase();
    getUser();
  }

  Future<void> getUser() async {
    _UserData = await _db.getUsersByID(widget.userId);

    // FILL USER DETAIL TO INPUTS
    firstNameController.text = _UserData.firstName;
    lastNameController.text = _UserData.lastName;
    genderController.text = _UserData.gender;
    countryController.text = _UserData.country;
    ageController.text = _UserData.age.toString();
    dateOfBirthController.text = _UserData.firstName;
  }

  @override
  void dispose() {
    _db.close();

    firstNameController.dispose();
    lastNameController.dispose();
    genderController.dispose();
    countryController.dispose();
    ageController.dispose();
    dateOfBirthController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Update User"),
        centerTitle: true,
      ),
      body: Card(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomFormField(
              controller: firstNameController,
              txtLabel: "First Name",
            ),
            CustomFormField(
              controller: lastNameController,
              txtLabel: "Last Name",
            ),
            CustomFormField(
              controller: genderController,
              txtLabel: "Gender",
            ),
            CustomFormField(
              controller: countryController,
              txtLabel: "Country",
            ),
            CustomFormField(
              controller: ageController,
              txtLabel: "Age",
            ),
            CustomDatePickerFormField(
              controller: dateOfBirthController,
              txtLabel: "Date of Birth",
              callback: () => pickDateOfBirth(context),
            ),
            const SizedBox(
              height: 10,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              TextButton(
                  style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(12),
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blue[300],
                      textStyle: const TextStyle(
                          fontSize: 15, fontWeight: FontWeight.w400)),
                  onPressed: () {
                    editUser();
                  },
                  child: const Text(
                    'Update User',
                    style: TextStyle(fontSize: 16),
                  ))
            ])
          ],
        ),
      )),
    );
  }

  Future<void> pickDateOfBirth(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate ?? initialDate,
        firstDate: DateTime(DateTime.now().year - 100),
        lastDate: DateTime(DateTime.now().year + 1),
        builder: (context, child) => Theme(
            data: ThemeData().copyWith(
                colorScheme: const ColorScheme.light(
                    primary: Colors.blue,
                    onPrimary: Colors.white,
                    onSurface: Colors.black),
                dialogBackgroundColor: Colors.white),
            child: child ?? const Text("")));

    if (newDate == null) {
      return;
    }

    setState(() {
      _selectedDate = newDate;
      String formattedDate = DateFormat('dd/MM/yyyy').format(newDate);
      dateOfBirthController.text = formattedDate;
    });
  }

  void addUser() {
    // final entity = UserCompanion.insert(firstName: firstName, lastName: lastName, gender: gender, country: country, age: age)
    final entity = UserCompanion(
        firstName: drift.Value(firstNameController.text),
        lastName: drift.Value(lastNameController.text),
        gender: drift.Value(genderController.text),
        country: drift.Value(countryController.text),
        age: drift.Value(int.parse(ageController.text)));

    _db.insertUser(entity).then((value) {
      ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
          backgroundColor: Colors.green,
          content: Text(
            "Data inserted successfully! $value",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ))
          ]));
    });
  }

  void editUser() {
    // TODO : Update User Data With Location
    // final entity = UserCompanion.insert(firstName: firstName, lastName: lastName, gender: gender, country: country, age: age)
    final entity = UserCompanion(
        id: drift.Value(widget.userId),
        firstName: drift.Value(firstNameController.text),
        lastName: drift.Value(lastNameController.text),
        completed: const drift.Value(true),
        gender: drift.Value(genderController.text),
        country: drift.Value(countryController.text),
        age: drift.Value(int.parse(ageController.text)));

    _db.updateUser(entity).then((value) {
      ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
          backgroundColor: Colors.green,
          content: Text(
            "Data updated successfully! $value",
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                  Navigator.pushNamed(context, '/');
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ))
          ]));
    });
  }
}

class CustomFormField extends StatelessWidget {
  const CustomFormField({
    super.key,
    required this.controller,
    required this.txtLabel,
  });

  final TextEditingController controller;
  final String txtLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.name,
          cursorHeight: 26,
          decoration: InputDecoration(
            hintText: 'Enter $txtLabel',
            label: Text(txtLabel),
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$txtLabel can not be empty';
            }
            return null;
          },
        ),
      ],
    );
  }
}

class CustomDatePickerFormField extends StatelessWidget {
  const CustomDatePickerFormField(
      {super.key,
      required this.controller,
      required this.txtLabel,
      required this.callback});

  final TextEditingController controller;
  final String txtLabel;
  final VoidCallback callback;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 10,
        ),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.name,
          cursorHeight: 26,
          decoration: InputDecoration(
            hintText: 'Enter $txtLabel',
            label: Text(txtLabel),
            border: const OutlineInputBorder(),
          ),
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '$txtLabel can not be empty';
            }
            return null;
          },
          onTap: callback,
        ),
      ],
    );
  }
}
