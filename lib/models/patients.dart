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
      patientImage: 'assets/images/patient1.png',
      fname: 'Noraa',
      lname: 'Ojenroc',
      disease: 'COVID-19',
      hospital: 'Chong Hua Hospital',
      notes:
          'This patient is exhibiting extreme symptoms of coronavirus, recovery is not looking well.'),
  Patient(
      patientImage: 'assets/images/patient2.png',
      fname: 'Liam',
      lname: 'Smith',
      disease: 'Asthma',
      hospital: 'St. Luke\'s Medical Center',
      notes:
          'Patient requires regular nebulization and monitoring of respiratory function.'),
  Patient(
      patientImage: 'assets/images/patient3.png',
      fname: 'Olivia',
      lname: 'Johnson',
      disease: 'Hypertension',
      hospital: 'Mount Sinai Hospital',
      notes:
          'Blood pressure management is critical, diet and medication adherence must be monitored.'),
  Patient(
      patientImage: 'assets/images/patient4.png',
      fname: 'Noah',
      lname: 'Williams',
      disease: 'Diabetes',
      hospital: 'Cleveland Clinic',
      notes:
          'Patient needs insulin therapy adjustment and frequent blood sugar checks.'),
  Patient(
      patientImage: 'assets/images/patient5.png',
      fname: 'Emma',
      lname: 'Brown',
      disease: 'Osteoporosis',
      hospital: 'Mayo Clinic',
      notes:
          'Risk of fractures is high; falls prevention strategy is necessary.'),
  Patient(
      patientImage: 'assets/images/patient6.png',
      fname: 'Ava',
      lname: 'Jones',
      disease: 'Anemia',
      hospital: 'Johns Hopkins Hospital',
      notes:
          'Patient is on iron supplements, progress towards normal levels needs to be tracked.'),
  Patient(
      patientImage: 'assets/images/patient7.png',
      fname: 'Sophia',
      lname: 'Garcia',
      disease: 'Thyroid issues',
      hospital: 'Massachusetts General Hospital',
      notes:
          'Thyroid hormone levels must be regularly checked and medications adjusted accordingly.'),
  Patient(
      patientImage: 'assets/images/patient8.png',
      fname: 'Isabella',
      lname: 'Martinez',
      disease: 'Arthritis',
      hospital: 'UCSF Medical Center',
      notes:
          'Joint inflammation management and pain relief are the primary concerns.'),
  Patient(
      patientImage: 'assets/images/patient9.png',
      fname: 'Mia',
      lname: 'Rodriguez',
      disease: 'Chronic kidney disease',
      hospital: 'New York-Presbyterian University Hospital',
      notes:
          'Regular dialysis required, monitoring for potential complications.'),
  Patient(
      patientImage: 'assets/images/patient10.png',
      fname: 'Elijah',
      lname: 'Wilson',
      disease: 'Cardiomyopathy',
      hospital: 'Cedars-Sinai Medical Center',
      notes:
          'Heart function is impaired, consider eligibility for transplant.'),
];
