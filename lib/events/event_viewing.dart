import 'event_provider.dart';
import 'event.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EventViewingPage extends StatelessWidget {
  final Event event;
  const EventViewingPage({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const CloseButton(),
        ),
        body: ListView(
          padding: const EdgeInsets.all(12),
          children: <Widget>[
            buildDateTime(event),
            const SizedBox(height: 32),
            Text(event.title,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber)),
            const SizedBox(height: 24),
            Text(event.description,
                style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber)),
          ],
        ));
  }

  Widget buildDateTime(Event event) {
    return Column(
      children: [
        buildDate(event.isAllDay ? 'All-day' : 'From', event.from),
        if (!event.isAllDay) buildDate('To', event.to)
      ],
    );
  }

  Widget buildDate(String title, DateTime date) {
    return Text('${title} ${date}');
  }

  Widget buildViewingActions(BuildContext context, Event event) {
    IconButton(
      icon: const Icon(Icons.edit),
      onPressed: () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => EventViewingPage(event: event)),
      ),
    );
    IconButton(
        onPressed: () {
          final provider = Provider.of<EventProvider>(context, listen: false);

          provider.deleteEvent(event);
        },
        icon: const Icon(Icons.delete));
    throw '';
  }
}
