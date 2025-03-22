import 'package:flutter/material.dart';
import 'dashboard_screen.dart';

class CalculationResultScreen extends StatelessWidget {
  final double weight;
  final double height;
  final int age;
  final double targetWeight;
  final double weightGainPerWeek;
  final String gender;

  const CalculationResultScreen({
    super.key,
    required this.weight,
    required this.height,
    required this.age,
    required this.targetWeight,
    required this.weightGainPerWeek,
    required this.gender,
  });

  // 🔥 คำนวณแคลอรี่ที่ต้องใช้ต่อวัน
  double calculateCalories() {
    if (gender == "Male") {
      return (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      return (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }
  }

  // 📅 คำนวณจำนวนวันที่เหลือ
  int calculateDaysLeft() {
    double weightDifference = (targetWeight - weight).abs();
    return (weightGainPerWeek != 0) ? (weightDifference / weightGainPerWeek).round() : 0;
  }

  @override
  Widget build(BuildContext context) {
    double dailyCalories = calculateCalories();
    int daysLeft = calculateDaysLeft();

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

              const SizedBox(height: 20),

              // 📌 กล่องแสดงผลลัพธ์
              Expanded(
                child: Center(
                  child: Card(
                    margin: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            "Your Calculation Result",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            "Daily Calories Needed: ${dailyCalories.toStringAsFixed(0)} kcal",
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            "Time to reach goal: $daysLeft days",
                            style: const TextStyle(fontSize: 18),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => const DashboardScreen()),
                              );
                            },
                            child: const Text("Start", style: TextStyle(fontSize: 16, color: Colors.white)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // 🔵 จุดแสดงตำแหน่ง (อยู่ที่จุดสี่)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  4, // จำนวนจุดทั้งหมด (เช่น 4 หน้าต่อกัน)
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: index == 3 ? Colors.blueAccent : Colors.grey, // จุดที่ 4 (index = 3) ถูกเลือก
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
}
