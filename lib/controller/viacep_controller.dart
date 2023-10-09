import 'package:buscador_de_cep/repositories/viacep_repository.dart';
import 'package:get/get.dart';

class ViaCepController extends GetxController {
  final ViaCepRepository _repository;
  ViaCepController(this._repository);

  RxBool isLoading = false.obs;

  getData(String cep) async {
    try {
      isLoading.value = true;
      final response = await _repository.getData(cep);
      isLoading.value = false;

      return response;
    } catch (e) {
      rethrow;
    }
  }
}
