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
        height: 240,
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
                _LoadMethod(onTap: () {
                  showDialog(context: context, builder: (BuildContext context) {
                    TextEditingController newUrlController = TextEditingController();
                    return SizedBox(
                      height: 100,
                      width: 200,
                      child: Dialog(
                        shape:
                            RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.circular(20.0),
                            ),
                        child: Column(children: [
                        Text('Insert image link'),
                        TextField(
                          controller: newUrlController = TextEditingController(),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(20.0),
                                      ))),
                              onPressed: () {
                            var newUrl = newUrlController.text;
                            print(newUrl);
                            Navigator.pop(context);}, child: Icon(Icons.check)),
                        )
                      ],),),
                    );
                  });
                }, text: 'Load image from url'),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(child: ElevatedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<
                          RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius:
                            BorderRadius.circular(20.0),
                          ))),
                  onPressed: (){Navigator.pop(context);}, child: Icon(Icons.close_rounded))),
            )
          ],
        ),
      ),
    );
  }
}
