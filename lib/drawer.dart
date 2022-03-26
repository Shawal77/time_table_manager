import 'package:flutter/material.dart';
import 'sorry.dart';

class NavBar extends StatelessWidget {
  const NavBar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: const Text('Shawal77'),
            accountEmail: const Text('example@gmail.com'),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(child: Image.network(
                'https://images.unsplash.com/photo-1494790108377-be9c29b29330?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cHJvZmlsZXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=700&q=60',
                width: 90,
                height: 90,
                fit: BoxFit.cover,
              )),
            ),
            decoration: const BoxDecoration(
              color: Colors.deepPurpleAccent,
              image: DecorationImage(image: NetworkImage(
                'https://images.unsplash.com/photo-1498598457418-36ef20772bb9?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=870&q=80'),
                fit: BoxFit.cover,
                ),
            ),
            ),
          /*ListTile(
            leading: const Icon(Icons.favorite_rounded),
            title: const Text('Favourites'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Sorry())),
              ),
          ListTile(
            leading: const Icon(Icons.people),
            title: const Text('Friends'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Sorry())),
          ),
          ListTile(
            leading: const Icon(Icons.share),
            title: const Text('Share App'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Sorry()))
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notice'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Sorry())),
          ),*/
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('Settings'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Settings())),
          ),
          ListTile(
            leading: const Icon(Icons.policy),
            title: const Text('policies'),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const Policies())),
          ), 
          const Divider(),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('App'),
            onTap: () => Navigator.of(context).pop(),
          ),
          ]
      )
    );
  }
}