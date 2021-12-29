import 'dart:async';
import 'dart:collection';
import 'dart:convert';

import 'package:bharti_assignment/Network/Model/ResponseListImages/ResponsePixabayImage.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class ApiHandler {
  static final String _ContentTypeJson = "application/json";

  static final String _PRODUCTION_URL_DEVELOPMENT = "https://pixabay.com/api";

  static final Duration _reqTimeOut = new Duration(seconds: 60);
  static final Duration _resTimeOut = new Duration(seconds: 60);

  static const String _progressMessage = "Please wait ...";
  static ApiHandler? _instance;
  static Options? _cacheOptions;
  static Options? _requestOptions;

  static Dio? _api;

  static const String KEY_AUTHORIZATION = "Authorization";
  static const String KEY_API_KEY = "key";
  static const String API_KEY_VALUE = "25023211-a4df79798dfb36788948617f4";

  static ApiHandler getInstance() {
    if (_instance == null) _instance = new ApiHandler();

    return _instance!;
  }

  static String getUrl() {
    return _PRODUCTION_URL_DEVELOPMENT;
  }

  /* static DioCacheManager getCacheManager() {
    if (null == _cacheManager) {
      _cacheManager = DioCacheManager(CacheConfig(baseUrl: getUrl(), defaultMaxStale: Duration(days: 10)));
    }
    return _cacheManager!;
  }*/

/*  static Options _getCacheOptionsMobile({Options? options}) {
    if (null == _cacheOptions) {
      _cacheOptions = buildCacheOptions(Duration(days: 7), maxStale: Duration(days: 10), options: options);
    }
    return _cacheOptions!;
  }*/

  static Future<Options?> _getApiRequestOption({Options? options}) async {
    /* if (PlatformUtils.instance.isAndroid() || PlatformUtils.instance.isIos()) {
      if (null == _requestOptions) {
        _requestOptions = _getCacheOptionsMobile(options: options);
      }
      return _requestOptions!;
    } else {
      //var directory = await pp.getApplicationDocumentsDirectory();
      //var directoryPath = directory.path;
      //options = optionsWebCache.copyWith(store: HiveCacheStore(directoryPath)).toOptions();

      return options;
    }
*/
    return options;
  }


  static Future<Dio> getApiFromUrl(String url) async {
    /*if (_cacheOptionsWeb != null) {
      await getWebCacheConfig();
    }*/

    Dio _dio = new Dio();

    _dio.options.baseUrl = url;
    //_api.options.contentType = ContentType.parse("application/json");
    _dio.options.contentType = _ContentTypeJson;
  /*  _dio.interceptors.add(NetworkCallInterceptor());
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    if (PlatformUtils.instance.isMobile()) {
      _dio.interceptors.add(getCacheManager().interceptor);
    } else {
      //var _cacheOptionsWeb = await getWebCacheConfig();
      //_dio.interceptors.add(dioCacheInterceptor.DioCacheInterceptor(options: _cacheOptionsWeb));
      //return DioCacheInterceptor(options: optionsWebCache);
    }*/

    return _dio;
  }

  /// dio instance method.
  static Future<Dio> getApi() async {
    if (_api == null) {
      _api = await getApiFromUrl(getUrl());
    }

      return _api!;
    }


  static Future<ResponsePixabayImage?> getImages() async {
    try {
      var dio = await getApi();
      var responseApi = await dio.get('/?key=$API_KEY_VALUE');

      var parseResponse = responseApi.toString();
      Map<String, dynamic> responseMap = json.decode(parseResponse);
      var response = ResponsePixabayImage.fromJson(responseMap);
      print('getSymptoms() -> parseResponse -> \n\n-------\n\n$parseResponse\n\n----------');
      //PrintUtils.printLog('getSymptoms() -> parseResponse -> \n\n-------\n\n$parseResponse\n\n----------');
      return response;
    } catch (e) {
      print(e);
    }
  }



}

