import 'package:bharti_assignment/Utils/color_utils.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageUtil {
  static Widget getImage(String url, {double? aspectRatio, BoxFit boxFit = BoxFit.fill}) {
    Widget _childWidget = CachedNetworkImage(
      imageUrl: url,
      fit: boxFit,
      placeholder: (context, url) {
        if ((aspectRatio ?? 0) > 0) {
          return AspectRatio(
            aspectRatio: aspectRatio!,
            child: Container(
              color: ColorUtils().randomShimmerLoadingColorGeneratorByIndex(url.hashCode),
            ),
          );
        }

        return Container();
      },
      errorWidget: (context, url, error) => Icon(Icons.error),
    );

    if ((aspectRatio ?? 0) > 0) {
      return AspectRatio(
        aspectRatio: aspectRatio!,
        child: _childWidget,
      );
    }

    return _childWidget;
  }
}
