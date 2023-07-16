import 'package:flutter/material.dart';
import '../utils.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    super.initState();
    getUserEmail();
  }

  String userEmail = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          // color: Colors.black87,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 300),
                child: Text(
                  'Welcome!',
                  style: TextStyle(color: Colors.black, fontSize: 24),
                ),
              ),
              Text(
                userEmail,
                style: const TextStyle(color: Colors.black, fontSize: 24),
              )
            ],
          ),
        ),
      ),
    );
  }

  getUserEmail() async {
    userEmail = await getEmail();
    setState(() {});}
}
