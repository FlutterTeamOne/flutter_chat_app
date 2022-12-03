part of '../asap_page.dart';

class _TextInput extends StatelessWidget {
  const _TextInput({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.077,
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: TextField(
          // controller: ,
          style: AppTextStyle.s17Abel.copyWith(
            fontSize: 16,
            overflow: TextOverflow.clip,
          ),
          decoration: InputDecoration(
            prefixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.emoji_emotions_rounded,
                color: AppColor.color9E9E9E,
              ),
            ),
            suffixIcon: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.send_rounded),
            ),
            prefixIconColor: AppColor.color9E9E9E,
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
    );
  }
}
