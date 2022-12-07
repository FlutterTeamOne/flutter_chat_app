part of '../../asap_page.dart';

class MyMessageCard extends StatelessWidget {
  const MyMessageCard({super.key, required this.message, this.isSuccess = 1});

  final String message;
  final int isSuccess;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: MediaQuery.of(context).size.width - 145),
        child: isSuccess == 1
            ? Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(
                    width: 0.1,
                    color: AppColor.color000000.withOpacity(0.6),
                  ),
                ),
                color: AppColor.color4A2D7C,
                margin: const EdgeInsets.only(
                    left: 320, bottom: 5, top: 5, right: 15),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  child: SelectableText(
                    message,
                    style: AppTextStyle.s17Abel,
                  ),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                          side: BorderSide(
                            width: 0.1,
                            color: AppColor.color000000.withOpacity(0.6),
                          ),
                        ),
                        color: AppColor.color4A2D7C,
                        margin: const EdgeInsets.only(
                            left: 320, bottom: 5, top: 5, right: 5),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: SelectableText(
                            message,
                            style: AppTextStyle.s17Abel,
                          ),
                        ),
                      ),
                      const Icon(
                        Icons.error,
                        color: AppColor.colorF44336,
                      )
                    ],
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
