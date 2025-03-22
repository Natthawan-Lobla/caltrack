import 'package:flutter/material.dart';

class ProfilesScreen extends StatelessWidget {
  const ProfilesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7E6),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(
                color: Color(0xFF7288E5),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  // ปุ่มย้อนกลับด้านซ้ายบน
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                  
                  const CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/profile.png'), // Replace with actual image
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Name",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.edit, size: 18, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),

            // Weight, BMI, Height, BMR Section
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                crossAxisCount: 2,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  _infoCard("0", "Weight"),
                  _infoCard("0", "BMI"),
                  _infoCard("0", "Height"),
                  _infoCard("0", "BMR"),
                ],
              ),
            ),
            
            // Progress Circle
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                children: [
                  const Text("Progression", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Color(0xFF7288E5))),
                  const SizedBox(height: 10),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: const Color(0xFF7288E5), width: 5),
                    ),
                    child: const Center(
                      child: Text("0%", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF7288E5))),
                    ),
                  ),
                ],
              ),
            ),

            // Nutrition & Meal Info
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _nutritionCard("Protein", "Carbohydrate", "Fat"),
                  _nutritionCard("Breakfast", "Lunch", "Dinner", "Snack"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String value, String label) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF7288E5))),
            const SizedBox(height: 5),
            Text(label, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _nutritionCard(String title1, String title2, String title3, [String? title4]) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title1, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF7288E5))),
            const Divider(),
            Text(title2, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF7288E5))),
            const Divider(),
            Text(title3, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF7288E5))),
            if (title4 != null) ...[
              const Divider(),
              Text(title4, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF7288E5))),
            ]
          ],
        ),
      ),
    );
  }
}
