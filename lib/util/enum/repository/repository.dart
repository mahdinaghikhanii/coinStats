import 'package:dio/dio.dart';

class Repository {
  static String mainUrl = 'https://pro-api.coinmarketcap.com/v1/';
  final String apiKey = 'b2b16382-b6d8-4e95-a5d2-1ac4833f44c2';
  var currencyListingAPI = '${mainUrl}cryptocurrency/listings/latest';

  Dio _dio = Dio();
  Future getCoins() async {
    try {} catch (error, stackTrace) {
      print("this is Your Eror : $error      , dd $stackTrace");
      return;
    }
  }
}
