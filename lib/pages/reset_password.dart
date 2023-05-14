import 'package:flutter/material.dart';
import 'package:theek_karo/api/api_service.dart';

class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  late String _email;
  @override
  void didChangeDependencies() {
    final Map? arguments = ModalRoute.of(context)!.settings.arguments as Map;

    if (arguments != null) {
      _email = arguments["email"];
    }
    super.didChangeDependencies();
  }

  Future<void> _resetPassword() async {
    if (_formKey.currentState!.validate()) {
      String newPassword = _passwordController.text;
      print(_passwordController.text);
      var result = await APIService.resetPassword(_email, newPassword);

      if (result == true) {
        // Password reset successful, navigate back to login screen

        Navigator.of(context).pop();
        Navigator.of(context).pushNamedAndRemoveUntil(
          '/login',
          (route) => false,
        );
      } else {
        // Password reset failed, show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error resetting password.'),
          ),
        );
      }
      // TODO: Implement password reset logic
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Reset password for: $_email'),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a password';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters long';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              TextFormField(
                controller: _confirmPasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  } else if (value != _passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              Center(
                child: ElevatedButton(
                  onPressed: _resetPassword,
                  child: Text('Reset Password'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
