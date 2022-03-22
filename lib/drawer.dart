import 'package:flutter/material.dart';

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
          const ListTile(
            leading: Icon(Icons.favorite_rounded),
            title: Text('Favourites'),
            onTap: null,
          ),
          const ListTile(
            leading: Icon(Icons.people),
            title: Text('Friends'),
            onTap: null,
          ),
          const ListTile(
            leading: Icon(Icons.share),
            title: Text('Share App'),
            onTap: null,
          ),
          const ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Notice'),
            onTap: null,
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
            onTap: null,
          ),
          const ListTile(
            leading: Icon(Icons.policy),
            title: Text('policies'),
            onTap: null,
          ), 
          const Divider(),
          const ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit to app'),
            onTap: null,
          ),
        ],
      )
    );
  }
}