import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get icon => null;

  @override
  Widget build(BuildContext context) {
    Widget buildPage(String text) => Center(
      child: Text(
        text,
        style: const TextStyle(fontSize: 28),
      ),
    );
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Time Manager',
        
        home: DefaultTabController(
          length: 4,
          child: Scaffold(
            appBar: AppBar(
              title: const Text(
                  'We will handle notifications \nand scheduling of your time.'),
              centerTitle: true,
              //backgroundColor: Colors.purple,
              flexibleSpace: Container(
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.red, Colors.blue])),
              ),
              bottom: const TabBar(
                isScrollable:true,
                tabs: [
                Tab(icon: Icon(Icons.home), text: 'Home'),
                Tab(icon: Icon(Icons.edit_rounded), text: 'Edit'),
                Tab(icon: Icon(Icons.view_day_rounded), text: 'Routine'),
                Tab(icon: Icon(Icons.view_timeline_rounded), text: 'Calender')
              ]),
              elevation: 20,
              actions: [
                IconButton(
                  icon: const Icon(Icons.notifications_none_rounded),
                  onPressed: () => {},
                ),
                IconButton(
                  icon: const Icon(Icons.add_alarm),
                  onPressed: () => {},
                ),
              ],
              leading: IconButton(
                  onPressed: (() => {}), icon: const Icon(Icons.list_rounded)),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(22)),
          ),
            ),
            body: TabBarView(children: [
              buildPage('Home Page'),
              buildPage('Edit Page'),
              buildPage('Routine Page'),
              buildPage('Calender Page')
            ]),
          ),
        ));
  }
  
}


