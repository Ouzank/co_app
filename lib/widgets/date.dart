// ignore_for_file: unused_field, non_constant_identifier_names, deprecated_member_use

import 'package:co_app/models/user.dart';
import 'package:flutter/material.dart';

class DateW extends StatefulWidget {
  DateW({Key? key}) : super(key: key);

  @override
  _DateWState createState() => _DateWState();
}

class _DateWState extends State<DateW> {
  final TextEditingController birthController = TextEditingController();
  DateTime date = DateTime.now();

  String d = '';
  String m = '';
  String y = '';
  String borndate = '';

  Future<Null> selectTimePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(1940),
        lastDate: DateTime(2100));
    if (picked != null && picked != date) {
      setState(() {
        date = picked;
        d = date.day.toString();
        m = date.month.toString();
        y = date.year.toString();
        borndate = d + '-' + m + '-' + y;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final birthdayField = TextFormField(
      readOnly: true,
        autofocus: false,
     
         
        decoration: InputDecoration(
          
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            label: Text(borndate),
            prefixIcon: const Icon(Icons.date_range),
            suffixIcon: Padding(
              child: IconButton(
                onPressed: () {
                  selectTimePicker(context);
                },
                icon: const Icon(Icons.calendar_today_outlined),
              ),
              padding: EdgeInsets.zero,
            ),
            hintText: 'First name',
            contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15)),
        keyboardType: TextInputType.text,
        controller: birthController,
        validator: (value) => value!.isEmpty ? "Choose a date" : null,
        onSaved: (value) {
          value = borndate;
          birthController.text = value;
        },
        textInputAction: TextInputAction.done);

    return birthdayField;
  }
}
