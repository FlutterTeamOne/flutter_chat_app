part of '../profile_page.dart';

class _AppDialog extends StatelessWidget {
  const _AppDialog({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 350,
        height: 250,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              blurRadius: 8,
              blurStyle: BlurStyle.outer,
              // Цвет
              // color: AppColor.color000000.withOpacity(0.7),
            ),
          ],
          borderRadius: BorderRadius.circular(15),
          // Цвет
          // color: AppColor.color000000.withOpacity(0.2),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Choose image',
              // Стиль
              // style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Способы загрузки фотографии
                _LoadMethod(onTap: () {}, text: 'Load image'),
                _LoadMethod(onTap: () {}, text: 'Load other'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
