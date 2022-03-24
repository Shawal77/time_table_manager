import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';
import 'package:time_table_manager/event.dart';
import 'package:basic_utils/basic_utils.dart';
import 'utils.dart';

class EventEditingPage extends StatefulWidget {
  const EventEditingPage({Key? key, this.event}) : super(key: key);
  final Event? event;

  /*const EventEditingPage({
    Key? key,
    this.event,
  }) : super(key: key);*/

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
            onPressed: () {},
            icon: const Icon(Icons.done_rounded),
            label: const Text('Save'),
          )
        ];
    Widget buildDateTimePickers() => Column(
          children: [
            buildFrom(),
          ],
        );
    Widget buildTitle() => TextFormField(
          style: const TextStyle(fontSize: 24),
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            hintText: 'Add title',
          ),
          onFieldSubmitted: (_) {},
          validator: (title) =>
              title != null && title.isEmpty ? 'Title cannot be empty' : null,
          controller: titleController,
        );
    return Scaffold(
      appBar:
          AppBar(leading: const CloseButton(), actions: buildEditingActions()),
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

  buildFrom() => Row(
        children: [
          Expanded(
            flex: 2,
            child: buildDropDownField(
              text: Utils.toDate(fromDate),
              onClicked: () {},
          )), 
          Expanded(
            child: buildDropDownField(
              text: Utils.toTime(fromDate),
              onClicked: () {},
          ))
        ],
      );

  buildDropDownField({
    required String text,
    required VoidCallback onClicked,
  }) =>
      ListTile(
        title: Text(text),
        trailing: Icon(Icons.arrow_drop_down_rounded),
        onTap: onClicked,
      );
      
}
