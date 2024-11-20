import 'package:flutter/material.dart';

class UserAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;

  const UserAppBar({
    super.key,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Color.fromARGB(255, 0, 0, 0)),
      title: const Row(
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child:
                Image(image: NetworkImage('https://surpay.id/images/icon.png')),
          ),
          Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'Saldo Anda :',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: ' Rp. 7.500',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.w900),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
