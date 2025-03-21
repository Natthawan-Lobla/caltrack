import 'package:flutter/material.dart';

class CalculationResultScreen extends StatelessWidget {
  const CalculationResultScreen({super.key});

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
              "Let's start counting calories to reach our goals!",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 20),
            _resultCard(),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {},
              child: const Text("Ready"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _resultCard() {
    return Card(
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("0000 kcal", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.blue)),
            Text("And you can reach your target weight within 0 days!"),
          ],
        ),
      ),
    );
  }
}
