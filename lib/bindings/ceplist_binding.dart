import 'package:buscador_de_cep/controller/cep_list_controller.dart';
import 'package:buscador_de_cep/repositories/cep_list_repository.dart';
import 'package:get/get.dart';

class CepListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CepListRepository>(() => CepListRepository());
    Get.lazyPut<CepListController>(
        () => CepListController(Get.find<CepListRepository>()),
        fenix: true);
  }
}
