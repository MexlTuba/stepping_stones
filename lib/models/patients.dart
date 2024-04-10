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
      disease: 'Stroke',
      hospital: 'Chong Hua Hospital',
      notes:
          'Patient Complaint: Sharp pain in right lower abdomen for the past 3 days, worsening with coughing and movement. \n\n · Problem List: Acute lower abdominal pain '),
  Patient(
      patientImage: 'assets/images/patient2.jpg',
      fname: 'Liam',
      lname: 'Smith',
      disease: 'Amputee',
      hospital: 'St. Luke\'s Medical Center',
      notes:
          'Patient requires regular nebulization and monitoring of respiratory function.'),
  Patient(
      patientImage: 'assets/images/patient3.jpg',
      fname: 'Olivia',
      lname: 'Johnson',
      disease: 'Spinal Injury',
      hospital: 'Mount Sinai Hospital',
      notes:
          'Blood pressure management is critical, diet and medication adherence must be monitored.'),
  Patient(
      patientImage: 'assets/images/patient4.jpg',
      fname: 'Noah',
      lname: 'Williams',
      disease: 'Brain Injury',
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
      disease: 'Arthritis',
      hospital: 'Johns Hopkins Hospital',
      notes:
          'Patient is on iron supplements, progress towards normal levels needs to be tracked.'),
];
