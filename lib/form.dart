import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'global_state.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Student Information Form")),
      body: Consumer<GlobalState>(
        builder: (context, globalState, child) {
          return Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                DropdownButtonFormField<String>(
                  value: globalState.selectedName.isEmpty
                      ? null
                      : globalState.selectedName,
                  decoration: InputDecoration(
                    labelText: "Select Your Name",
                    errorText: globalState.nameError.isEmpty
                        ? null
                        : globalState.nameError,
                  ),
                  items: [
                    const DropdownMenuItem(
                      value: '',
                      child: Text('Select Name'),
                    ),
                    const DropdownMenuItem(
                      value: 'onkar singh',
                      child: Text('Onkar Singh'),
                    ),
                    const DropdownMenuItem(
                      value: 'ravjot singh',
                      child: Text('Ravjot Singh'),
                    ),
                    const DropdownMenuItem(
                      value: 'gurveer singh',
                      child: Text('Gurveer Singh'),
                    ),
                  ],
                  onChanged: (value) {
                    globalState.setSelectedName(value ?? '');
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: "Enter your Email",
                    errorText: globalState.emailError.isEmpty
                        ? null
                        : globalState.emailError,
                  ),
                  onChanged: (value) {
                    globalState.setEmail(value);
                  },
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    if (globalState.validateForm()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Form is valid!')),
                      );
                    }
                  },
                  child: const Text("Validate Form"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }
}
