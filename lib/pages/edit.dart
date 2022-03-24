import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:provider/provider.dart';
import 'package:time_table_manager/event.dart';

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
  late DateTime fromDate;
  late DateTime toDate;

  @override
  void initState() {
    super.initState();

    if (widget.event == null) {
      fromDate = DateTime.now();
      toDate = DateTime.now().add(Duration(hours: 2));
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> buildEditingActions() => [
          ElevatedButton.icon(
            onPressed: () {},
            icon: Icon(Icons.done_rounded),
            label: Text('Save'),
          )
        ];
    Widget buildTitle() => TextFormField(
          style: TextStyle(fontSize: 24),
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            hintText: 'Add title',
          ),
          onFieldSubmitted: (_) {},
          controller: titleController,
        );
    return Scaffold(
      appBar: AppBar(leading: CloseButton(), actions: buildEditingActions()),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildTitle(),
            ],
          ),
        ),
      ),
    );
  }
}
