import 'package:flutter/material.dart';
class Myhome extends StatefulWidget {
  const Myhome({super.key});

  @override
  State<Myhome> createState() => _MyhomeState();
}

class _MyhomeState extends State<Myhome> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(
            'Virtual Vault',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          backgroundColor: const Color(0xff1F4CA4),
        ),
        drawer: const NavigationDrawer(),
      );
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({super.key});

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );

  Widget buildMenuItems(BuildContext context) => Container(
      padding: const EdgeInsets.all(24),
      child: Wrap(
        runSpacing: 16,
        children: [
          ListTile(
            leading: const Icon(
              Icons.home_outlined,
              size: 30,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'home');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.file_upload,
              size: 30,
            ),
            title: const Text(
              'Uploads',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'upload');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.file_copy,
              size: 30,
            ),
            title: const Text(
              'Documents',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(
              Icons.logout,
              size: 30,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pushNamed(context, 'login');
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.contact_support_sharp,
              size: 30,
            ),
            title: const Text(
              'About us',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, 'about');
            },
          ),
        ],
      ));
}
