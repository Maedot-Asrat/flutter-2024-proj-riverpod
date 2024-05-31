import 'package:flutter/material.dart';
import 'package:admin_side/salon_list_screen.dart';
import 'manage_users.dart';
import 'add_salon_screen.dart';

class AdminDashboard extends StatefulWidget {
  final String accessToken;

  AdminDashboard({required this.accessToken});

  @override
  _AdminDashboardState createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    ManageUsersPage(
      accessToken: '',
    ),
    AddSalonScreen(
      accessToken: '',
    ),
    SalonListScreen(
      accessToken: '',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Zemnanit'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.manage_accounts),
            label: 'Manage Users',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add Salon',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'View Salons',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
