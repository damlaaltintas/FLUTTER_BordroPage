import 'package:bordro_page/model/bordro_list_response_model.dart';

class BordroMockDataService {

  List<BordroListResponseModel> fetchBordro() { 
    var bordroList = <BordroListResponseModel>[
      BordroListResponseModel(
          startDate: "01.01.2020", endDate: "31.01.2020", amount: 2000.150),
      BordroListResponseModel(
          startDate: "01.02.2020", endDate: "28.02.2020", amount: 2140.850),
      BordroListResponseModel(
          startDate: "01.03.2020", endDate: "31.03.2020", amount: 3500.850),
      BordroListResponseModel(
          startDate: "01.04.2020", endDate: "30.04.2020", amount: 3650.950),
      BordroListResponseModel(
          startDate: "01.05.2020", endDate: "31.05.2020", amount: 4250.650),
      BordroListResponseModel(
          startDate: "01.06.2020", endDate: "30.06.2020", amount: 7560.050),
          BordroListResponseModel(
          startDate: "01.01.2020", endDate: "31.01.2020", amount: 2000.150),
      BordroListResponseModel(
          startDate: "01.02.2020", endDate: "28.02.2020", amount: 2140.850),
      BordroListResponseModel(
          startDate: "01.03.2020", endDate: "31.03.2020", amount: 3500.850),
      BordroListResponseModel(
          startDate: "01.04.2020", endDate: "30.04.2020", amount: 3650.950),
      BordroListResponseModel(
          startDate: "01.05.2020", endDate: "31.05.2020", amount: 4250.650),
      BordroListResponseModel(
          startDate: "01.06.2020", endDate: "30.06.2020", amount: 7560.050),
          BordroListResponseModel(
          startDate: "01.01.2020", endDate: "31.01.2020", amount: 2000.150),
      BordroListResponseModel(
          startDate: "01.02.2020", endDate: "28.02.2020", amount: 2140.850),
      BordroListResponseModel(
          startDate: "01.03.2020", endDate: "31.03.2020", amount: 3500.850),
      BordroListResponseModel(
          startDate: "01.04.2020", endDate: "30.04.2020", amount: 3650.950),
      BordroListResponseModel(
          startDate: "01.05.2020", endDate: "31.05.2020", amount: 4250.650),
      BordroListResponseModel(
          startDate: "01.06.2020", endDate: "30.06.2020", amount: 7560.050),
    ];

    return bordroList;
  }
}
