import 'package:flutter/material.dart';
import 'calculation_result.dart';

class GoalSelectionScreen extends StatefulWidget {
  final double weight;
  final double height;
  final int age;
  final double targetWeight;
  final double weightGainPerWeek;
  final String gender;

  const GoalSelectionScreen({
    super.key,
    required this.weight,
    required this.height,
    required this.age,
    required this.targetWeight,
    required this.weightGainPerWeek,
    required this.gender,
  });

  @override
  State<GoalSelectionScreen> createState() => _GoalSelectionScreenState();
}

class _GoalSelectionScreenState extends State<GoalSelectionScreen> {
  int? selectedGoalIndex;

  final List<Map<String, String>> goals = [
    {"title": "Very fast", "description": "Weight gain 1 kg per week."},
    {"title": "Fast", "description": "Weight gain 0.5 kg per week."},
    {"title": "Normal type (recommended)", "description": "Weight gain 0.33 kg per week."},
    {"title": "Gradually", "description": "Weight gain 0.25 kg per week."},
  ];

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
              // ปุ่มย้อนกลับ
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
              // หัวข้อ
              const Text(
                "Results that you want each week",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
              ),
              const SizedBox(height: 20),
              // รายการตัวเลือก
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  itemCount: goals.length,
                  itemBuilder: (context, index) {
                    bool isSelected = index == selectedGoalIndex;
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedGoalIndex = index;
                        });
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 8),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.blueAccent : Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              goals[index]["title"]!,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? Colors.white : Colors.black,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              goals[index]["description"]!,
                              style: TextStyle(
                                fontSize: 14,
                                color: isSelected ? Colors.white70 : Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              // จุดบอกตำแหน่ง
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  goals.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 20),
                    width: 8,
                    height: 8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selectedGoalIndex == index ? Colors.blueAccent : Colors.grey,
                    ),
                  ),
                ),
              ),
              // ปุ่ม "View calculation results"
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedGoalIndex != null ? Colors.blue : Colors.grey,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  ),
                  onPressed: selectedGoalIndex != null
                      ? () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CalculationResultScreen(
                                weight: widget.weight,
                                height: widget.height,
                                age: widget.age,
                                targetWeight: widget.targetWeight,
                                weightGainPerWeek: widget.weightGainPerWeek,
                                gender: widget.gender,
                              ),
                            ),
                          );
                        }
                      : null,
                  child: const Text(
                    "View calculation results",
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
