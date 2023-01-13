import 'package:flutter/material.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    super.key,
    required this.name,
    required this.image,
    required this.message,
    required this.onTap,
    required this.selected,
    required this.sender,
    required this.updatedDate,
    required this.isSuccess,
  });

  final String? name;
  final String? image;
  final String? message;
  final Function()? onTap;
  final bool? selected;
  final String sender;
  final String updatedDate;
  final int? isSuccess;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      horizontalTitleGap: 4,
      contentPadding: const EdgeInsets.only(right: 8),
      onTap: onTap,
      leading: CircleAvatar(
        radius: 45,
        child: ClipOval(
            child: Image.network(
          image ?? '',
          fit: BoxFit.cover,
          width: 50,
          height: 50,
        )),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 120,
            child: Text(
              name ?? '',
              // style: AppTextStyle.s17Abel,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Text(
            updatedDate,
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11),
          )
        ],
      ),
      subtitle: Text(
        sender == "" ? '$message' : '$sender: $message',
        // style: AppTextStyle.s14AbelGrey,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
            color: isSuccess != null || message == 'Start chating'
                ? Theme.of(context).textSelectionTheme.cursorColor
                : Theme.of(context).errorColor),
      ),
    );
  }
}
