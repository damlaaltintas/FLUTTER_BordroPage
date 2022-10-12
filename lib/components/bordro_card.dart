import 'package:flutter/material.dart';
import 'package:bordro_page/components/bordro_card_details.dart';
import 'package:bordro_page/model/bordro_list_response_model.dart';

class BordroCard extends StatelessWidget {
  final List<BordroListResponseModel>? bordroList;

  const BordroCard({
    Key? key,
    this.bordroList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell( 
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BordroCardDetails(endDate:'', startDate: '',)),
          );
        },
        child: ListView.builder(
          itemCount: bordroList?.length,
          itemBuilder: (BuildContext context, int index) {
            return buildBordroCard(
              startDate: bordroList?[index].startDate,
              endDate: bordroList?[index].endDate,
              amount: bordroList?[index].amount,
            );
          }
        ),
       );
  }

  Widget buildBordroCard<BordroListResponseModel>(
      {required startDate, required endDate, required amount}) {

    return SingleChildScrollView(
      child: Center(
          child: Card(
            elevation: 3,
            child: Container(
                margin: EdgeInsets.only(bottom: 5, top: 5),
                height: 50.0,
                width: double.infinity,
                child: Padding(
                    padding: const EdgeInsets.only(left: 10, top: 10, right: 15),
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(startDate),
                                const Text(" / "),
                                Text(endDate)
                              ],
                            ),
                            Text("Ödenecek Tutar: $amount"),
                          ],
                        ),
                        Spacer(),
                        Icon(Icons.arrow_forward, color: Colors.grey, size: 22,)
                      ],
                    ),
                  ),
                ),
          ),
            ),
    );
  }
}
