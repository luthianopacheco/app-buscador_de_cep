import 'package:buscador_de_cep/controller/viacep_controller.dart';
import 'package:buscador_de_cep/repositories/viacep_repository.dart';
import 'package:get/get.dart';

class ViaCepBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViaCepRepository>(() => ViaCepRepository());
    Get.lazyPut<ViaCepController>(
        () => ViaCepController(Get.find<ViaCepRepository>()),
        fenix: true);
  }
}
