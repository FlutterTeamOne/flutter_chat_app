import 'package:flutter/material.dart';

class JobLitePage extends StatelessWidget {
  const JobLitePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      key: Key('center in job_lite_page'),
      child: Text('Job lite', key: Key('job_lite_page text')),
    );
  }
}
