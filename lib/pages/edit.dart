import 'package:flutter/material.dart';

class EditPage extends StatelessWidget {
  const EditPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(10, 255, 255, 255),
        title: const Text('Edit'),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
      ),
      body: null,
    );
  }
}