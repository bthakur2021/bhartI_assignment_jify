
import 'response_pixabay_image_list.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class ResponsePixabayImageListConverter implements JsonConverter<ResponsePixabayImageList, Map<String, dynamic>> {
  const ResponsePixabayImageListConverter();

  @override
  ResponsePixabayImageList fromJson(Map<String, dynamic> json) {
    return ResponsePixabayImageList.fromJson(json);
  }

  @override
  Map<String, dynamic> toJson(ResponsePixabayImageList data) => data.toJson();
}