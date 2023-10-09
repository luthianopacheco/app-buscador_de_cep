import 'package:buscador_de_cep/models/cep_list_model.dart';
import 'package:buscador_de_cep/repositories/cep_list_repository.dart';
import 'package:get/get.dart';

class CepListController extends GetxController {
  late final CepListRepository _repository;

  CepListController(this._repository);

  List<CepListModel> cepList = <CepListModel>[].obs;

  RxBool isLoading = false.obs;

  @override
  Future<void> onInit() async {
    super.onInit();
    getData();
  }

  getData() async {
    isLoading.value = true;

    final response = await _repository.getData();
    cepList.clear();
    cepList.addAll(response);

    isLoading.value = false;
  }

  saveData(
      {required String cep,
      required String logradouro,
      required String complemento,
      required String bairro,
      required String localidade,
      required String uf,
      required String ibge,
      required String gia,
      required String ddd,
      required String siafi}) {
    _repository.saveData(CepListModel.create(
        cep: cep,
        logradouro: logradouro,
        complemento: complemento,
        bairro: bairro,
        localidade: localidade,
        uf: uf,
        ibge: ibge,
        gia: gia,
        ddd: ddd,
        siafi: siafi));
  }

  updateData(
      {required String objectId,
      required String cep,
      required String logradouro,
      required String complemento,
      required String bairro,
      required String localidade,
      required String uf,
      required String ibge,
      required String gia,
      required String ddd,
      required String siafi}) {
    _repository.updateData(CepListModel(
        objectId: objectId,
        cep: cep,
        logradouro: logradouro,
        complemento: complemento,
        bairro: bairro,
        localidade: localidade,
        uf: uf,
        ibge: ibge,
        gia: gia,
        ddd: ddd,
        siafi: siafi));
  }

  deleteData(String objectId) {
    _repository.deleteData(objectId);
  }
}
