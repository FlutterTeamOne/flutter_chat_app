part of '../asap_page.dart';

class _AppCard extends StatelessWidget {
  const _AppCard({
    Key? key,
    required this.message,
    required this.marginIndex,
  }) : super(key: key);

  final String message;
  final double marginIndex;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          width: 0.1,
          color: AppColor.color000000.withOpacity(0.6),
        ),
      ),
      color: AppColor.color4A2D7C,
      margin: EdgeInsets.only(left: 320, bottom: 5, top: 5, right: marginIndex),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: SelectableText(
          message,
          style: AppTextStyle.s17Abel,
        ),
      ),
    );
  }
}
