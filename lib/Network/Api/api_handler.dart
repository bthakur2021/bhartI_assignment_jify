import 'dart:async';
import 'dart:convert';

import '../Model/ResponseListImages/response_pixabay_image.dart';
import 'package:dio/dio.dart';

class ApiHandler {
  static const String _ContentTypeJson = 'application/json';
  static const String _PRODUCTION_URL_DEVELOPMENT = 'https://pixabay.com/api';

  static const String KEY_AUTHORIZATION = 'Authorization';
  static const String KEY_API_KEY = 'key';
  static const String API_KEY_VALUE = '25023211-a4df79798dfb36788948617f4';

  static ApiHandler? _instance;

  static Dio? _api;

  static ApiHandler getInstance() {
    _instance ??= ApiHandler();

    return _instance!;
  }

  static String getUrl() {
    return _PRODUCTION_URL_DEVELOPMENT;
  }


  static Future<Dio> getApiFromUrl(String url) async {
    final _dio = Dio();

    _dio.options.baseUrl = url;
    _dio.options.contentType = _ContentTypeJson;
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    return _dio;
  }

  /// dio instance method.
  static Future<Dio> getApi() async {
    _api ??= await getApiFromUrl(getUrl());

      return _api!;
    }


  static Future<ResponsePixabayImage?> getImages() async {
    try {
      final dio = await getApi();
      final responseApi = await dio.get('/?key=$API_KEY_VALUE');

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
