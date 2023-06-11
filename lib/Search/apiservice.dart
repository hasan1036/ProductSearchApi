import 'dart:convert';

import 'package:http/http.dart' as http;

import 'UsersModel.dart';


class FetchProduct{

  var data = [];
  List<UsersModel> results = [];
  String fetchurl = "https://panel.supplyline.network/api/product/search-suggestions";
 Future<List<UsersModel>>getProductList({String? query}) async{
    var url = Uri.parse(fetchurl);
    var response =await http.get(url);

    try {
      if(response.statusCode == 200) {
      data = json.decode(response.body);
      results = data.map((e) => UsersModel.fromJson(e)).toList();

      if(query  != null)
        {
         // results = results.where((element) => element.data!.products!.results!.brand!.name.toLowerCasw().contains(query.toLowerCase())).toList()
        }
      }else{
        print('api error');
      }
    } on Exception catch (e) {

      print('error : $e');
    }
    return results;
  }
}