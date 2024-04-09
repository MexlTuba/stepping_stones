
import 'package:syncfusion_flutter_calendar/calendar.dart';

class AppointmentManager {
  static final List<Appointment> _appointments = [];

  static List<Appointment> get appointments => _appointments;

  static void addAppointment(Appointment appointment) {
    _appointments.add(appointment);
  }
}
