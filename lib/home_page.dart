import 'package:bharti_assignment/Utils/image_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_search_bar/flutter_search_bar.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'Network/Model/ResponseListImages/response_pixabay_image_list.dart';
import 'Provider/jify_image_provider.dart';
import 'Provider/provider_utils.dart';
import 'image_preview.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  _HomePageState() {
    searchBar = new SearchBar(
        inBar: false,
        setState: setState,
        onSubmitted: _search,
        buildDefaultAppBar: buildAppBar
    );
  }
  late SearchBar searchBar;

  AppBar buildAppBar(BuildContext context) {
    return new AppBar(
        title: new Text('Jify Gallery (Images: ${_responsePixabayImageList?.length ?? 0})'),
        actions: [searchBar.getSearchAction(context)]
    );
  }


  List<ResponsePixabayImageList>? _responsePixabayImageList;
  bool _isFirstTimeScreenCalling = true;
  late JifyImageProvider _jifyImageProvider;

  static const widgetTag = "ContentListing_DynamicHeightState";
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>(debugLabel: widgetTag);

  @override
  Widget build(BuildContext context) {
    _jifyImageProvider = ref.watch(imageProvider);

    if (_isFirstTimeScreenCalling) {
      _isFirstTimeScreenCalling = false;
      _jifyImageProvider.loadInitial();
    }

    _responsePixabayImageList = _jifyImageProvider.getResponsePixabayImageList;

    return Scaffold(
      /*appBar: AppBar(
        title: Text('Jify Gallery ${_responsePixabayImageList?.length ?? 0}'),
      ),*/
      appBar: searchBar.build(context),
      body: buildMainWidget(),
    );
  }

  Widget getWidgetWithPullToRefresh(Widget child) {
    return RefreshIndicator(
      key: _refreshIndicatorKey,
      onRefresh: _onRefreshContentList,
      child: child,
    );
  }

  Future<void> _onRefreshContentList() async {
    await new Future.delayed(const Duration(seconds: 1));
    _reloadContentList(true);
  }

  void _reloadContentList(bool isHardRefresh) {
    if (isHardRefresh) {
      _jifyImageProvider.loadInitial();
    } else {
      _jifyImageProvider.loadMore();
    }
  }

  Widget buildMainWidget() {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: NotificationListener<ScrollNotification>(
        //key: riContentListingKey1,
        onNotification: (ScrollNotification scrollInfo) {
          double currentPixel = scrollInfo.metrics.pixels;

          if (currentPixel == scrollInfo.metrics.maxScrollExtent) {
            _jifyImageProvider.loadMore();
          }

          return true;
        },
        child: getWidgetWithPullToRefresh(_buildGridWidget()),
      ),
    );
  }


  Widget _buildGridWidget() {
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
              MaterialPageRoute(builder: (context) => ImagePreview(image: imageData.largeImageURL.toString())),
            );
          },
          child: Container(
            width: MediaQuery.of(context).size.width / 2,
            child: ImageUtil.getImage(imageData.webformatURL.toString(), aspectRatio: imageData.webformatWidth! / imageData.webformatHeight!),
          ),
        );
      },
    );
  }

  void _search(String value) {
    _jifyImageProvider.searchImage(value);
  }
}
