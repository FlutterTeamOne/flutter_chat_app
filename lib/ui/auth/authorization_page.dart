import 'package:flutter/material.dart';
part '../auth/widgets/user_card.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> userInfo = [
      'Имя фамилия',
      'Телефонный номер',
      'id пользователя'
    ];

    // final textmap =
    //     userInfo.map((element) => UserCard(text: element)).toList();
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // ...textmap,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              UserCard(
                  text: userInfo[0],
                  image:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png'),
              SizedBox(width: 150),
              UserCard(
                  text: userInfo[0],
                  image:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png'),
            ],
          ),
        ],
      )),
    );
  }
}

// class AuthPage extends StatelessWidget {
//   AuthPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: textmap,
//         ),
//       ),
//     );
//   }
// }
