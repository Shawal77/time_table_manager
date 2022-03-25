import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'events/edit.dart';
import 'pages/calender.dart';
import 'pages/home.dart';
import 'pages/routine.dart';
import 'drawer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  get icon => null;

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: MaterialApp(
        themeMode: ThemeMode.light,
        darkTheme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Colors.black12,
          primaryColor: Colors.purple
        ),
        debugShowCheckedModeBanner: false,
        title: 'Time Manager',
        
        home: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Routine'),
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
                Tab(icon: Icon(Icons.home)),
                //Tab(icon: Icon(Icons.edit_rounded)),
                Tab(icon: Icon(Icons.view_day_rounded)),
                Tab(icon: Icon(Icons.view_timeline_rounded))
              ]),
              elevation: 20,
              actions: [
                IconButton(
                  icon: const Icon(Icons.dark_mode_rounded),
                  onPressed: () => {},
                ),
                IconButton(
                  icon: const Icon(Icons.light_mode_rounded),
                  onPressed: () => {},
                ),
              ],
            ),
            body: const TabBarView(children: [
              RoutinePage(),
              CalendarPage(),
              //EventEditingPage(),
              HomePage(),
            ]),
            drawer: const NavBar(),
          ),
        )
      )
    ) ;
  }
  
}


