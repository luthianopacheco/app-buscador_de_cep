import 'package:buscador_de_cep/bindings/ceplist_binding.dart';
import 'package:buscador_de_cep/bindings/viacep_binding.dart';
import 'package:buscador_de_cep/controller/cep_list_controller.dart';
import 'package:buscador_de_cep/controller/viacep_controller.dart';
import 'package:buscador_de_cep/pages/cep_edit_page.dart';
import 'package:buscador_de_cep/pages/cep_list_page.dart';
import 'package:buscador_de_cep/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Buscador de CEP BR',
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
      defaultTransition: Transition.noTransition,
      initialRoute: '/home',
      initialBinding: ViaCepBinding(),
      getPages: [
        GetPage(
          name: '/home',
          page: () => HomePage(
              Get.find<ViaCepController>(), Get.find<CepListController>()),
          bindings: [ViaCepBinding(), CepListBinding()],
        ),
        GetPage(
            name: '/cepList',
            page: () => CepListPage(Get.find<CepListController>()),
            binding: CepListBinding()),
        GetPage(
            name: '/cepEdit',
            page: () => CepEditPage(Get.find<CepListController>()),
            binding: CepListBinding()),
      ],
    );
  }
}
