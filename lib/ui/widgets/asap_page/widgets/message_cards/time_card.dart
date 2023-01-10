import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TimeCardWidget extends StatelessWidget {
  const TimeCardWidget({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        // shape: RoundedRectangleBorder(
        //   borderRadius: BorderRadius.circular(10),
        //
        // ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Text(
            DateFormat.yMMMd().format(DateTime.parse(date)),
            // style: AppTextStyle.s17Abel.copyWith(fontSize: 14),
          ),
        ),
      ),
    );
  }
}
