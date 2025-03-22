import 'package:flutter/material.dart';
import 'goal_selection.dart';

class UserInfoScreen extends StatefulWidget {
  const UserInfoScreen({super.key, required this.gender});

  final String gender;

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final TextEditingController weightController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController targetWeightController = TextEditingController();
  late String gender;

  @override
  void initState() {
    super.initState();
    gender = widget.gender; // รับค่า gender จากหน้าก่อนหน้า
  }

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

              // 📌 หัวข้อหลัก
              const Text(
                "To calculate the calories for you",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),

              const SizedBox(height: 20),

              // 📝 แบบฟอร์มกรอกข้อมูล
              _inputCard(),

              const SizedBox(height: 20),

              // ▶ ปุ่ม "Next"
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                onPressed: () {
                  double weight = double.tryParse(weightController.text) ?? 0;
                  double height = double.tryParse(heightController.text) ?? 0;
                  int age = int.tryParse(ageController.text) ?? 0;
                  double targetWeight = double.tryParse(targetWeightController.text) ?? 0;

                  double weightGainPerWeek = (targetWeight - weight) / 4; // สมมติแบ่งเป็น 4 สัปดาห์

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GoalSelectionScreen(
                        weight: weight,
                        height: height,
                        age: age,
                        targetWeight: targetWeight,
                        weightGainPerWeek: weightGainPerWeek,
                        gender: gender,
                      ),
                    ),
                  );
                },
                child: const Text("Next", style: TextStyle(fontSize: 16, color: Colors.white)),
              ),

              const Spacer(),

              // 🔵 จุดแสดงตำแหน่ง (อยู่ที่จุดสอง)
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
                      color: index == 1 ? Colors.blueAccent : Colors.grey, // จุดที่ 1 (index = 1) ถูกเลือก
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

  // 📝 การ์ดสำหรับกรอกข้อมูล
  Widget _inputCard() {
    return Card(
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            _InfoInputField(controller: ageController, label: "Age", suffix: "Year"),
            const SizedBox(height: 10),
            _InfoInputField(controller: heightController, label: "Height", suffix: "Cm"),
            const SizedBox(height: 10),
            _InfoInputField(controller: weightController, label: "Weight", suffix: "Kg"),
            const SizedBox(height: 10),
            _InfoInputField(controller: targetWeightController, label: "Target weight", suffix: "Kg"),
          ],
        ),
      ),
    );
  }
}

// 🎯 Widget ช่องกรอกข้อมูล
class _InfoInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String suffix;

  const _InfoInputField({required this.controller, required this.label, required this.suffix, super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffix,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        filled: true,
        fillColor: Colors.white,
      ),
      keyboardType: TextInputType.number,
    );
  }
}
