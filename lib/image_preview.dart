import 'package:bharti_assignment/Network/Model/ResponseListImages/response_pixabay_image_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:pinch_zoom/pinch_zoom.dart';
import 'Network/Api/api_handler.dart';
import 'Network/Model/ResponseListImages/response_pixabay_image.dart';

class ImagePreview extends StatefulWidget {
  const ImagePreview({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  State<ImagePreview> createState() => _ImagePreviewState();
}

class _ImagePreviewState extends State<ImagePreview> {

  ResponsePixabayImage? responsePixabayImage = ResponsePixabayImage();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _hitImagesApi();
  }

  void _hitImagesApi()async{
    responsePixabayImage = await ApiHandler.getImages();
    print("bharti response -> ${responsePixabayImage?.hits?.length}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: const Text("image preview"),
      ),
      body: PinchZoom(
        resetDuration: const Duration(milliseconds: 100),
        maxScale: 2.5,
        onZoomStart: (){print('Start zooming');},
        onZoomEnd: (){print('Stop zooming');},
        child: Image.network(widget.image.toString(),fit: BoxFit.fitHeight,),
      ),
    );
  }

 
}