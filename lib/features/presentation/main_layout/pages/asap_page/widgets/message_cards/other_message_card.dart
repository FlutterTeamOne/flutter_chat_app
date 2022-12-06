part of '../../asap_page.dart';

class _OtherMessageCard extends StatelessWidget {
  const _OtherMessageCard({required this.message});

  final String message;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width + 145),
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(
              width: 0.1,
              // color: AppColor.color000000.withOpacity(0.6),
            ),
          ),
          // color: AppColor.colorFFFFFF,
          margin:
              const EdgeInsets.only(left: 15, bottom: 5, top: 5, right: 320),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: SelectableText(
              message,
              // style: AppTextStyle.s17Abel,
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    );
  }
}
