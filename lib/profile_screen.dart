import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Health Tracker'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                SizedBox(height: 8),
                Text('Weight', style: TextStyle(fontSize: 16)),
                Text('BMI', style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Text('Height', style: TextStyle(fontSize: 16)),
                Text('BMR', style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Text('Progression', style: TextStyle(fontSize: 16)),
                LinearProgressIndicator(value: 0.0),
                SizedBox(height: 16),
                Text('Protein', style: TextStyle(fontSize: 16)),
                Text('-', style: TextStyle(fontSize: 16)),
                Text('Carbohydrate', style: TextStyle(fontSize: 16)),
                Text('-', style: TextStyle(fontSize: 16)),
                Text('Fat', style: TextStyle(fontSize: 16)),
                Text('-', style: TextStyle(fontSize: 16)),
                SizedBox(height: 16),
                Text('Breakfast', style: TextStyle(fontSize: 16)),
                Text('-', style: TextStyle(fontSize: 16)),
                Text('Lunch', style: TextStyle(fontSize: 16)),
                Text('-', style: TextStyle(fontSize: 16)),
                Text('Dinner', style: TextStyle(fontSize: 16)),
                Text('-', style: TextStyle(fontSize: 16)),
                Text('Snack', style: TextStyle(fontSize: 16)),
                Text('-', style: TextStyle(fontSize: 16)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}