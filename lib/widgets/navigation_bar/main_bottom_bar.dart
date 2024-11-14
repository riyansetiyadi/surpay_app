// bottom_bar1.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainBottomBar extends StatefulWidget {
  final int? initiateIndex;
  const MainBottomBar({
    super.key,
    this.initiateIndex,
  });

  @override
  State<MainBottomBar> createState() => _MainBottomBarState();
}

class _MainBottomBarState extends State<MainBottomBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.initiateIndex ?? 0;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        context.go('/home');
        break;
      case 1:
        context.push('/login');
        break;
      case 2:
        context.push('/login');
        break;
      case 3:
        context.push('/login');
        break;
      case 4:
        context.push('/login');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.dashboard), label: 'Dashboard'),
        BottomNavigationBarItem(
            icon: Icon(Icons.request_quote), label: 'Survey'),
        BottomNavigationBarItem(icon: Icon(Icons.paid), label: 'Poinku'),
        BottomNavigationBarItem(
            icon: Icon(Icons.currency_exchange), label: 'Penarikan'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      fixedColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}
