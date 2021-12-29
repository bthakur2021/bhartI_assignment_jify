import 'package:bharti_assignment/ImagePreview.dart';
import 'package:bharti_assignment/Network/Model/ResponseListImages/ResponsePixabayImageList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'Network/Api/ApiHandler.dart';
import 'Network/Model/ResponseListImages/ResponsePixabayImage.dart';
import 'Provider/GetImageProvider.dart';
import 'Provider/ProviderUtils.dart';

class HomePage extends StatefulHookWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ResponsePixabayImage? _responsePixabayImage;
  List<ResponsePixabayImageList>? _responsePixabayImageList;
  bool _isFirstTimeScreenCalling = true;
  late GetImageProvider _getImageProvider;


  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    if (_isFirstTimeScreenCalling) {
      _isFirstTimeScreenCalling = false;
      GetImageProvider.resetAllDataWithNotifyUI(context);
      GetImageProvider.checkGetMembersStateAndChangeUI(context);
    }
  }

  /*void _hitImagesApi()async{
    responsePixabayImage = await ApiHandler.getImages();
    print("bharti response -> ${responsePixabayImage?.hits?.length}");
    setState(() {});
  }*/

  @override
  Widget build(BuildContext context) {

    _getImageProvider = useProvider(getImageProvider);
    _responsePixabayImage = _getImageProvider.getResponseGetPixabayImage;
    _responsePixabayImageList = _getImageProvider.getResponsePixabayImageList;

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: StaggeredGridView.countBuilder(
        shrinkWrap: true,
        crossAxisCount: 2,
        itemCount: _responsePixabayImageList?.length,
        itemBuilder: (BuildContext context, int index) {
          var hitData = _responsePixabayImageList![index];
          return GestureDetector(
              onTap: ()
              {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ImagePreview(image: hitData!.largeImageURL.toString())),
                );
              },
              child: _buildCardImageUI(hitData));
           // Image.network(hitData?.previewURL ?? "",fit: BoxFit.fill,);
        },
        staggeredTileBuilder: (int index) =>
        new StaggeredTile.count(1, index.isEven ? 1.2 : 1.5),
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
      ),
    );
  }

  Widget _buildCardImageUI(ResponsePixabayImageList? url){
    double width = MediaQuery.of(context).size.width / 2;
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(url!.largeImageURL.toString()),
              fit:  BoxFit.fill,
            )
          ),
        ),
        Positioned(
          bottom: 0.1,
          child: Container(
            height: 50.0,
            width: width,
            color: Colors.black38,
            child: _cardActionRowItems(likes: url.likes, downloads: url.downloads),
          ),
        ),
      ],
    );
  }

  Widget _cardActionRowItems({int? likes, int? downloads}){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _commonActionIcon(icon: Icons.thumb_up_alt_outlined),
              SizedBox(width: 8.0,),
              _commonActionText(title: likes.toString(),),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _commonActionIcon(icon: Icons.arrow_circle_down_rounded),
              SizedBox(width: 8.0,),
              _commonActionText(title: downloads.toString(),),
            ],
          ),
        ],
      ),
    );
  }

  Widget _commonActionText({String? title}){
    return Text(title ?? '',
      style: TextStyle(
          fontSize: 12.0,
          color: Colors.white
      ),
    );
  }

  Widget _commonActionIcon({IconData? icon}){
    return Icon(icon, color: Colors.white,size: 20.0,);
  }
}