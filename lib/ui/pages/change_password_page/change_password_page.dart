import 'package:chat_app/ui/pages/change_password_page/layout/change_password_layout.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});
  static const routeName = '/change_password_page';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            centerTitle: true,
            title: Text('Change Password'),
          ),
          SliverPadding(
            padding: EdgeInsets.only(top: height *0.25),
            sliver: const SliverToBoxAdapter(
              child: ChangePasswordLayout(),
            ),
          )
        ],
      ),
    );
  }
}
