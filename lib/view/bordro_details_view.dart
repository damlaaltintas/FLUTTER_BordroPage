import 'package:bordro_page/components/bordro_card.dart';
import 'package:bordro_page/components/bordro_card_details.dart';
import 'package:bordro_page/model/bordro_details_list_response_model.dart';
import 'package:flutter/material.dart';
import 'package:bordro_page/service/details_mock_service.dart';

class bordro_details_page extends StatefulWidget {
  
  List<BordroDetailsListResponseModel> bordroDetailsList = [];
  BordroDetailsListResponseModelService service = BordroDetailsListResponseModelService();

  bordro_details_page() {
    bordroDetailsList = service.fetchBordroDetails();
  }

  @override
  State<bordro_details_page> createState() => _bordro_details_pageState();
}

class _bordro_details_pageState extends State<bordro_details_page> {
  @override
  Widget build(BuildContext context) {
    return BordroCardDetails(endDate: '', startDate: '',);
  }
}