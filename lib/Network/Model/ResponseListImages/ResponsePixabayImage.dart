import 'package:bharti_assignment/Network/Model/ResponseListImages/ResponsePixabayImageList.dart';
import 'package:bharti_assignment/Network/Model/ResponseListImages/ResponsePixabayImageListConverter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'ResponsePixabayImage.g.dart';
part 'ResponsePixabayImage.freezed.dart';


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