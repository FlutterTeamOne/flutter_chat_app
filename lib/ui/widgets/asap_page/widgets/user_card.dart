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
  });

  final String? name;
  final String? image;
  final String? message;
  final Function()? onTap;
  final bool? selected;
  final String sender;
  final String updatedDate;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 8),
      // selected: true,
      // selectedTileColor: Theme.of(context).colorScheme.secondary,
      // selectedColor: Theme.of(context).colorScheme.secondary,
      onTap: onTap,
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(100),
        child: Image.network(
          image ?? '',
          scale: 2,
        ),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name ?? '',
            // style: AppTextStyle.s17Abel,
          ),
          Text(
            updatedDate,
            style:
                Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 11.5),
          )
        ],
      ),
      subtitle: Text(
        '$sender: $message',
        // style: AppTextStyle.s14AbelGrey,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
