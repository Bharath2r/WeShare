import 'dart:convert';

import 'package:http/http.dart';

class HttpService {
  final String postUrl = "";

  Future<Map> getData(urlStr) async {
    Response res = await get(urlStr);

    if (res.statusCode == 200) {
      Map respObj = jsonDecode(res.body);
      return respObj;
    } else {
      throw ("Cannot get data");
    }
  }

  Future<Map> postData(urlStr, params) async {
    var body = json.encode(params);
    Response response = await post(
      '$urlStr/clientAuth',
//      headers: <String, String>{
//        'Content-Type': 'application/json; charset=UTF-8',
//      },
      body: body,
    );
    if (response.statusCode == 200) {
      Map respObj = jsonDecode(response.body);
      return respObj;
      //return response.body;
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.

      throw Exception('Failed to post data ');
    }
  }
}
