import 'package:json_annotation/json_annotation.dart';

part 'bordro_details_list_response_model.g.dart';

@JsonSerializable()
class BordroDetailsListResponseModel {
  final String type;
  final int  day;
  final double total;
  BordroDetailsListResponseModel({
    required this.type,
    required this.day,
    required this.total,
  });
}
