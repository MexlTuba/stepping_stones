// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:stepping_stones/models/patients.dart';

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
                    'Care giver notes:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Text(
                    patient.notes,
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Icon(Icons.list),
                  title: Text('To-do list'),
                ),
                ListTile(
                  leading: Icon(Icons.health_and_safety),
                  title: Text('View health record'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
