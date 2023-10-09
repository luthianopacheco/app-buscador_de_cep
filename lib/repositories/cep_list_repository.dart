import 'package:buscador_de_cep/models/cep_list_model.dart';
import 'package:dio/dio.dart';

class CepListRepository {
  final _dio = Dio();

  CepListRepository() {
    _dio.options.headers["X-Parse-Application-Id"] =
        "WBivAisZa3CaHbdDANwWUI7v2ku1JmfWd7s2VvY9";
    _dio.options.headers["X-Parse-REST-API-Key"] =
        "m2rKClWURubU9Ss4D94DZsLoEuoF9yjN6zl9VIXT";
    _dio.options.headers["Content-Type"] = "application/json";
    _dio.options.baseUrl = 'https://parseapi.back4app.com/classes';
  }

  Future<List<CepListModel>> getData() async {
    try {
      final response = await _dio.get('/cep');
      final data = response.data['results'];
      return data.map<CepListModel>((e) => CepListModel.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> saveData(CepListModel cepListModel) async {
    try {
      await _dio.post("/cep", data: cepListModel.toJsonSimplified());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateData(CepListModel cepListModel) async {
    try {
      await _dio.put("/cep/${cepListModel.objectId}",
          data: cepListModel.toJsonSimplified());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteData(String objectId) async {
    try {
      await _dio.delete("/cep/$objectId");
    } catch (e) {
      rethrow;
    }
  }
}
