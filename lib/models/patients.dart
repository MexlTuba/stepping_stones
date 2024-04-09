class Patient {
  final String patientImage;
  final String fname;
  final String lname;
  final String disease;
  final String hospital;
  String notes;

  Patient({
    required this.patientImage,
    required this.fname,
    required this.lname,
    required this.disease,
    required this.hospital,
    required this.notes,
  });
}

var patientList = [
  Patient(
      patientImage: 'assets/images/patient1.jpg',
      fname: 'Noraa',
      lname: 'Ojenroc',
      disease: 'COVID-19',
      hospital: 'Chong Hua Hospital',
      notes:
          'This patient is exhibiting extreme symptoms of coronavirus, recovery is not looking well.'),
  Patient(
      patientImage: 'assets/images/patient2.jpg',
      fname: 'Liam',
      lname: 'Smith',
      disease: 'Asthma',
      hospital: 'St. Luke\'s Medical Center',
      notes:
          'Patient requires regular nebulization and monitoring of respiratory function.'),
  Patient(
      patientImage: 'assets/images/patient3.jpg',
      fname: 'Olivia',
      lname: 'Johnson',
      disease: 'Hypertension',
      hospital: 'Mount Sinai Hospital',
      notes:
          'Blood pressure management is critical, diet and medication adherence must be monitored.'),
  Patient(
      patientImage: 'assets/images/patient4.jpg',
      fname: 'Noah',
      lname: 'Williams',
      disease: 'Diabetes',
      hospital: 'Cleveland Clinic',
      notes:
          'Patient needs insulin therapy adjustment and frequent blood sugar checks.'),
  Patient(
      patientImage: 'assets/images/patient5.jpg',
      fname: 'Emma',
      lname: 'Brown',
      disease: 'Osteoporosis',
      hospital: 'Mayo Clinic',
      notes:
          'Risk of fractures is high; falls prevention strategy is necessary.'),
  Patient(
      patientImage: 'assets/images/patient6.jpg',
      fname: 'Ava',
      lname: 'Jones',
      disease: 'Anemia',
      hospital: 'Johns Hopkins Hospital',
      notes:
          'Patient is on iron supplements, progress towards normal levels needs to be tracked.'),
];
