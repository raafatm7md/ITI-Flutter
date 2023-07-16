import 'package:flutter/material.dart';
import 'package:untitled1/views/second_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black87,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 80, top: 80, right: 80, bottom: 10),
                  child: Container(
                      width: 250,
                      height: 250,
                      child: Image.asset("assets/Flutter.png")),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 0, right: 30),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value!.contains('@')) {
                        return null;
                      }
                      return 'Enter a valid email';
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      label: Text('Email'),
                      labelStyle: TextStyle(
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, top: 30, right: 30),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.length < 7) {
                        return 'Must be 8 or more';
                      }
                      return null;
                    },
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      label: Text('Password'),
                      labelStyle: TextStyle(
                        color: Colors.lightBlue,
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding:
                        const EdgeInsets.only(left: 30, top: 50, right: 30),
                    child: MaterialButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          saveEmail(emailController.text);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SecondPage()),
                          );
                        }
                      },
                      color: Colors.lightBlue,
                      textColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      minWidth: MediaQuery.of(context).size.width,
                      child: const Text("Log in"),
                    )),
                const Padding(
                  padding: EdgeInsets.all(30),
                  child: Text(
                    "Forgot password? No yawa. Tap me",
                    style: TextStyle(color: Colors.white70),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
                    child: MaterialButton(
                      onPressed: () {},
                      color: Colors.white,
                      textColor: Colors.lightBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      minWidth: MediaQuery.of(context).size.width,
                      child: const Text("No Account? Sign Up"),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  saveEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }
}
