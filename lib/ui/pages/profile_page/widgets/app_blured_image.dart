part of '../profile_page.dart';

class _AppBluredImage extends StatelessWidget {
  const _AppBluredImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Blur(
        blur: 5.5,
        // Цвет
        // blurColor: AppColor.color000000.withOpacity(0.1),
        colorOpacity: 0.1,
        child: SizedBox(
          width: double.infinity,
          height: 175,
          child: CachedNetworkImage(
              width: double.infinity,
              height: 175,
              imageUrl: image,
              imageBuilder: (context, imageProvider) => ImageCard(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
              // placeholder будет ставить виджет пока загружается картинка
              placeholder: (context, url) => const ImageCard(
                    child: Center(child: CircularProgressIndicator()),
                  ),
              // errorWidget же при возникновении ошибки отображать
              errorWidget: (context, url, error) => Lottie.asset(
                    'assets/lottie/placeholder-images.json',
                    width: double.infinity,
                    height: 175,
                  )),
        ));
  }
}
