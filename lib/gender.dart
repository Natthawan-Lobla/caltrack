import 'package:flutter/material.dart';
import 'user_info.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  _GenderScreenState createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Color(0xFFFDF1DC)],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Welcome",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () => setState(() => selectedGender = "Female"),
                  child: _genderImage("assets/images/girl.png", selectedGender == "Female"),
                ),
                const SizedBox(width: 20),
                GestureDetector(
                  onTap: () => setState(() => selectedGender = "Male"),
                  child: _genderImage("assets/images/boy.png", selectedGender == "Male"),
                ),
              ],
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: selectedGender != null
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserInfoScreen(gender: selectedGender!),
                        ),
                      );
                    }
                  : null, // ปิดปุ่มถ้ายังไม่ได้เลือก
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _genderImage(String assetPath, bool isSelected) {
    return Container(
      decoration: BoxDecoration(
        border: isSelected ? Border.all(color: Colors.blue, width: 3) : null,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(assetPath, height: 150),
    );
  }
}
