import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;


class Networking{
  String url;

  Networking(this.url);

  Future getData() async{
      http.Response result = await http.get(this.url);
      if(result.statusCode==200){
        return jsonDecode(result.body);
      }else{
        print(result.statusCode);
      }

  }
}