import 'package:flutter/material.dart';
import 'package:stepping_stones/models/patients.dart';
import 'dart:async';
import 'package:stepping_stones/screens/home_page.dart';
import 'package:stepping_stones/screens/patient_details.dart';

class HomeScreen extends StatefulWidget {
  final List<Patient> patientList;
  const HomeScreen({
    Key? key,
    required this.patientList,
  }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 1;
  List<Patient> _filteredPatients = [];
  String _searchText = "";
  final PageController _pageController = PageController();
  late Timer _timer;

  final List<String> _imageList = [
    'assets/images/backgroundImg.png',
    'assets/images/backgroundImg2.jpg',
    'assets/images/backgroundImg3.jpg',
    'assets/images/backgroundImg4.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _filteredPatients = widget.patientList;

    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      if (_pageController.hasClients) {
        int nextPage = _pageController.page!.toInt() + 1;
        if (nextPage >= _imageList.length) {
          nextPage = 0; // Loop back to first image.
        }
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 800),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _updateSearchResults(String text) {
    setState(() {
      _searchText = text;
      _filteredPatients = text.isEmpty
          ? widget.patientList
          : widget.patientList
              .where((patient) =>
                  patient.fname.toLowerCase().contains(text.toLowerCase()) ||
                  patient.lname.toLowerCase().contains(text.toLowerCase()))
              .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageController,
            itemCount: _imageList.length,
            itemBuilder: (context, index) => Image.asset(
              _imageList[index],
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
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
                  onChanged: _updateSearchResults,
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
                        // SizedBox(height: 20),
                        Expanded(
                          child: ListView.builder(
                            itemCount: _filteredPatients.length,
                            itemBuilder: (context, index) {
                              final patient = _filteredPatients[index];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: ListTile(
                                    leading: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image.asset(
                                        patient.patientImage,
                                        width: 60,
                                        height: 60,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    title: RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                '${patient.fname} ${patient.lname}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                    subtitle: RichText(
                                      text: TextSpan(
                                        children: <TextSpan>[
                                          TextSpan(
                                            text:
                                                '${patient.disease}  ·  ${patient.hospital}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 14,
                                                color: Color(0xFFAAAAAA)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    trailing: ElevatedButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PatientDetailScreen(
                                                    patient: patient,
                                                  )),
                                        );
                                      },
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
