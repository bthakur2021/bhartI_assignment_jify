import 'dart:async';
import 'dart:convert';

import 'package:dio_http_cache/dio_http_cache.dart';

import '../Model/ResponseListImages/response_pixabay_image.dart';
import 'package:dio/dio.dart';

class ApiHandler {
  static const String _ContentTypeJson = 'application/json';
  static const String _PRODUCTION_URL_DEVELOPMENT = 'https://pixabay.com/api';

  static const String KEY_AUTHORIZATION = 'Authorization';
  static const String KEY_API_KEY = 'key';
  static const String API_KEY_VALUE = '25023211-a4df79798dfb36788948617f4';

  static final int perPage = 20;

  static DioCacheManager? _cacheManager;
  static ApiHandler? _instance;

  static Dio? _api;

  static ApiHandler getInstance() {
    _instance ??= ApiHandler();

    return _instance!;
  }

  static String getUrl() {
    return _PRODUCTION_URL_DEVELOPMENT;
  }

  static DioCacheManager getCacheManager() {
    if (null == _cacheManager) {
      _cacheManager = DioCacheManager(CacheConfig(baseUrl: getUrl(), defaultMaxStale: Duration(days: 10)));
    }
    return _cacheManager!;
  }

  static Future<Dio> getApiFromUrl(String url) async {
    final _dio = Dio();

    _dio.options.baseUrl = url;
    _dio.options.contentType = _ContentTypeJson;
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    _dio.interceptors.add(getCacheManager().interceptor);

    return _dio;
  }

  /// dio instance method.
  static Future<Dio> getApi() async {
    _api ??= await getApiFromUrl(getUrl());
    return _api!;
  }

  static Future<ResponsePixabayImage?> getImages(int page, {String search = ''}) async {
    try {
      final dio = await getApi();
      final responseApi = await dio.get('/?key=$API_KEY_VALUE&image_type=photo&page=$page&per_page=$perPage&q=$search',
          options: buildCacheOptions(
            Duration(days: 3),
            maxStale: Duration(days: 7),
          ));

      final parseResponse = responseApi.toString();
      final responseMap = json.decode(parseResponse) as Map<String, dynamic>;
      final response = ResponsePixabayImage.fromJson(responseMap);
      print('getSymptoms() -> parseResponse -> \n\n-------\n\n$parseResponse\n\n----------');
      return response;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
