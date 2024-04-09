import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

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
  int _selectedIndex = 1; 

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
        backgroundColor:
            const Color(0xFF3DCCC7), 
        child: Icon(Icons.add),
      ),
      body: SfCalendar(
        view: CalendarView.month,
        backgroundColor: Colors.white, 
        headerStyle: CalendarHeaderStyle(
          textAlign: TextAlign.center,
          textStyle: TextStyle(
              color: const Color(0xFF404345),
              fontWeight: FontWeight.bold), 
        ),
        todayHighlightColor: const Color(0xFF3DCCC7),
        
        selectionDecoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xFF3DCCC7), 
            width: 2.0, 
          ),
        ), 
        dataSource: MeetingDataSource(_appointments),
        onTap: _handleCalendarTap,
      ),
    );
  }

  void _showAddEventDialog() async {
    final newEvent = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white, 
        title: Text('Add Event',
            style: TextStyle(
                color: const Color(0xFF404345))), 
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
                            0xFF3DCCC7)), 
                  ),
                  labelStyle: TextStyle(
                      color: const Color(0xFF404345)), 
                ),
                cursorColor: const Color(0xFF3DCCC7), 
                style:
                    TextStyle(color: const Color(0xFF404345)), 
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _pickDateTime,
                style: ElevatedButton.styleFrom(
                  backgroundColor:
                      const Color(0xFF3DCCC7), 
                ),
                child: Text(
                  'Pick Date and Time',
                  style: TextStyle(
                      color: Colors.white), 
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
                    color: const Color(0xFF404345))), 
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
                style: TextStyle(color: Colors.white)), 
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFF3DCCC7), 
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
        backgroundColor: Colors.white, 
        title: Text('Event Details',
            style: TextStyle(
                color: const Color(0xFF404345))), 
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                  'Date: ${DateFormat('MMM dd, yyyy').format(appointment.startTime)}',
                  style: TextStyle(
                      color: const Color(0xFF404345))),
              Text(
                  'Time: ${DateFormat('hh:mm a').format(appointment.startTime)} - ${DateFormat('hh:mm a').format(appointment.endTime)}',
                  style: TextStyle(
                      color: const Color(0xFF404345))),
              SizedBox(height: 8),
              Text('Event: ${appointment.subject}',
                  style: TextStyle(
                      color: const Color(0xFF404345))),
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
                    color: const Color(0xFF404345))),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _appointments.remove(appointment);
              });
              Navigator.pop(context); 
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  const Color(0xFF3DCCC7), 
            ),
            child: Text('Delete',
                style: TextStyle(color: Colors.white)), 
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

