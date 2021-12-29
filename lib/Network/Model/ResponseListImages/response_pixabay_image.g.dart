// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'response_pixabay_image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ResponsePixabayImage _$$_ResponsePixabayImageFromJson(
        Map<String, dynamic> json) =>
    _$_ResponsePixabayImage(
      totalHits: json['totalHits'] as int?,
      total: json['total'] as int?,
      hits: (json['hits'] as List<dynamic>?)
          ?.map((e) => const ResponsePixabayImageListConverter()
              .fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_ResponsePixabayImageToJson(
        _$_ResponsePixabayImage instance) =>
    <String, dynamic>{
      'totalHits': instance.totalHits,
      'total': instance.total,
      'hits': instance.hits
          ?.map(const ResponsePixabayImageListConverter().toJson)
          .toList(),
    };
