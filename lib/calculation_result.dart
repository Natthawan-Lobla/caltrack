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

  double calculateCalories() {
    if (gender == "Male") {
      return (10 * weight) + (6.25 * height) - (5 * age) + 5;
    } else {
      return (10 * weight) + (6.25 * height) - (5 * age) - 161;
    }
  }

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
    );
  }
}
