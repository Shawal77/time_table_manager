import 'package:flutter/material.dart';
import 'package:time_table_manager/pages/home.dart';

class Sorry extends StatelessWidget {
  const Sorry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(10, 255, 255, 255),
        /*leading: IconButton(
          onPressed:() => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HomePage())),
          icon: const Icon(Icons.exit_to_app)),*/
        title: const Text('Sorry'),
      ),
      
      body: const Text(
        "This feature hasn't been developed",
        style: TextStyle(fontSize: 40),),
      
       

    );
  }
}
