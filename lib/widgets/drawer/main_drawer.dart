import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

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
                color: Colors.orange,
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
          ListTile(
            leading: const Icon(Icons.dashboard, color: Colors.blue),
            title: const Text('Dashboard'),
            onTap: () {
              context.push('/dashboard');
              Scaffold.of(context).closeDrawer();
            },
          ),
          ListTile(
            leading: const Icon(Icons.contact_support, color: Colors.blue),
            title: const Text('Contact'),
            onTap: () {
              context.push('/contact');
              Scaffold.of(context).closeDrawer();
            },
          ),
        ],
      ),
    );
  }
}
