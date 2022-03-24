import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class RoutinePage extends StatelessWidget {
  const RoutinePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        view: CalendarView.timelineDay,
        )
    );
  }
}