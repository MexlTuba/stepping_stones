import 'package:flutter/material.dart';

class ToDoListScreen extends StatelessWidget {
  final List<Map<String, dynamic>> tasks = [
    {
      'title': 'Check on Patient Vitals',
      'description': 'Ensure medication was taken after breakfast.',
      'completed': true,
    },
    {
      'title': 'Update Health Records',
      'description': 'Record the latest vitals for all morning patients.',
      'completed': false,
    },
    {
      'title': 'Physical Therapy Session',
      'description': 'Assist Patient B with scheduled exercises.',
      'completed': false,
    },
    {
      'title': 'Nutrition Plan Review',
      'description': 'Discuss dietary preferences with Patient C.',
      'completed': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Patient Chart Details'),
        backgroundColor: Color(0xFF3DCCC7), // Custom teal color
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          var task = tasks[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              tileColor: Colors.white,
              leading: Checkbox(
                value: task['completed'],
                onChanged: null, // This makes the checkbox display-only
                activeColor: Color(0xFF3DCCC7),
              ),
              title: Text(
                task['title'],
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              subtitle: Text(task['description']),
              isThreeLine: true,
            ),
          );
        },
      ),
    );
  }
}
