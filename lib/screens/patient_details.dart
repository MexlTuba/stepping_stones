// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:stepping_stones/models/patients.dart';
import 'package:stepping_stones/screens/health_record.dart';
import 'package:stepping_stones/screens/todo_list.dart';

class PatientDetailScreen extends StatelessWidget {
  const PatientDetailScreen({
    Key? key,
    required this.patient,
  }) : super(key: key);
  final Patient patient;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: 400,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(patient.patientImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Card(
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListTile(
                  title: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '${patient.fname} ${patient.lname}',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  subtitle: RichText(
                    text: TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: '${patient.disease}  ·  ${patient.hospital}',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Color(0xFFAAAAAA)),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Text(
                    'Patient Chart:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    ' · ' + patient.notes,
                  ),
                ),
                Divider(),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ToDoListScreen()),
                    );
                  },
                  child: ListTile(
                    leading: Icon(Icons.list),
                    title: Text('View Chart Details'),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.health_and_safety),
                  title: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HealthRecord()),
                        );
                      },
                      child: Text('View health record')),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
