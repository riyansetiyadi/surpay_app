import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:surpay_app/db/auth_repository.dart';

class MainDrawer extends StatefulWidget {
  const MainDrawer({
    super.key,
  });

  @override
  State<MainDrawer> createState() => _MainDrawerState();
}

class _MainDrawerState extends State<MainDrawer> {
  bool isLoggedIn = false;
  @override
  void initState() {
    super.initState();
    _loadDataLogin();
  }

  Future<void> _loadDataLogin() async {
    final authRepository = AuthRepository();
    bool fetchedData = await authRepository.isLoggedIn();
    setState(() {
      isLoggedIn = fetchedData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const SizedBox(
            height: 100,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.green,
              ),
              child: Text(
                'Surpay',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.home, color: Colors.blue),
            title: const Text('Home'),
            onTap: () {
              context.push('/home');
              Scaffold.of(context).closeDrawer();
            },
          ),
          if (isLoggedIn)
            ListTile(
              leading: const Icon(Icons.dashboard, color: Colors.blue),
              title: const Text('Dashboard'),
              onTap: () {
                context.push('/dashboard');
                Scaffold.of(context).closeDrawer();
              },
            ),
          if (!isLoggedIn)
            ListTile(
              leading: const Icon(Icons.login, color: Colors.blue),
              title: const Text('Login'),
              onTap: () {
                context.push('/login');
                Scaffold.of(context).closeDrawer();
              },
            ),
          if (!isLoggedIn)
            ListTile(
              leading: const Icon(Icons.app_registration, color: Colors.blue),
              title: const Text('Register'),
              onTap: () {
                context.push('/register');
                Scaffold.of(context).closeDrawer();
              },
            ),
          ListTile(
            leading: const Icon(Icons.contact_support, color: Colors.blue),
            title: const Text('Support'),
            onTap: () {
              context.push('/support');
              context.push('/contact');
            },
          )
        ],
      ),
    );
  }
}
