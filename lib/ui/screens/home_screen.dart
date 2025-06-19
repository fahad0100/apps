import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: Column(
            children: [
              Text("Home Screen"),
              ElevatedButton(onPressed: () {}, child: Text("Sign Out")),
            ],
          ),
        ),
      ),
    );
  }
}
