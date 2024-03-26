import 'dart:convert';

import 'package:http/http.dart' as http;

class ViaCEP {
  Future<Map<dynamic, dynamic>> retornarCEP(String cep) async {
    var url = Uri.parse("https://viacep.com.br/ws/$cep/json/");
    var retorno = await http.get(url);
    var decodeResponse = jsonDecode(utf8.decode(retorno.bodyBytes)) as Map;
    print(decodeResponse);
    return decodeResponse;
  }
}
