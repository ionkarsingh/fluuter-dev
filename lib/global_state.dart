import 'package:flutter/foundation.dart';

class GlobalState extends ChangeNotifier {
  String _selectedName = '';
  String _email = '';
  String _nameError = '';
  String _emailError = '';

  String get selectedName => _selectedName;
  String get email => _email;
  String get nameError => _nameError;
  String get emailError => _emailError;

  void setSelectedName(String name) {
    _selectedName = name;
    _nameError = '';
    notifyListeners();
  }

  void setEmail(String email) {
    _email = email;
    _emailError = '';
    notifyListeners();
  }

  bool validateForm() {
    bool isValid = true;

    if (_selectedName.isEmpty) {
      _nameError = 'Please select your name';
      isValid = false;
    }

    if (_email.isEmpty) {
      _emailError = 'Please enter your email';
      isValid = false;
    } else if (!_email.contains('@')) {
      _emailError = 'Please enter a valid email';
      isValid = false;
    }

    notifyListeners();
    return isValid;
  }

  void clearErrors() {
    _nameError = '';
    _emailError = '';
    notifyListeners();
  }
}
