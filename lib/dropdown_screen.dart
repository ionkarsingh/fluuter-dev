import 'package:flutter/material.dart';

class DropdownScreen extends StatefulWidget {
  const DropdownScreen({super.key});

  @override
  State<DropdownScreen> createState() => _DropdownScreenState();
}

class _DropdownScreenState extends State<DropdownScreen> {
  final List<List<String>> dropdownData = [
    ['Select an option', ''],
    ['Onkar Singh', 'onkar singh'],
    ['Ravjot Singh', 'ravjot singh'],
    ['Gurveer Singh', 'gurveer singh'],
  ];

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Students Information Form'),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: DropdownButton<String>(
          value: selectedValue,
          hint: const Text('Choose Your Name Here'),
          isExpanded: true,
          items: dropdownData.map((List<String> item) {
            return DropdownMenuItem<String>(
              value: item[1],
              child: Text(item[0]),
            );
          }).toList(),
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
          },
        ),
      ),
    );
  }
}
