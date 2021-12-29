import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:pinch_zoom/pinch_zoom.dart';

import 'Utils/image_util.dart';

class ImagePreview extends StatefulWidget {
  const ImagePreview({Key? key, required this.image, required this.heroWidgetTag}) : super(key: key);
  final String image;
  final String heroWidgetTag;

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("image preview"),
      ),
      body: buildPinchZoom(),
    );
  }

  Widget buildMainWidget() {

    /*return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(widget.image),
          fit: BoxFit.cover,
        ),
      ),
      child: ClipRRect( // make sure we apply clip it properly
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            alignment: Alignment.center,
            color: Colors.grey.withOpacity(0.1),
            child: buildPinchZoom(),
          ),
        ),
      ),
    );*/

    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(widget.image),
            fit:  BoxFit.fill,
          )
      ),
      child: buildPinchZoom(),
    );
  }

  Widget buildPinchZoom() {
    return Hero(
      tag: widget.heroWidgetTag,
      child: Container(
        padding: EdgeInsets.all(16.0),
        child: PinchZoom(
          resetDuration: const Duration(milliseconds: 100),
          maxScale: 2.5,
          onZoomStart: () {},
          onZoomEnd: () {},
          child: ImageUtil.getImage(widget.image, boxFit: BoxFit.contain),
        ),
      ),
    );
  }
}
