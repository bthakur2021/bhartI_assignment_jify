import '../Network/Api/api_handler.dart';
import '../Network/Model/ResponseListImages/response_pixabay_image.dart';
import '../Network/Model/ResponseListImages/response_pixabay_image_list.dart';
import '../Utils/app_enums.dart';
import 'package:flutter/cupertino.dart';

class JifyImageProvider extends ChangeNotifier{

  static final defaultPage = 1;

  var isResultLoading = false;
  var _page = defaultPage;
  var _searchText = "";

  ResponsePixabayImage? _responsePixabayImage;

  UIStates _uiStatesGetMembers = UIStates.DEFAULT;
  UIStates get getUiStatesGetMembers => _uiStatesGetMembers;

  ResponsePixabayImage? get getResponseGetPixabayImage => _responsePixabayImage;
  List<ResponsePixabayImageList>? get getResponsePixabayImageList => _responsePixabayImage?.hits ?? null;
  bool isEmptyGetImages() => (_responsePixabayImage?.hits?.isEmpty ?? false);
  bool isErrorGetImages() => (isEmptyGetImages());

  bool get isMoreResultAvailableToLoad => (_responsePixabayImage?.hits?.length ?? 0) < (_responsePixabayImage?.total ?? 0);

  void _resetApiData() {
    _responsePixabayImage = null;
    _page = defaultPage;
    isResultLoading = false;
  }

  void searchImage(String _searchText) {
      this._searchText = _searchText;
      loadInitial();
  }

  void checkStateAndChangeUI() {
    var isErrorApi = isErrorGetImages();
    var isEmptyResult = isEmptyGetImages();

    if (isErrorApi) {
      _uiStatesGetMembers = UIStates.ERROR;
    } else if (isEmptyResult) {
      _uiStatesGetMembers = UIStates.EMPTY;
    } else {
      if (getResponsePixabayImageList == null ||
          (getResponsePixabayImageList != null && (getResponsePixabayImageList?.isEmpty ?? false))) {
        _uiStatesGetMembers = UIStates.PROGRESS;
      } else {
        _uiStatesGetMembers = UIStates.VALID_DATA;
      }
    }
    notifyListeners();
  }

  void loadInitial() async {
    if(!isResultLoading) {
      _resetApiData();
      checkStateAndChangeUI();
      await _hitApiToFetchImages();
      checkStateAndChangeUI();
    }
  }

  void loadMore() async {
    if(!isResultLoading) {
      await _hitApiToFetchImages();
    }
  }

  Future<void> _hitApiToFetchImages() async {
    isResultLoading = true;
    var response = await ApiHandler.getImages(_page, search: _searchText);
    ++_page;

    if(_responsePixabayImage == null) {
      _responsePixabayImage = response;
    } else {
      _responsePixabayImage?.hits?.addAll(response?.hits ?? []);
    }
    isResultLoading = false;
    notifyListeners();
  }
}
