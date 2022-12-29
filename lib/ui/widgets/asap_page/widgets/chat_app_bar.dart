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
      height: 52,
      decoration: BoxDecoration(
        border: Border(
            bottom: BorderSide(width: 1, color: Theme.of(context).dividerColor)
            //   right: BorderSide.none,
            //   bottom: BorderSide(
            //       color: Theme.of(context).colorScheme.primary.withOpacity(0.5),
            //       ),
            //   top: BorderSide.none
            ),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: Image.network(
              image,
            ),
          ),
          const SizedBox(width: 15),
          Text(
            name,
            // style: AppTextStyle.s17Abel.copyWith(fontSize: 20),
          ),
          const Spacer(),
          IconButton(
            splashRadius: 20,
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
              size: 22,
            ),
          ),
        ],
      ),
    );
  }
}
