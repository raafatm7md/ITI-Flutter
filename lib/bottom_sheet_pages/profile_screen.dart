import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black87,
          child: const Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 300),
                child: Text(
                  'Profile Page!',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
