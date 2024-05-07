import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medical_app/controllers/register_controller.dart';

class RegisterPage extends StatelessWidget {
  final RegisterController _registerC = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE8E8E8),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  width: Get.width,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xFF3685CD),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 90),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: TextField(
                  cursorColor: Color(0xFF3685CD),
                  controller: _registerC.nameController,
                  decoration: InputDecoration(
                    labelText: 'Username',
                    labelStyle: TextStyle(
                      color: Color(0xFF3685CD),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF3685CD), width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF3685CD), width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    suffixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF3685CD),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: TextField(
                  cursorColor: Color(0xFF3685CD),
                  controller: _registerC.emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Color(0xFF3685CD),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF3685CD), width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF3685CD), width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    suffixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF3685CD),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35),
                child: TextField(
                  cursorColor: Color(0xFF3685CD),
                  controller: _registerC.passwordController,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Color(0xFF3685CD),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF3685CD), width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    contentPadding:
                        EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF3685CD), width: 2.0),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    suffixIcon: Icon(
                      Icons.lock,
                      color: Color(0xFF3685CD),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 90),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: MaterialButton(
                  minWidth: Get.width,
                  height: 50,
                  color: Color(0xFF3685CD),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                  onPressed: () {
                    _registerC.registerWithEmail();
                  },
                  child: Text(
                    'Create Account',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
