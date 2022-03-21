import 'package:flutter/material.dart';

class TransparentAppBar extends StatelessWidget {
  const TransparentAppBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(10, 255, 255, 255),
        title: const Text('Transparent AppBar'),
        centerTitle: true,
        leading: const BackButton(),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search))
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(16)),
          ),
      ),
      body: Image.network(
        'https://mcdn.wallpapersafari.com/medium/85/50/RlTbEg.png',
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
    );
  }
}