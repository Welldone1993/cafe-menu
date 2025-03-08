import 'package:flutter/material.dart';
import 'package:octo_image/octo_image.dart';

class CustomImageBuilder extends StatelessWidget {
  const CustomImageBuilder({
    super.key,
    // required this.folder,
    required this.image,
    this.fit,
    this.height,
    this.width,
    this.isAvatar = false,
  });

  // final String folder;
  final String image;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final bool isAvatar;

  @override
  Widget build(BuildContext context) => isAvatar ? _avatar() : _image();

  Widget _avatar() => OctoImage.fromSet(
        width: width,
        height: height,
        fit: fit ?? BoxFit.fill,
        image: ExactAssetImage(
          image,
        ),
        // NetworkImage(
        //   AppController().fullBaseUrl +
        //       RepositoryUrls.getImage(
        //         folder: folder,
        //         image: image,
        //       ),
        // ),
        octoSet: OctoSet.circleAvatar(
          backgroundColor: Colors.transparent,
          text: const SizedBox(),
        ),
      );

  Widget _image() => OctoImage(
        width: width,
        height: height,
        fit: fit ?? BoxFit.fill,
        image: ExactAssetImage(
          image,
        ),
        // NetworkImage(
        //   AppController().fullBaseUrl +
        //       RepositoryUrls.getImage(
        //         folder: folder,
        //         image: image,
        //       ),
        // ),
        progressIndicatorBuilder: (context, progress) {
          double? value;
          var expectedBytes = progress?.expectedTotalBytes;

          if (progress != null && expectedBytes != null) {
            value = progress.cumulativeBytesLoaded / expectedBytes;
          }
          return Center(
            child: Center(
              child: CircularProgressIndicator(
                value: value,
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white70),
              ),
            ),
          );
        },
        errorBuilder: (
          context,
          error,
          stacktrace,
        ) =>
            const Icon(
          Icons.error,
          color: Colors.blueGrey,
        ),
      );
}
