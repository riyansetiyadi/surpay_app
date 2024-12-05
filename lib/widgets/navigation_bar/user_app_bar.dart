import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:surpay_app/provider/auth_provider.dart';
import 'package:surpay_app/utils/result_state.dart';
import 'package:surpay_app/widgets/handle_error_refresh_widget.dart';

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
      title: Row(
        children: [
          Image.asset(
            'assets/images/app_icon.png',
            height: 50,
            width: 50,
          ),
          Consumer<AuthProvider>(
            builder: (context, state, _) {
              switch (state.stateGetUser) {
                case ResultState.loading:
                  return showSaldo(state);
                case ResultState.initial:
                  return showSaldo(state);
                case ResultState.error:
                  return showSaldo(state);
                case ResultState.loaded:
                  if (state.profile != null) {
                    return showSaldo(state);
                  } else {
                    return ErrorRefresh(
                      onPressed: () async {
                        await state.getUserData();
                      },
                    );
                  }
              }
            },
          ),
        ],
      ),
    );
  }

  Text showSaldo(AuthProvider state) {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: 'Saldo Anda :',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          TextSpan(
            text: ' Rp. ${state.profile?.saldo}',
            style: const TextStyle(
                fontSize: 20, color: Colors.red, fontWeight: FontWeight.w900),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
