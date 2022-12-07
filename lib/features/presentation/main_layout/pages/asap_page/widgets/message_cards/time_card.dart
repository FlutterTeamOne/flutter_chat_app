part of '../../asap_page.dart';

class _TimeCard extends StatelessWidget {
  const _TimeCard({
    Key? key,
    required this.date,
  }) : super(key: key);

  final String date;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 40,
      child: Center(
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              width: 0.1,
              color: AppColor.color000000.withOpacity(0.3),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              
              DateFormat.yMMMd().format(DateTime.parse(date)),
              style: AppTextStyle.s17Abel.copyWith(fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}
