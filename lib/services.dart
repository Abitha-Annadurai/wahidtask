import 'dart:async';
import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:wahidtask/user_model.dart';

class ApiServices {
  String endpoint = 'https://api.github.com/search/repositories?q=created:>2022-04-29&sort=stars&order=desc';

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));
    if(response.statusCode == 200){
      final List result = json.decode(response.body)['items'];
     // var saldo = result["items"];
      //print(saldo);
      return result.map((e) => UserModel.fromJson(e)).toList();
      //return result;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }


  /*Future<Map<String, dynamic>> getUsers() async {
    final response = await get(Uri.parse(endpoint));
    if (response.statusCode == 200){
      final json = jsonDecode(response.body);
      Map<String, dynamic> data = json['rates'];
      print(data);
      return data;
    }else{
      throw Exception('Faileddddd');
    }
  }*/
}


final userProvider = Provider<ApiServices>((ref) => ApiServices());
final userString = Provider<String>((ref) => 'fdg');