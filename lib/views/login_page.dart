import 'package:flutter/material.dart';
import 'package:untitled1/views/second_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(text: "raafat@gmail.com");
  final TextEditingController passwordController = TextEditingController(text: "12345678");

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    left: 80, top: 80, right: 80, bottom: 10),
                child: SizedBox(
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
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    label: Row(
                      children: [
                        Icon(Icons.alternate_email, color: Colors.lightBlue),
                        Text(' Email', style: TextStyle(color: Colors.lightBlue)),
                      ],
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
                  controller: passwordController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    label: Row(
                      children: [
                        Icon(Icons.lock, color: Colors.lightBlue),
                        Text(' Password', style: TextStyle(color: Colors.lightBlue)),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 30, top: 50, right: 30),
                  child: MaterialButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        bool login = await signingIn(emailController.text, passwordController.text);
                        if (login){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SecondPage()),
                          );
                        }
                        else{
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text("Wrong email or password"))
                          );
                        }
                      }
                      else{
                        emailController.clear();
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
    );
  }

  saveEmail(String email) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
  }
  Future<bool> signingIn(String email, String password) async{
    bool result = false;
    try{
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );
      final user = userCredential.user;
      if (user!=null){
        print(user.uid);
        saveEmail(user.email!);
        result = true;
      }
      return result;
    }
    catch (error){
      return result;
    }
  }
}
