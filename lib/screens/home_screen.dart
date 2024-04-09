import 'package:flutter/material.dart';
import 'package:stepping_stones/models/patients.dart';

class HomeScreen extends StatelessWidget {
  final List<Patient> patientList;
  const HomeScreen({
    super.key,
    required this.patientList,
  });

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/images/backgroundImg.png',
              width: screenWidth,
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: <Widget>[
              Container(
                  width: double.infinity,
                  height: 66,
                  decoration: BoxDecoration(
                    color: Color(0xFF3DCCC7),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: Column(children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 20, 4, 19),
                          child: Image.asset(
                            'assets/images/appbarIcon.png',
                            width: 28,
                          ),
                        ),
                        Text(
                          'Stepping',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 4),
                        Text(
                          'Stones',
                          style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                  ])),
              SizedBox(
                height: 157,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(5),
                    hintText: 'Search patient',
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              //end of search
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Text(
                          'Patients in your care',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Color(0xFF484C52)),
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
                            itemCount: patientList.length,
                            itemBuilder: (context, index) {
                              final patient = patientList[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    leading:
                                        Icon(Icons.account_circle, size: 50),
                                    title: Text(
                                        patient.fname + ' ' + patient.lname),
                                    subtitle: Text(patient.disease +
                                        '  ·  ' +
                                        patient.hospital),
                                    trailing: ElevatedButton(
                                      onPressed: () {},
                                      child: Text(
                                        'View',
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      style: ElevatedButton.styleFrom(
                                        foregroundColor: Colors.white,
                                        backgroundColor: Color(0xFF3DCCC7),
                                        elevation: 0,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 1),
                                        textStyle: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}