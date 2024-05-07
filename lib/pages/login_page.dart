import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:medical_app/controllers/login_controller.dart';
import 'package:medical_app/routes/route_name.dart';

class LoginPage extends StatelessWidget {
  final LoginController _loginC = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: 100,
                width: 100,
                color: Colors.white,
              ),
              Container(
                height: Get.height,
                width: Get.width,
                decoration: BoxDecoration(
                  color: Color(0xFFE8E8E8),
                ),
                child: Column(
                  children: [
                    SizedBox(height: (Get.height - (0.6 * Get.height))),
                    Text(
                      "HEALTH SCORE",
                      style: TextStyle(
                        color: Color(0xFF3685CD),
                        fontSize: 33,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "MEDICAL APP",
                      style: TextStyle(
                        color: Color(0xFF3685CD),
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  height: 200,
                  width: Get.width,
                  decoration: BoxDecoration(
                    color: Color(0xFF3685CD),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                right: 0,
                left: 0,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Container(
                    height: 250,
                    width: Get.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          TextField(
                            cursorColor: Color(0xFF3685CD),
                            controller: _loginC.emailController,
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
                              contentPadding: EdgeInsets.only(
                                  left: 10.0, top: 10.0, bottom: 10.0),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                    color: Color(0xFF3685CD), width: 2.0),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              suffixIcon: Icon(
                                Icons.person,
                                color: Color(0xFF3685CD),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          TextField(
                            obscureText: true,
                            cursorColor: Color(0xFF3685CD),
                            controller: _loginC.passwordController,
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
                              contentPadding: EdgeInsets.only(
                                  left: 10.0, top: 10.0, bottom: 10.0),
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
                          SizedBox(height: 10),
                          MaterialButton(
                            minWidth: Get.width,
                            height: 50,
                            color: Color(0xFF3685CD),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                            onPressed: () {
                              _loginC.loginWithEmail();
                            },
                            child: Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                height: 40,
                                color: Color(0xFF3685CD),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                onPressed: () {
                                  Get.offAllNamed(RouteName.registerPage);
                                },
                                child: Text(
                                  'Sign Up',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              MaterialButton(
                                height: 40,
                                color: Color(0xFF3685CD),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Guest',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
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
