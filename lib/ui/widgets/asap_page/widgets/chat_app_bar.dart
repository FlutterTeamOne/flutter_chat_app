import 'package:chat_app/ui/widgets/custom_widgets/cached_image_widget.dart';
import 'package:flutter/material.dart';

class ChatAppBarWidget extends StatelessWidget {
  const ChatAppBarWidget({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);
  final String image;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 10),
      child: Row(
        children: <Widget>[
          CircleAvatar(
            radius: 45,
            child: ClipOval(
              child: CachedImageWidget(
                url: image,
                width: 50,
                height: 50,
                errorText: 'Oops',
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              // style: AppTextStyle.s17Abel.copyWith(fontSize: 20),
            ),
          ),
          // const Spacer(),
          // IconButton(
          //   splashRadius: 20,
          //   onPressed: () {},
          //   icon: const Icon(
          //     Icons.more_vert_outlined,
          //     size: 22,
          //   ),
          // ),
        ],
      ),
    );
  }
}
