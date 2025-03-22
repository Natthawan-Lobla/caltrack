import 'package:flutter/material.dart';

class NotesScreen extends StatelessWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Color(0xFFFDF1DC)], // ปรับสีให้เหมือนดีไซน์
          ),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meal Planner'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Breakfast',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ListTile(
                  title: Text('kcal'),
                ),
                ListTile(
                  title: Text('kcal'),
                ),
                ListTile(
                  title: Text('kcal'),
                ),
                ListTile(
                  title: Text('kcal'),
                ),
                Divider(),
                SizedBox(height: 16),
                Text(
                  'Lunch',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ListTile(
                  title: Text('kcal'),
                ),
                ListTile(
                  title: Text('kcal'),
                ),
                ListTile(
                  title: Text('kcal'),
                ),
                ListTile(
                  title: Text('kcal'),
                ),
                ListTile(
                  title: Text('kcal'),
                ),
                Divider(),
                SizedBox(height: 16),
                Text(
                  'Dinner',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                ListTile(
                  title: Text('kcal'),
                ),
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}