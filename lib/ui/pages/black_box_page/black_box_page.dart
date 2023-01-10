import 'package:flutter/material.dart';

class BlackBoxPage extends StatelessWidget {
  const BlackBoxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      key: Key('center in black_box_page'),
      child: Text(
        key: ValueKey('black_box_page text'),
        'Black box',
      ),
    );
  }
}
