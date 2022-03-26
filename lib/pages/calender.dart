import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:time_table_manager/events/event_viewing.dart';
//import 'package:time_table_manager/sorry.dart';
import '../events/edit.dart';
import 'package:time_table_manager/events/event.dart';
import 'package:time_table_manager/events/event_provider.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(10, 255, 255, 255),
        title: const Text('Calendar'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
        ),
      ),
      body: SfCalendar(
        view: CalendarView.month,
        initialDisplayDate: DateTime.now(),
        dataSource: EventDataSource(events),
        onLongPress: (details) {
          final provider = Provider.of<EventProvider>(context, listen: false);
          provider.setDate(details.date!);
          showModalBottomSheet(
            context: context,
            builder: (context) => const TasksWidget(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(
          Icons.add,
          color: Colors.blueAccent,
        ),
        backgroundColor: Colors.red,
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => const EventEditingPage()),
        ),
      ),
    );
  }
}

class EventDataSource extends CalendarDataSource {
  EventDataSource(List<Event> appointments) {
    this.appointments = appointments;
  }
  Event getEvent(int index) => appointments![index] as Event;
  @override
  DateTime getStartTime(int index) => getEvent(index).from;
  @override
  DateTime getEndTime(int index) => getEvent(index).to;
  @override
  String getSubject(int index) => getEvent(index).title;
  @override
  Color getColor(int index) => getEvent(index).backgroundcolor;
  @override
  bool isAllDay(int index) => getEvent(index).isAllDay;
}

class TasksWidget extends StatefulWidget {
  const TasksWidget({Key? key}) : super(key: key);

  @override
  State<TasksWidget> createState() => _TasksWidgetState();
}

class _TasksWidgetState extends State<TasksWidget> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOfSelectedDate;

    if (selectedEvents.isEmpty) {
      //since this list has all events for all days,
      return const Center(
        child: Text(
          'No Events found', //this will only work once you havent any task before otherwise its useless
          style: TextStyle(color: Colors.purpleAccent, fontSize: 24),
        ),
      );
    } else {
      return SfCalendar(
        onTap: (details) {
          if (details.appointments == null) return;
          final event = details.appointments!.first;
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EventViewingPage(event: event),
          ));
        },
        view: CalendarView.day,
        dataSource: EventDataSource(provider.events),
        initialDisplayDate: provider.selectedDate,
        appointmentBuilder: appointmentBuilder,
        headerHeight: 0,
        todayHighlightColor: Colors.green,
        selectionDecoration: BoxDecoration(color: Colors.pink[30]),
      );
    }
  }

  Widget appointmentBuilder(
    BuildContext context,
    CalendarAppointmentDetails details,
  ) {
    final event = details.appointments.first;

    return Container(
      width: details.bounds.width,
      height: details.bounds.height,
      decoration: BoxDecoration(
        color: Colors.purpleAccent.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        event.title,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}

