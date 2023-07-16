import 'package:flutter/material.dart';
import '../utils.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    getUserEmail();
  }

  String userEmail = "-";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          color: Colors.black87,
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 300),
                child: Text(
                  'Welcome!',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
              Text(
                userEmail,
                style: const TextStyle(color: Colors.white, fontSize: 24),
              )
            ],
          ),
        ),
      ),
    );
  }

  getUserEmail() async {
    userEmail = await getEmail();
    setState(() {});
  }
}
