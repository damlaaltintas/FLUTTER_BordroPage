// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bordro_list_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BordroListResponseModel _$BordroListResponseModelFromJson(
        Map<String, dynamic> json) =>
    BordroListResponseModel(
      startDate: json['startDate'] as String,
      endDate: json['endDate'] as String,
      amount: (json['amount'] as num).toDouble(),
    );

Map<String, dynamic> _$BordroListResponseModelToJson(
        BordroListResponseModel instance) =>
    <String, dynamic>{
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'amount': instance.amount,
    };
