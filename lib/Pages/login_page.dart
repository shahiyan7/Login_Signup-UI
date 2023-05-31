

import 'package:flutter/material.dart';
import 'package:login_signup/Pages/signup_page.dart';
import 'package:login_signup/validator.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

// ignore: camel_case_types
class _loginPageState extends State<loginPage> {
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Login Page'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/login_bg.avif'),
              fit: BoxFit.cover,
            ),
          ),
          child: Card(
            elevation: 2,
            margin: const EdgeInsets.symmetric(vertical: 150, horizontal: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Welcome! ",
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          )),
                      const SizedBox(
                        height: 15.0,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: const InputDecoration(
                          hintText: "Enter your email",
                          labelText: "Email",
                          border: OutlineInputBorder(),
                          fillColor: Colors.white,
                        ),
                        validator: (value) => Validator.validateEmail(value!),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Enter your password",
                          labelText: "Password",
                          border: OutlineInputBorder(),
                        ),
                        validator: (value) =>
                            Validator.validatePassword(value!),
                        obscureText: true,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // add navigation to home page
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()),
                              );
                          }
                        },
                        child: const Text('Submit'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                       Padding(
                        padding: EdgeInsets.all(35.0),
                        child: Row(
                          children: [
                            Text(
                              'Don\'t have an account?',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            TextButton(onPressed: (){
                        Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignupPage()),
                              );
                      },
                       child: Text('Sign Up',style: TextStyle(color: Colors.blue),)),
                           
                          ],
                         
                        ),
                      
                      ),
                      
                       
                    ]),
              ),
            ),
          ),
        ));
  }
}

