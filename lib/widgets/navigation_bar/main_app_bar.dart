import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  const MainAppBar({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.mail,
            size: 30,
            color: Colors.orange,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.phone,
            size: 30,
            color: Colors.orange,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
