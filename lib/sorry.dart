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
        body: Text(
            "This feature hasn't been developed",
            style: TextStyle(fontSize: 40),
          ),
        
      );
  }
}
class Policies extends StatelessWidget {
  const Policies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(10, 255, 255, 255),
          /*leading: IconButton(
          onPressed:() => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const HomePage())),
          icon: const Icon(Icons.exit_to_app)),*/
          title: const Text('About policies')
        ),
        body:const Text('In order to maintain a consistent, predictable and supportable computing environment it is essential to establish a pre-defined set of software applications for use on workstations, laptops, mobile devices and servers. When employees install random or questionable software on their workstations or devices it can lead to clutter, malware infestations and lengthy support remediation.\nCompany-approved and administered software must allow employees to perform the work they need as part of their job duties yet adhere to licensing, copyright, security and other business needs or industry regulations so as to protect the business and its staff.\nThe details provided within this policy, in the sections that follow, will outline the applications that are allowed for installation and use on computer systems and mobile devices systems owned by the organization. It will also cover the appropriate usage of these applications by company employees and support staff.\nThis software usage policy can be customized as needed to fit the needs of your organization, particularly when it comes to listing the applications needed by employees, as those will vary drastically depending on industry and type of business.',
          style: TextStyle(fontSize: 40),)
          
        );
  }
}
class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

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
        body:const Text(
            "The Settings haven't been developed",
            style: TextStyle(fontSize: 40),
          ),
        
      );
  }
}