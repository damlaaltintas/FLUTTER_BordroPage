import 'package:bordro_page/components/bordro_card.dart';
import 'package:bordro_page/model/bordro_list_response_model.dart';
import 'package:bordro_page/service/mock_service.dart';
import 'package:flutter/material.dart';

class bordro_home_page extends StatefulWidget {
  List<BordroListResponseModel> bordroList = [];
  BordroMockDataService service = BordroMockDataService();

  bordro_home_page() {
    bordroList = service.fetchBordro();
  }

  @override
  State<bordro_home_page> createState() => _bordro_home_pageState();
}

class _bordro_home_pageState extends State<bordro_home_page> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.all(5),
      child: BordroCard(bordroList: widget.bordroList),
     )
    );
  }
}
