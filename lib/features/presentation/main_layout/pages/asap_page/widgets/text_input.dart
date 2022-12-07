part of '../asap_page.dart';

class _TextInput extends StatefulWidget {
  const _TextInput({
    Key? key,
    required this.controller,
    required this.onTap,
    required this.onSubmitted,
  }) : super(key: key);

  final TextEditingController controller;
  final Function() onTap;
  final Function(String text) onSubmitted;

  @override
  State<_TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<_TextInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: AppColor.colorFFFFFF,
        border: Border(
          left: BorderSide.none,
          right: BorderSide(
            color: AppColor.color9E9E9E.withOpacity(0.5),
          ),
          bottom: BorderSide(
            color: AppColor.color9E9E9E.withOpacity(0.5),
          ),
          top: BorderSide(
            color: AppColor.color9E9E9E.withOpacity(0.5),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(width: 10),
          _AppCircleButton(
              onTap: widget.onTap, icon: Icons.emoji_emotions_rounded),
          const SizedBox(width: 10),
          Expanded(
            flex: 9,
            child: TextField(
              onSubmitted: widget.onSubmitted,
              controller: widget.controller,
              cursorColor: AppColor.color7E57C2,
              style: AppTextStyle.s17Abel.copyWith(
                fontSize: 16,
                overflow: TextOverflow.clip,
              ),
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                hintStyle: AppTextStyle.s17Abel.copyWith(fontSize: 16),
                hintText: 'Message',
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: AppColor.color9E9E9E.withOpacity(0.5),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: AppColor.color9E9E9E.withOpacity(0.5),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(
                    color: AppColor.color9E9E9E.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          _AppCircleButton(onTap: widget.onTap, icon: Icons.send_rounded),
          const SizedBox(width: 10),
        ],
      ),
    );
  }
}
