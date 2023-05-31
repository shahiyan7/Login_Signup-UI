import 'package:flutter/material.dart';
import 'package:login_signup/validator.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signup Page'),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/login_bg.avif'),
            fit: BoxFit.cover,
          ),
        ),
      
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            elevation: 2,
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                  children: [
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
                      height: 25.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        hintText: "Enter your name",
                        labelText: "Name",
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                     const SizedBox(
                      height: 25.0,
                    ),
                    
                    TextFormField(
                      keyboardType: TextInputType.phone,
                      decoration: const InputDecoration(
                        hintText: "Enter your phone number",
                        labelText: "Phone",
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your phone number';
                        }
                        else if (value.length < 10) {
                          return 'Phone number must be at least 10 characters long';
                        }
                        else if (!value.contains(RegExp(r'[0-9]'))) {
                          return 'Phone number must contain at least 1 number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: false,
                      decoration: const InputDecoration(
                        hintText: "Enter a Strong Password",
                        labelText: "Password",
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                      ),
                    validator: (value) => Validator.validatePassword(value!),
                    ),
                    const SizedBox(
                      height: 25.0,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.streetAddress,
                      decoration: const InputDecoration(
                        hintText: "Enter your address",
                        labelText: "Address",
                        border: OutlineInputBorder(),
                        fillColor: Colors.white,
                      ),
                      maxLines: null,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height:35,
                    ),
                    
                    ElevatedButton(
                      onPressed: (){
                        if(_formKey.currentState!.validate()){
                          Navigator.pop(context);
                        }
                      }
                    , child: const Text('Signup')
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
        )),
    );
  }
}