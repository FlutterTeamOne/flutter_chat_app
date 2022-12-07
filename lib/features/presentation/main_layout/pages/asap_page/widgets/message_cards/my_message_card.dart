part of '../../asap_page.dart';

class MyMessageCard extends StatelessWidget {
  const MyMessageCard({super.key, required this.message, this.isSuccess = 1});

  final String message;
  final int isSuccess;
  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 145),
        child: isSuccess == 1
            ? _AppCard(message: message, marginIndex: 15)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  currentWidth > 888.8
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            _AppCard(
                              marginIndex: 5,
                              message: message,
                            ),
                            const Icon(
                              Icons.error,
                              color: AppColor.colorF44336,
                            )
                          ],
                        )
                      : _AppCard(
                          marginIndex: 10,
                          message: message,
                        ),
                  Text(
                    'Not Delivered',
                    style: AppTextStyle.s14AbelGrey
                        .copyWith(color: AppColor.colorF44336),
                  )
                ],
              ),
      ),
    );
  }
}
