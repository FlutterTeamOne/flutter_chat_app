import 'package:flutter/material.dart';

class VideosPage extends StatelessWidget {
  const VideosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      key: Key('center in videos_page'),
      child: Text('VideoS', key: Key('videos_page text')),
    );
  }
}
