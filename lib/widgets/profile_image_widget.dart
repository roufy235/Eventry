import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:eventry/config/config.dart';

class ProfileImageWidget extends StatelessWidget {
  final String imageUrl;
  final double radius;
  const ProfileImageWidget({
    Key? key,
    required this.imageUrl,
    this.radius = size20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return CachedNetworkImage(
      progressIndicatorBuilder: (context, url, downloadProgress) {
        return CircleAvatar( // or
            backgroundColor: getFadedBgColor(context),
            radius: radius.r,// any widget that use imageProvider like (PhotoView)
            child: CircularProgressIndicator(value: downloadProgress.progress)
        );
      },
      errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
      fit: BoxFit.cover,
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) { // you can access to imageProvider
        return CircleAvatar( // or
          radius: radius.r,// any widget that use imageProvider like (PhotoView)
          backgroundImage: imageProvider,
        );
      },
    );
  }
}
