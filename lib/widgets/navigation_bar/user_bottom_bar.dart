// bottom_bar1.dart
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:surpay_app/provider/auth_provider.dart';

class UserBottomBar extends StatefulWidget {
  final int? initiateIndex;
  const UserBottomBar({
    super.key,
    this.initiateIndex,
  });

  @override
  State<UserBottomBar> createState() => _UserBottomBarState();
}

class _UserBottomBarState extends State<UserBottomBar> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedIndex = widget.initiateIndex ?? 0;
    });
  }

  Future<void> _onItemTapped(int index) async {
    setState(() {
      _selectedIndex = index;
    });

    switch (index) {
      case 0:
        context.push('/dashboard');
        break;
      case 1:
        context.push('/survey-aktif');
        break;
      case 2:
        context.push('/hadiah');
        break;
      case 3:
        context.push('/penarikan');
        break;
      case 4:
        context.push('/profil');
        break;
      case 5:
        final authRead = context.read<AuthProvider>();

        final result = await authRead.logout();
        if (result) {
          if (mounted) context.push('/login');
        }
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
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        BottomNavigationBarItem(icon: Icon(Icons.exit_to_app), label: 'Logout'),
      ],
      currentIndex: _selectedIndex,
      onTap: _onItemTapped,
      fixedColor: Colors.blue,
      unselectedItemColor: Colors.grey,
    );
  }
}
