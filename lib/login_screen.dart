import 'package:flutter/material.dart';
import 'otp_screen.dart';
import 'dart:math';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String _username = '';
  String _password = '';
  String? _signupUsername;
  String? _signupEmail;
  String? _signupPassword;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
    if (args != null) {
      _signupUsername = args['username'];
      _signupEmail = args['email'];
      _signupPassword = args['password'];
      _username = _signupUsername ?? '';
      _password = _signupPassword ?? '';
    }
  }

  void _showDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  void _onForgotPassword() {
    final otp = (Random().nextInt(9000) + 1000).toString();
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => OTPScreen(otp: otp)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Card(
            elevation: 8,
            margin: const EdgeInsets.symmetric(horizontal: 24),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(height: 16),
                    Icon(
                      Icons.lock_outline,
                      size: 64,
                      color: Colors.deepPurple,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Welcome Back',
                      style: Theme.of(context).textTheme.headlineSmall
                          ?.copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      initialValue: _username,
                      decoration: const InputDecoration(
                        labelText: 'Username or Email',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) => value == null || value.isEmpty
                          ? 'Enter username or email'
                          : null,
                      onSaved: (value) => _username = value ?? '',
                    ),
                    const SizedBox(height: 16),
                    TextFormField(
                      initialValue: _password,
                      decoration: const InputDecoration(
                        labelText: 'Password',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.lock),
                      ),
                      obscureText: true,
                      validator: (value) => value == null || value.isEmpty
                          ? 'Enter password'
                          : null,
                      onSaved: (value) => _password = value ?? '',
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            _formKey.currentState?.save();
                            if (_signupUsername != null &&
                                _signupPassword != null) {
                              if ((_username == _signupUsername ||
                                      _username == _signupEmail) &&
                                  _password == _signupPassword) {
                                _showDialog('Login Successful!');
                              } else {
                                _showDialog('Invalid credentials.');
                              }
                            } else {
                              _showDialog(
                                'No signup data. Please sign up first.',
                              );
                            }
                          }
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.deepPurple,
                          textStyle: const TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        onPressed: _onForgotPassword,
                        child: const Text('Forgot Password?'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
