import 'package:flutter/material.dart';

class FindFriendsPage extends StatelessWidget {
  const FindFriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      key: Key('center in find_friend_page'),
      child: Text(key: Key('find_friend_page text'), 'Find friends'),
    );
  }
}
