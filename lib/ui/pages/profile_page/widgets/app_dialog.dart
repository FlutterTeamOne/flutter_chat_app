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
        height: 200,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          //
          borderRadius: BorderRadius.circular(15),
          color: Theme.of(context).dialogBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Choose image',
                  // Стиль
                  // style: TextStyle(fontSize: 16),
                ),
              ],
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
