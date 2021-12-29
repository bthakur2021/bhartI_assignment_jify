import 'package:bharti_assignment/Utils/image_util.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'Network/Model/ResponseListImages/response_pixabay_image.dart';
import 'Network/Model/ResponseListImages/response_pixabay_image_list.dart';
import 'Provider/jify_image_provider.dart';
import 'Provider/provider_utils.dart';
import 'image_preview.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  List<ResponsePixabayImageList>? _responsePixabayImageList;
  bool _isFirstTimeScreenCalling = true;
  late JifyImageProvider _jifyImageProvider;

  @override
  Widget build(BuildContext context) {
    _jifyImageProvider = ref.watch(imageProvider);

    if (_isFirstTimeScreenCalling) {
      _isFirstTimeScreenCalling = false;
      _jifyImageProvider.hitApiForInitialDataGetImages();
    }

    _responsePixabayImageList = _jifyImageProvider.getResponsePixabayImageList;

    return Scaffold(
      appBar: AppBar(
        title: Text('Jify Gallery ${_responsePixabayImageList?.length ?? 0}'),
      ),
      body: buildMainWidget(),
    );
  }

  Widget buildMainWidget() {
    return MasonryGridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 4,
      crossAxisSpacing: 4,
      itemCount: _responsePixabayImageList?.length ?? 0,
      itemBuilder: (BuildContext context, int index) {
        var imageData = _responsePixabayImageList![index];
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ImagePreview(image: imageData!.largeImageURL.toString())),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            child: ImageUtil.getImage(imageData!.largeImageURL.toString()),
          ),
        );
      },
    );
  }
}
