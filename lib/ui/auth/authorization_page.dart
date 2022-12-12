import 'package:flutter/material.dart';
part '../auth/widgets/user_card.dart';

class AuthPage1 extends StatelessWidget {
  const AuthPage1({super.key});

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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(width: 350),
              UserCard(
                  text: userInfo[0],
                  image:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png'),
              UserCard(
                  text: userInfo[0],
                  image:
                      'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png'),
              SizedBox(width: 350),
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
