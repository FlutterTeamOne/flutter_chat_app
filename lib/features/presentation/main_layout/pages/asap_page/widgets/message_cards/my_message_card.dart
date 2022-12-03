part of '../../asap_page.dart';

class MyMessageCard extends StatelessWidget {
  const MyMessageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width + 145),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          color: AppColor.color4A2D7C,
          margin:
              const EdgeInsets.only(left: 320, bottom: 5, top: 5, right: 15),
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Text(
              'этот текст длинный для проверки длинны текста этот текст длинный для проверки длинны текста этот текст длинный для проверки длинны текста этот текст длинный для проверки длинны текста этот текст длинный для проверки длинны текста этот текст длинный для проверки длинны текста этот текст длинный для проверки длинны текста ',
              style: AppTextStyle.s17Abel,
            ),
          ),
        ),
      ),
    );
  }
}
