import 'package:freezed_annotation/freezed_annotation.dart';
part 'ResponsePixabayImageList.g.dart';
part 'ResponsePixabayImageList.freezed.dart';

@freezed
class ResponsePixabayImageList with _$ResponsePixabayImageList{
  const ResponsePixabayImageList._();

  const factory ResponsePixabayImageList({
    int? id,
    String? pageURL,
    String? type,
    String? tags,
    String? previewURL,
    int? previewWidth,
    int? previewHeight,
    String? webformatURL,
    int? webformatWidth,
    int? webformatHeight,
    String? largeImageURL,
    int? imageWidth,
    int? imageHeight,
    int? imageSize,
    int? views,
    int? downloads,
    int? collections,
    int? likes,
    int? comments,
    int? user_id,
    String? user,
    String? userImageURL,


  }) = _ResponsePixabayImageList;

  factory ResponsePixabayImageList.fromJson(Map<String, dynamic> json) => _$ResponsePixabayImageListFromJson(json);

// bool isEmpty() => (otp?.isEmpty ?? true);
}