import 'package:flutter/material.dart';
//import 'package:syncfusion_flutter_calendar/calendar.dart';
//import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';
import 'package:time_table_manager/events/event.dart';
import 'utils.dart';
import 'event.dart';
import 'event_provider.dart';

class EventEditingPage extends StatefulWidget {
  const EventEditingPage({Key? key, this.event}) : super(key: key);
  final Event? event;

  @override
  State<EventEditingPage> createState() => _EventEditingPageState();
}

class _EventEditingPageState extends State<EventEditingPage> {
  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  late DateTime fromDate;
  late DateTime toDate;

  @override
  void initState() {
    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(const Duration(hours: 2));
    } else {
      final event = widget.event!;

      titleController.text = event.title;
      fromDate = event.from;
      toDate = event.to;
    }
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buildEditingActions() => [
          ElevatedButton.icon(
            onPressed: saveForm,
            icon: const Icon(Icons.done_rounded),
            label: const Text('Save'),
          )
        ];
    Widget buildDateTimePickers() => Column(
          children: [
            buildFrom(),
            buildTo(),
          ],
        );
    Widget buildTitle() => TextFormField(
          style: const TextStyle(fontSize: 24),
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            hintText: 'Add title',
          ),
          onFieldSubmitted: (_) => saveForm(),
          validator: (title) =>
              title != null && title.isEmpty ? 'Title cannot be empty' : null,
          controller: titleController,
        );
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar:
          AppBar(
             backgroundColor: Colors.brown[200],
             foregroundColor: Colors.brown,
            leading: const CloseButton(), actions: buildEditingActions()),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildTitle(),
              const SizedBox(height: 12),
              buildDateTimePickers(),
            ],
          ),
        ),
      ),
    );
  }

  buildFrom() => buildHeader(
      header: 'From',
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: buildDropDownField(
              text: Utils.toDate(fromDate),
              onClicked: () => pickFromDateTime(pickDate: true),
            ),
          ),
          Expanded(
              child: buildDropDownField(
            text: Utils.toTime(fromDate),
            onClicked: () => pickFromDateTime(pickDate: false),
          ))
        ],
      ));

  buildDropDownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: const Icon(Icons.arrow_drop_down_rounded),
        onTap: onClicked,
      );

  buildHeader({
    required String header,
    required Widget child,
  }) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          header,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        child,
      ]);

  buildTo() => buildHeader(
      header: 'To',
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: buildDropDownField(
                text: Utils.toDate(toDate),
                onClicked: () => pickToDateTime(pickDate: true),
              )),
          Expanded(
              child: buildDropDownField(
                  text: Utils.toTime(toDate),
                  onClicked: () => pickToDateTime(pickDate: false)))
        ],
      ));

  /*pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
  }*/
  Future pickFromDateTime({required bool pickDate}) async {
    final date = await pickDateTime(fromDate, pickDate: pickDate);
    if (date == null) return;

    if (date.isAfter(toDate)) {
      toDate =
          DateTime(date.year, date.month, date.day, toDate.hour, toDate.minute);
    }

    setState(() => fromDate = date);
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: firstDate ?? DateTime(2021, 8),
          lastDate: DateTime(2101));

      if (date == null) return null;

      final time =
          Duration(hours: initialDate.hour, minutes: initialDate.minute);

      return date.add(time);
    } else {
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(initialDate),
      );

      if (timeOfDay == null) return null;

      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);

      return date.add(time);
    }
  }

  Future pickToDateTime({required bool pickDate}) async {
    final date = await pickDateTime(
      toDate,
      pickDate: pickDate,
      firstDate: pickDate ? fromDate : null,
    );
    if (date == null) return;

    setState(() => toDate = date);
  }

  Future saveForm() async {
    final isValid = _formKey.currentState!.validate();

    if (isValid) {
      final event = Event(
        title: titleController.text,
        description: 'Description',
        from: fromDate,
        to: toDate,
        isAllDay: false,
      );

      final isEditing = widget.event != null;
      final provider = Provider.of<EventProvider>(context, listen: false);

      if (isEditing) {
        provider.editEvent(event, widget.event!);
        Navigator.of(context).pop();
      } else {
        provider.addEvent(event);
        Navigator.of(context).pop();
      }
    }
  }
}

/*class EventProvider extends ChangeNotifier {
  final List<Event> _events = [];

  List<Event> get events => _events;

  DateTime _selectedDate = DateTime.now();
  DateTime get selectedDate => _selectedDate;
  void setDate(DateTime date) => _selectedDate = date;
  List<Event> get eventsOfSelectedDate => _events;
  void addEvent(Event event) {
    _events.add(event);
    notifyListeners();
  }

  void editEvent(Event newEvent, Event oldEvent) {
    final index = _events.indexOf(oldEvent);
  }
}*/
