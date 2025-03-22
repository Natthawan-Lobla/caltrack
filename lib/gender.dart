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
        child: SafeArea(
          child: Column(
            children: [
              // 🔙 ปุ่มย้อนกลับ
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white, size: 28),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              // 🏡 หัวข้อหลัก
              const Text(
                "Welcome",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),

              // 👦👧 เลือกเพศ
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

              // ▶ ปุ่ม "Next"
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: selectedGender != null ? Colors.blue : Colors.grey,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
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
                child: const Text("Next", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),

              const Spacer(),

              // 🔵 จุดแสดงตำแหน่ง (อยู่ที่จุดแรก)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  3, // จำนวนจุดทั้งหมด (เช่น 3 หน้าต่อกัน)
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == 0 ? Colors.blueAccent : Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
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
