import 'package:caltrack/categories_screen.dart';
import 'package:caltrack/note_screen.dart';
import 'package:flutter/material.dart';


class CourseScreen extends StatelessWidget {
  const CourseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('Breakfast'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Search Bar
            TextField(
              decoration: InputDecoration(
                hintText: 'Search by name',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
            ),
            SizedBox(height: 16.0),
 
           // Categories Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Categories Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CategoriesScreen()),
                  );
                },
                child: CategoryCard(icon: Icons.category, label: 'Categories'),
              ),

              // Notes Button
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const NotesScreen()),
                  );
                },
                child: CategoryCard(icon: Icons.note, label: 'Notes'),
              ),

              // Meals Button (ยังไม่กำหนดการนำทาง)
              CategoryCard(icon: Icons.restaurant, label: 'Meals'),
            ],
            ),
            SizedBox(height: 16.0),

            // Latest Menu Section
            Container(
              padding: EdgeInsets.all(8.0),
              color: Colors.grey[200],
              child: Row(
                children: [
                  Text('Latest menu', style: TextStyle(color: Colors.grey[700])),
                ],
              ),
            ),
            SizedBox(height: 8.0),
 
            // Menu Items List
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  return MenuItem(
                    name: 'Fried rice',
                    calories: '0 % of your daily calories',
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
 
class CategoryCard extends StatelessWidget {
  final IconData icon;
  final String label;
 
  const CategoryCard({super.key, required this.icon, required this.label});
 
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Icon(icon, size: 40.0),
        ),
        SizedBox(height: 8.0),
        Text(label, style: TextStyle(fontSize: 12.0)),
      ],
    );
  }
}
 
class MenuItem extends StatelessWidget {
  final String name;
  final String calories;
 
  const MenuItem({super.key, required this.name, required this.calories});
 
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey[300]!),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.fastfood, size: 20.0),
              SizedBox(width: 8.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: TextStyle(fontSize: 14.0)),
                  Text(calories, style: TextStyle(fontSize: 12.0, color: Colors.grey)),
                ],
              ),
            ],
          ),
          Text('kcal', style: TextStyle(fontSize: 14.0)),
        ],
      ),
    );
  }
}