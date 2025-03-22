import 'package:caltrack/gender.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthCard extends StatelessWidget {
  final bool isLogin;
  const AuthCard({super.key, required this.isLogin});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              isLogin ? "Sign in" : "Sign up",
              style: GoogleFonts.poppins(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(decoration: const InputDecoration(labelText: "Email")),
            TextField(decoration: const InputDecoration(labelText: "Password"), obscureText: true),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              ),
              onPressed: () {
                // เมื่อล็อกอินสำเร็จให้ไปหน้า WelcomeScreen
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const GenderScreen()),
                );
              },
              child: Text(isLogin ? "Sign in" : "Sign up"),
            ),
            if (!isLogin)
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text("By clicking this button, you agree with our Terms and Conditions"),
              ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SocialButton(icon: Icons.g_mobiledata, text: "Google"),
                SizedBox(width: 10),
                SocialButton(icon: Icons.facebook, text: "Facebook"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final IconData icon;
  final String text;
  const SocialButton({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {},
      icon: Icon(icon, color: Colors.black),
      label: Text(text),
    );
  }
}
