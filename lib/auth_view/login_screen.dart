import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ftfl_attendance_app/custom_widget/custom_decoration.dart';
import 'package:ftfl_attendance_app/custom_widget/custom_hw.dart';
import 'package:ftfl_attendance_app/custom_widget/custom_textstyle.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _userIdController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _userIdController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 10),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeadline(),
                  50.height,
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          /// User ID Field
                          TextFormField(
                            controller: _userIdController,
                            style: textStyle16(),
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              hintText: 'Enter User ID',
                              prefixIcon: const Icon(Icons.person, size: 30),
                              hintStyle: textStyle16(color: Colors.grey),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter User ID';
                              }
                              return null;
                            },
                          ),

                          20.height,

                          /// Password Field
                          TextFormField(
                            controller: _passwordController,
                            obscureText: !_isPasswordVisible,
                            style: textStyle16(),
                            decoration: InputDecoration(
                              border: const UnderlineInputBorder(),
                              hintText: 'Enter Password',
                              prefixIcon: const Icon(Icons.lock, size: 30),
                              hintStyle: textStyle16(color: Colors.grey),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isPasswordVisible = !_isPasswordVisible;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter Password';
                              }
                              if (value.length < 8) {
                                return 'Password must be at least 8 characters';
                              }
                              return null;
                            },
                          ),

                          10.height,
                          Text(
                            "Make sure your password contains at least 8 characters for security.",
                            style: textStyle12(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),

              /// Log in button
              Align(
                alignment: Alignment.bottomCenter,
                child: _logInButton(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      // Perform login action here
                      ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(backgroundColor: Colors.white,
                            content: Text('Logging in...', style: textStyle12(color: Colors.black),)),
                      );

                     Get.offNamed('/bottomNav');
                    }
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _logInButton({required VoidCallback onTap}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      height: 50,
      width: double.infinity,
      decoration: customDecoration(
        color: Colors.green,
        borderRadius: 20,
      ),
      child: Center(
        child: Text(
          'Login',
          style: textStyle16(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    ),
  );
}

Widget _buildHeadline() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const Text(
        "Welcome!",
        style: TextStyle(fontSize: 30, fontWeight: FontWeight.w500),
      ),
      Text(
        "Log in to your area account",
        style: textStyle16(color: Colors.grey),
      ),
    ],
  );
}
