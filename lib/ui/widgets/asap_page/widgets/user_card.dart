import 'package:flutter/material.dart';

class UserCardWidget extends StatelessWidget {
  const UserCardWidget({
    super.key,
    required this.name,
    required this.image,
    required this.message,
    required this.onTap,
    required this.selected,
  });

  final String? name;
  final String? image;
  final String? message;
  final Function()? onTap;
  final bool? selected;

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
      title: Text(
        name ?? '',
        // style: AppTextStyle.s17Abel,
      ),
      subtitle: Text(
        message ?? '',
        // style: AppTextStyle.s14AbelGrey,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}
