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
  final List<String> goals = ["Very fast", "Fast", "Normal", "Gradual"];
  int? selectedGoalIndex;

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
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Select Your Goal",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white),
                ),
                const SizedBox(height: 20),
                ToggleButtons(
                  borderRadius: BorderRadius.circular(10),
                  selectedColor: Colors.white,
                  fillColor: Colors.blueAccent,
                  color: Colors.blue,
                  isSelected: List.generate(goals.length, (index) => index == selectedGoalIndex),
                  onPressed: (index) {
                    setState(() {
                      selectedGoalIndex = index;
                    });
                  },
                  children: goals.map((goal) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Text(goal, style: const TextStyle(fontSize: 16)),
                    );
                  }).toList(),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedGoalIndex != null ? Colors.blue : Colors.grey,
                    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
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
                  child: const Text("View calculation results", style: TextStyle(fontSize: 16, color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
