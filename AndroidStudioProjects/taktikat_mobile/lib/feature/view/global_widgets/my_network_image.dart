import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:logger/logger.dart';

import '../../../utils/utils/shimmer_loading.dart';
import '../../../utils/utils/utils.dart';

class MyNetworkImage extends StatelessWidget {
  const MyNetworkImage({
    Key? key,
    this.width,
    this.height,
    this.url,
    this.fit,
    this.shape,
    this.borderRadius,
  }) : super(key: key);
  final double? width;
  final double? height;
  final String? url;
  final BoxFit? fit;
  final BoxShape? shape;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    if (url?.endsWith('svg') ?? false) {
      return Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          shape: shape ?? BoxShape.rectangle,
        ),
        child: SvgPicture.network('$url',
            height: height, fit: fit ?? BoxFit.contain),
      );
    }
    return CachedNetworkImage(
      imageBuilder: (context, imageProvider) {
        return Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            shape: shape ?? BoxShape.rectangle,
            borderRadius: borderRadius,
            image: DecorationImage(
              image: CachedNetworkImageProvider(
                (url?.isEmpty ?? true)
                    ? Utils.instance.defaultImage
                    : url ?? Utils.instance.urlUserPlacholder,
              ),
              fit: fit ?? BoxFit.contain,
              onError: (exception, stackTrace) {
                Logger().e(exception);
              },
            ),
          ),
        );
      },
      placeholder: (context, x) {
        return const ShimmerLoading(
          isLoading: true,
          child: CircleAvatar(),
        );
      },
      imageUrl: url ?? '',
      errorWidget: (context, url, error) {
        return const SizedBox.shrink();
      },
      width: width,
      height: height,
      fit: fit ?? BoxFit.contain,
      filterQuality: FilterQuality.low,
    );
  }
}
