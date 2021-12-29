import 'package:bharti_assignment/Network/Model/ResponseListImages/response_pixabay_image_list.dart';
import 'package:bharti_assignment/Network/Model/ResponseListImages/response_pixabay_image_list_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'response_pixabay_image.g.dart';
part 'response_pixabay_image.freezed.dart';


@freezed
class ResponsePixabayImage with _$ResponsePixabayImage{
  const ResponsePixabayImage._();

  const factory ResponsePixabayImage({
    int? totalHits,
    int? total,
    @ResponsePixabayImageListConverter() List<ResponsePixabayImageList>? hits,
  }) = _ResponsePixabayImage;

  factory ResponsePixabayImage.fromJson(Map<String, dynamic> json) => _$ResponsePixabayImageFromJson(json);
/*
  bool isApiSuccess() => ApiHandlerUtils.isApiSuccess(status, subCode);
  bool isError() => !(isApiSuccess());
  bool isEmpty() => (results?.otp?.isEmpty ?? true);*/
}