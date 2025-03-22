import 'package:flutter/material.dart';
import 'goal_selection.dart';

class UserInfoScreen extends StatelessWidget {
  const UserInfoScreen({super.key});

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
              "To calculate the calories for you",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
            const SizedBox(height: 20),
            _inputCard(),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const GoalSelectionScreen()),
                );
              },
              child: const Text("Next"),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputCard() {
    return Card(
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: const [
            _InfoInputField(label: "Age", suffix: "Year"),
            _InfoInputField(label: "Height", suffix: "Cm"),
            _InfoInputField(label: "Weight", suffix: "Kg"),
            _InfoInputField(label: "Target weight", suffix: "Kg"),
          ],
        ),
      ),
    );
  }
}

class _InfoInputField extends StatelessWidget {
  final String label;
  final String suffix;
  const _InfoInputField({required this.label, required this.suffix});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        suffixText: suffix,
      ),
      keyboardType: TextInputType.number,
    );
  }
}
