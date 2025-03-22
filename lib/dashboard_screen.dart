import 'package:caltrack/course_screen.dart';
import 'package:caltrack/profiles_screen.dart';
import 'package:caltrack/welcome_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: screenWidth,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Color(0xFFFDF1DC)],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "CalTrack",
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      IconButton(
                        icon: const Icon(Icons.calendar_today, color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),

                // วงล้อเมนูอาหาร
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const CourseScreen()),
                    );
                  },
                  child: Image.asset(
                    "assets/images/foodwheel.png",
                    width: screenWidth * 0.9,
                    fit: BoxFit.contain,
                  ),
                ),

                // กล่องข้อมูลน้ำหนัก & แคลอรี่
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    width: screenWidth * 0.95,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
                      ],
                    ),
                    child: Column(
                      children: [
                        // น้ำหนักปัจจุบัน
                        const Text(
                          "00 / 0 Kg.",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),

                        // ปุ่ม Record weight
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                          onPressed: () {},
                          child: const Text("Record weight"),
                        ),

                        // เส้นคั่นเพื่อแยกข้อมูล
                        const Divider(thickness: 1, color: Colors.grey),

                        // ข้อมูล Calories
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text("Calories received from food", textAlign: TextAlign.center),
                            Text(
                              "+0000 kcal",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: 10),
                            Text("Burned from exercise", textAlign: TextAlign.center),
                            Text(
                              "+0000 kcal",
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        const Divider(thickness: 1, color: Colors.grey),
                        const SizedBox(height: 10),

                        // Progress Bar & BMI
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("0% Progress"),
                            Text("BMI 0.0"),
                            Text("0 BMR"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                // Progress Bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    width: screenWidth * 0.9,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text("Another 0 Days to go"),
                        const SizedBox(height: 5),
                        LinearProgressIndicator(
                          value: 0.5,
                          backgroundColor: Colors.grey[300],
                          color: Colors.blue,
                          minHeight: 10,
                        ),
                      ],
                    ),
                  ),
                ),

                // กราฟแคลอรี่
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Container(
                    width: screenWidth * 0.9,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 5, spreadRadius: 2),
                      ],
                    ),
                    child: Column(
                      children: [
                        const Text("Amount of calories received per day"),
                        const SizedBox(height: 10),
                        Image.asset(
                          "assets/images/chart.png",
                          width: screenWidth * 0.8,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        onTap: (index) {
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilesScreen()),
            );
          }
          if (index == 1) {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const WelcomeScreen()),
              (route) => false,
            );
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          BottomNavigationBarItem(icon: Icon(Icons.exit_to_app), label: "Exit"),
        ],
      ),
    );
  }
}
