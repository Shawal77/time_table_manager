import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'calender.dart';
import 'package:time_table_manager/events/event_provider.dart';
import 'package:provider/provider.dart';
import 'package:time_table_manager/events/event_viewing.dart';

class RoutinePage extends StatelessWidget {
  const RoutinePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<EventProvider>(context);
    final selectedEvents = provider.eventsOfSelectedDate;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(10, 255, 255, 255),
        title: const Text('Routine'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
      ),
      body: SfCalendar(
        onTap: (details) {
          if (details.appointments == null) return;
          final event = details.appointments!.first;
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => EventViewingPage(event: event),
          ));},
        dataSource: EventDataSource(provider.events),
        view: CalendarView.day,
        initialDisplayDate: DateTime.now(),
    )
    );
  }
}