import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageUtil {
  static Widget getImage(String url) {
    return CachedNetworkImage(
      imageUrl: url,
      fit: BoxFit.fill,
      //imageUrl: "http://via.placeholder.com/200x150",
      placeholder: (context, url) => Container(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}