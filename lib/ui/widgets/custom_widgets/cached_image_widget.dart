import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../auth/authorization_page.dart';

class CachedImageWidget extends StatelessWidget {
  const CachedImageWidget({
    Key? key,
    required this.url,
    required this.width,
    required this.height,
    this.errorText,
  }) : super(key: key);

  final String url;
  final double width;
  final double height;
  final String? errorText;
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
        width: width,
        height: height,
        imageUrl: url,
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
            'assets/lottie/avatar.json',
            width: width,
            height: height)
//'https://assets10.lottiefiles.com/private_files/lf30_qunyZE.json'
        // ImageCard(
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Icon(
        //         Icons.error,
        //         color: Theme.of(context).errorColor,
        //         size: 26,
        //       ),
        //       Text(
        //         errorText ?? '',
        //         textAlign: TextAlign.center,
        //         style:
        //             Theme.of(context).textTheme.subtitle2?.copyWith(fontSize: 12),
        //       ),
        //     ],
        //   ),
        // ),
        );
  }
}
