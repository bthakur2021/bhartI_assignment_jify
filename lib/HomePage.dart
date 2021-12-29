import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'Network/Api/ApiHandler.dart';
import 'Network/Model/ResponseListImages/ResponsePixabayImage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ResponsePixabayImage? responsePixabayImage;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _hitImagesApi();
  }

  void _hitImagesApi()async{
    var response = await ApiHandler.getImages();
    if(response != null){
      responsePixabayImage = response;
      print("bharti response -> $response");
    }
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Column(
        children: [
          Text("lenght is : ${responsePixabayImage?.hits?.length}"),
          Container(
            child: StaggeredGridView.countBuilder(
              shrinkWrap: true,
              crossAxisCount: 2,
              itemCount: responsePixabayImage?.hits?.length,
              itemBuilder: (BuildContext context, int index) {
                var hitData = responsePixabayImage?.hits![index];
                return Image.network(hitData?.previewURL ?? "");
                },
              staggeredTileBuilder: (int index) =>
              new StaggeredTile.count(1, index.isEven ? 1.2 : 1.5),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
            ),
          ),
        ],
      ),
    );
  }
}