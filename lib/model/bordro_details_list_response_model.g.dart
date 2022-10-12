// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bordro_details_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BordroDetailsListResponseModel _$BordroDetailsListResponseModelFromJson(
        Map<String, dynamic> json) =>
    BordroDetailsListResponseModel(
      type: json['type'] as String,
      day: json['day'] as int,
      total: (json['total'] as num).toDouble(),
    );

Map<String, dynamic> _$BordroDetailsListResponseModelToJson(
        BordroDetailsListResponseModel instance) =>
    <String, dynamic>{
      'type': instance.type,
      'day': instance.day,
      'total': instance.total,
    };
