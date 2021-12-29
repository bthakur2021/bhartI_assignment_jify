

import 'package:bharti_assignment/Network/Api/ApiHandler.dart';
import 'package:bharti_assignment/Network/Model/ResponseListImages/ResponsePixabayImage.dart';
import 'package:bharti_assignment/Network/Model/ResponseListImages/ResponsePixabayImageList.dart';
import 'package:bharti_assignment/Utils/AppEnums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/src/provider.dart';

import 'ProviderUtils.dart';

class GetImageProvider extends ChangeNotifier{

  ResponsePixabayImage? _responsePixabayImage;
  UIStates _uiStatesGetMembers = UIStates.DEFAULT;

  bool _isApiCalling = false;

  int _countCheckGetImageState = 0;

  UIStates get getUiStatesGetMembers => _uiStatesGetMembers;
  ResponsePixabayImage? get getResponseGetPixabayImage => _responsePixabayImage;

  List<ResponsePixabayImageList>? get getResponsePixabayImageList => _responsePixabayImage?.hits ?? null;

  void _resetApiData() {
    _responsePixabayImage = null;
  }

  void _resetProviderData() {
    _countCheckGetImageState = 0;
  }

  void _resetAllDataWithNotifyUI() {
    _resetApiData();
    _resetProviderData();
    notifyListeners();
  }

  bool isEmptyGetImages() => (_responsePixabayImage?.hits?.isEmpty ?? false);
  bool isErrorGetImages() => (isEmptyGetImages());

  void _checkGetMembersStateAndChangeUI() {
    ++_countCheckGetImageState;

    if(_countCheckGetImageState > 3) {
      return;
    }

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
        hitApiForInitialDataGetImages();
      } else {
        _uiStatesGetMembers = UIStates.VALID_DATA;
      }
    }
    notifyListeners();
  }

  void hitApiForInitialDataGetImages() async {
    if(!_isApiCalling) {
      _resetApiData();
      _responsePixabayImage = await _hitApiToFetchImages();
      _checkGetMembersStateAndChangeUI();
    }
  }

  Future<ResponsePixabayImage?> _hitApiToFetchImages() async {
    _isApiCalling = true;
    var response = await ApiHandler.getImages();
    _isApiCalling = false;
    return response;
  }

  static resetAllDataWithNotifyUI(BuildContext context) =>
      context.read(getImageProvider)._resetAllDataWithNotifyUI();

  static checkGetMembersStateAndChangeUI(BuildContext context) =>
      context.read(getImageProvider)._checkGetMembersStateAndChangeUI();

  static Future<ResponsePixabayImage?> hitApiToFetchImages(BuildContext context) =>
      context.read(getImageProvider)._hitApiToFetchImages();
}