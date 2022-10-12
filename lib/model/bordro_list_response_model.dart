import 'package:json_annotation/json_annotation.dart';

part 'bordro_list_response_model.g.dart';

@JsonSerializable()
class BordroListResponseModel {
  final String startDate;
  final String endDate;
  final double amount;
  BordroListResponseModel({
    required this.startDate,
    required this.endDate,
    required this.amount,
  });
}

