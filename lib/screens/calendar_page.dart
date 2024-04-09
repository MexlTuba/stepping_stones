import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:stepping_stones/widgets/bottom_navbar.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendar App',
      home: CalendarPage(),
    );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  int _selectedIndex = 1; // Default selected index for BottomNavBar

  List<Appointment> _appointments = [];
  Appointment? _selectedAppointment;
  TextEditingController _eventTitleController = TextEditingController();
  DateTime? _selectedDateTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calendar'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddEventDialog,
        tooltip: 'Add Event',
        foregroundColor: Colors.white, // Set FAB's foreground color to white
        backgroundColor:
            const Color(0xFF3DCCC7), // Set FAB's background color to 3DCCC7
        child: Icon(Icons.add),
      ),
      body: SfCalendar(
        view: CalendarView.month,
        backgroundColor: Colors.white, // Set calendar background color
        headerStyle: CalendarHeaderStyle(
          textAlign: TextAlign.center,
          textStyle: TextStyle(
              color: const Color(0xFF3DCCC7),
              fontWeight: FontWeight.bold), // Set month font color to white
        ),
        todayHighlightColor: const Color(0xFF3DCCC7),
        // Set color for today's cell
        selectionDecoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF3DCCC7), // Outline color
            width: 2.0, // Outline width
          ),
        ), // Set selection color
        dataSource: MeetingDataSource(_appointments),
        onTap: _handleCalendarTap,
      ),
      // bottomNavigationBar: BottomNavBar(
      //   selectedIndex: _selectedIndex,
      //   onItemTapped: (index) {
      //     setState(() {
      //       _selectedIndex = index;
      //     });
      //   },
      // ),
    );
  }

  void _showAddEventDialog() async {
    final newEvent = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white, // Set dialog background color to white
        title: Text('Add Event',
            style: TextStyle(
                color: const Color(0xFF404345))), // Set title text color
        content: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _eventTitleController,
                decoration: InputDecoration(
                  labelText: 'Event Title',
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                        color: const Color(
                            0xFF3DCCC7)), // Set underline color when focused
                  ),
                  labelStyle: TextStyle(
                      color: const Color(0xFF404345)), // Set label text color
                ),
                cursorColor: const Color(0xFF3DCCC7), // Set caret color
                style:
                    TextStyle(color: const Color(0xFF404345)), // Set text color
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _pickDateTime,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF3DCCC7), // Set button background color
                ),
                child: Text(
                  'Pick Date and Time',
                  style: TextStyle(
                      color: Colors.white), // Set button text color to white
                ),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(null);
            },
            child: Text('Cancel',
                style: TextStyle(
                    color: const Color(0xFF404345))), // Set button text color
          ),
          ElevatedButton(
            onPressed: () {
              final newAppointment = Appointment(
                startTime: _selectedDateTime!,
                endTime: _selectedDateTime!.add(Duration(hours: 1)),
                subject: _eventTitleController.text,
              );
              Navigator.of(context).pop(newAppointment);
            },
            child: Text('Save',
                style: TextStyle(color: Colors.white)), // Set button text color
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFF3DCCC7), // Set button background color
            ),
          ),
        ],
      ),
    );

    if (newEvent != null) {
      setState(() {
        _appointments.add(newEvent);
      });
    }
  }

  void _pickDateTime() async {
    final pickedDateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );

    if (pickedDateTime != null) {
      final pickedTime = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (pickedTime != null) {
        setState(() {
          _selectedDateTime = DateTime(
            pickedDateTime.year,
            pickedDateTime.month,
            pickedDateTime.day,
            pickedTime.hour,
            pickedTime.minute,
          );
        });
      }
    }
  }

  void _handleCalendarTap(CalendarTapDetails calendarTapDetails) {
    if (calendarTapDetails.targetElement == CalendarElement.calendarCell) {
      final tappedDate = calendarTapDetails.date!;
      final appointment = _appointments.firstWhere(
        (appointment) =>
            appointment.startTime.year == tappedDate.year &&
            appointment.startTime.month == tappedDate.month &&
            appointment.startTime.day == tappedDate.day,
        orElse: () => Appointment(
          startTime: tappedDate,
          endTime: tappedDate.add(Duration(hours: 1)),
          subject: 'No events',
        ),
      );

      setState(() {
        _selectedAppointment = appointment;
      });

      if (_selectedAppointment != null) {
        _showEventDetailsDialog(context, _selectedAppointment!);
      }
    }
  }

  void _showEventDetailsDialog(BuildContext context, Appointment appointment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white, // Set dialog background color to white
        title: Text('Event Details',
            style: TextStyle(
                color: const Color(0xFF404345))), // Set title text color
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'Date: ${DateFormat('MMM dd, yyyy').format(appointment.startTime)}',
                  style: TextStyle(
                      color: const Color(0xFF404345))), // Set text color
              Text(
                  'Time: ${DateFormat('hh:mm a').format(appointment.startTime)} - ${DateFormat('hh:mm a').format(appointment.endTime)}',
                  style: TextStyle(
                      color: const Color(0xFF404345))), // Set text color
              SizedBox(height: 8),
              Text('Event: ${appointment.subject}',
                  style: TextStyle(
                      color: const Color(0xFF404345))), // Set text color
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Close',
                style: TextStyle(
                    color: const Color(0xFF404345))), // Set button text color
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _appointments.remove(appointment);
              });
              Navigator.pop(context); // Close the dialog
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFF3DCCC7), // Set button background color
            ),
            child: Text('Delete',
                style: TextStyle(color: Colors.white)), // Set button text color
          ),
        ],
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<Appointment> appointments) {
    this.appointments = appointments;
  }
}

// class BottomNavBar extends StatelessWidget {
//   final int selectedIndex;
//   final Function(int) onItemTapped;

//   const BottomNavBar({
//     super.key,
//     required this.selectedIndex,
//     required this.onItemTapped,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final navBarIcons = <BottomNavigationBarItem>[
//       BottomNavigationBarItem(
//         icon: Center(
//           child: selectedIndex == 0
//               ? Image.asset('assets/icons/homeSelected.png', width: 24)
//               : Image.asset('assets/icons/homeUnselected.png', width: 24),
//         ),
//         label: '',
//       ),
//       BottomNavigationBarItem(
//         icon: Center(
//           child: selectedIndex == 1
//               ? Image.asset('assets/icons/calendarSelected.png', width: 24)
//               : Image.asset('assets/icons/calendarUnselected.png', width: 24),
//         ),
//         label: '',
//       ),
//       BottomNavigationBarItem(
//         icon: Center(
//           child: selectedIndex == 2
//               ? Image.asset('assets/icons/notificationSelected.png', width: 24)
//               : Image.asset('assets/icons/notificationUnselected.png', width: 24),
//         ),
//         label: '',
//       ),
//       BottomNavigationBarItem(
//         icon: Center(
//           child: selectedIndex == 3
//               ? Image.asset('assets/icons/userSelected.png', width: 24)
//               : Image.asset('assets/icons/userUnselected.png', width: 24),
//         ),
//         label: '',
//       ),
//     ];

//     return SizedBox(
//       height: 75,
//       child: BottomNavigationBar(
//         type: BottomNavigationBarType.fixed,
//         elevation: 1.5,
//         backgroundColor: const Color(0xFFFFFFFF),
//         items: navBarIcons,
//         currentIndex: selectedIndex,
//         onTap: onItemTapped,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//       ),
//     );
//   }
// }
