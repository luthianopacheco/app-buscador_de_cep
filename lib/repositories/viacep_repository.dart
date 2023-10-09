import 'dart:convert';

import 'package:buscador_de_cep/models/viacep_model.dart';
import 'package:http/http.dart' as http;

class ViaCepRepository {
  Future<ViaCepModel> getData(String cep) async {
    final response =
        await http.get(Uri.parse('https://viacep.com.br/ws/$cep/json/'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return ViaCepModel.fromJson(data);
    } else {
      return ViaCepModel();
    }
  }
}
