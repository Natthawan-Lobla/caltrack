import 'package:flutter/material.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Color(0xFFFDF1DC)], // ปรับสีให้เหมือนดีไซน์
          ),
        ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/salad.png', height: 200), // เปลี่ยนเป็น path รูปของคุณ
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) => LoginScreen())
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.lightBlue,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 12),
            ),
            child: const Text("Sign in | Sign up", style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    )
    );
  }
}
