import 'package:flutter/material.dart';

class UserInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFDF3DC),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile Section
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Color(0xFF6C82F5),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/image/profile.png'), // Replace with actual image
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Name",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      SizedBox(width: 5),
                      Icon(Icons.edit, size: 18, color: Colors.white)
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
                physics: NeverScrollableScrollPhysics(),
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
                  Text("Progression", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  Container(
                    height: 80,
                    width: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Color(0xFF6C82F5), width: 5),
                    ),
                    child: Center(
                      child: Text("0%", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Color(0xFF6C82F5))),
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
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(value, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF6C82F5))),
            SizedBox(height: 5),
            Text(label, style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500)),
          ],
        ),
      ),
    );
  }

  Widget _nutritionCard(String title1, String title2, String title3, [String? title4]) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title1, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Divider(),
            Text(title2, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Divider(),
            Text(title3, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            if (title4 != null) ...[
              Divider(),
              Text(title4, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            ]
          ],
        ),
      ),
    );
  }
}
