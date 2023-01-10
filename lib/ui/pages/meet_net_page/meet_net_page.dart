import 'package:flutter/material.dart';

class MeetNetPage extends StatelessWidget {
  const MeetNetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      key: Key('center in meet_net_page'),
      child: Text('MeetNet', key: Key('meet_net_page text')),
    );
  }
}
