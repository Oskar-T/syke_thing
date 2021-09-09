import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:html/parser.dart';
import 'package:http/http.dart' as http;
import 'package:translator/translator.dart';

class Controller {

  Future<dynamic> getWeb() async {

    final response =
        await http.Client().get(Uri.parse("https://syk.fi/"),
            headers: {
        "Access-Control_Allow_Origin": "*"
        });

    print(response.statusCode);
    if(response.statusCode == 200) {
      var document = parse(response.body);
      var text = document.getElementsByClassName('secondary-bg-border');
      text = text[0].getElementsByTagName("ul");
      return text;
    } else {
      throw Exception();
    }

  }

  Future<List> editElements() async {
    List elements = await getWeb();
    final translator = GoogleTranslator();
    List<String> list = List<String>.filled(5, "", growable: false);
    for(int i = 0; i < 5; i++) {
      var translation = await translator.translate(elements[i].text, from: 'fi', to: 'en');
      list[i] = translation.text;
    }
    print(list);
    return list;
  }


}