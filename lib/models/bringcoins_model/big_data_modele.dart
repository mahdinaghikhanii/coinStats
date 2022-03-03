import 'package:coinstats/models/bringcoins_model/data_model.dart';
import 'package:coinstats/models/bringcoins_model/status_model.dart';

class BigDataModele {
  final StatusModel statusModel;
  final List<DataModel> dataModel;
  BigDataModele({required this.statusModel, required this.dataModel});

  factory BigDataModele.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<DataModel> dataModelList =
        dataList.map((e) => DataModel.fromJson(e)).toList();
    return BigDataModele(
      statusModel: StatusModel.fromJson(json["status"]),
      dataModel: dataModelList,
    );
  }
  BigDataModele.withError(String error)
      : statusModel = StatusModel(error, 0, error, 0, 0, error, 0),
        dataModel = [];
}
