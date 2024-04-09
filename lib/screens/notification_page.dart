import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Patient Notifications',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NotificationsPage(),
    );
  }
}

class NotificationsPage extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      'title': 'Appointment Reminder',
      'body': 'Patient A has an appointment on April 12 at 10:00 AM.',
    },
    {
      'title': 'Medication Refill',
      'body': 'Patient B needs a refill of medication by April 15.',
    },
    {
      'title': 'New Message from Doctor',
      'body': 'Patient C received a new message from Dr. Smith.',
    },
    {
      'title': 'Lab Results Ready',
      'body': 'Patient D’s lab results are now available for review.',
    },
    {
      'title': 'Follow-up Reminder',
      'body': 'Patient E needs to schedule a follow-up appointment.',
    },
    {
      'title': 'Insurance Update Required',
      'body': 'Patient F’s insurance information needs updating.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset('assets/icons/notificationUnselected.png', fit: BoxFit.cover),
              ),
              title: Text(notifications[index]['title']),
              subtitle: Text(notifications[index]['body']),
              trailing: Icon(Icons.more_vert),
            ),
          );
        },
      ),
    );
  }
}
