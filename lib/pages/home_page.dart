import 'package:buscador_de_cep/controller/cep_list_controller.dart';
import 'package:buscador_de_cep/controller/viacep_controller.dart';
import 'package:buscador_de_cep/models/viacep_model.dart';
import 'package:buscador_de_cep/shared/widgets/cep_result.dart';
import 'package:buscador_de_cep/shared/widgets/custom_alert_dialog.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  final ViaCepController _controllerApi;
  final CepListController _controllerDB;

  const HomePage(this._controllerApi, this._controllerDB, {super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var itemApi = ViaCepModel();
  final _textController = TextEditingController();
  final favoriteIconVisible = false.obs;
  final formFieldIconVisible = false.obs;
  final cardVisible = false.obs;
  final emptyResult = true.obs;
  final alreadyExist = false.obs;

  var maskFormatter = MaskTextInputFormatter(
      mask: '#####-###',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  void initState() {
    Get.find<ViaCepController>();
    Get.find<CepListController>();
    widget._controllerDB.getData();
    _textController.clear();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      'assets/images/logo.png',
                      height: 80,
                    ),
                    const SizedBox(width: 10),
                    const Text(
                      "Buscador de CEP",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 28),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Obx(
                  () => TextFormField(
                    controller: _textController,
                    onTapOutside: (event) =>
                        FocusManager.instance.primaryFocus?.unfocus(),
                    inputFormatters: [
                      maskFormatter,
                    ],
                    keyboardType: TextInputType.number,
                    textAlignVertical: TextAlignVertical.top,
                    decoration: InputDecoration(
                        labelText: 'CEP',
                        suffixIcon: formFieldIconVisible.value
                            ? IconButton(
                                onPressed: () {
                                  _textController.clear();
                                  formFieldIconVisible.value = false;
                                  favoriteIconVisible.value = false;
                                  emptyResult.value = true;
                                },
                                icon: const Icon(Icons.close),
                              )
                            : const SizedBox(),
                        constraints:
                            const BoxConstraints(maxWidth: 200, maxHeight: 40),
                        border: const OutlineInputBorder(
                            borderSide: BorderSide(width: 2),
                            borderRadius:
                                BorderRadius.all(Radius.circular(20)))),
                    onChanged: (value) async {
                      var cep = value.replaceAll(RegExp(r'[^0-9]'), '');

                      if (value.isEmpty) {
                        formFieldIconVisible.value = false;
                      } else {
                        formFieldIconVisible.value = true;
                      }
                      if (cep.length == 8) {
                        FocusScope.of(context).unfocus();
                        itemApi = await widget._controllerApi.getData(cep);
                        emptyResult.value = false;
                        if (itemApi.cep == null || itemApi.cep == '') {
                          favoriteIconVisible.value = false;
                          cardVisible.value = false;
                        } else {
                          cardVisible.value = true;
                          favoriteIconVisible.value = true;
                        }
                      } else {
                        favoriteIconVisible.value = false;
                      }
                      if (cep.length < 8) {
                        emptyResult.value = true;
                      }
                    },
                  ),
                ),
                const SizedBox(height: 40),
                Obx(() => widget._controllerApi.isLoading.value
                    ? const CircularProgressIndicator()
                    : cardVisible.value && !emptyResult.value
                        ? buildCard()
                        : emptyResult.value
                            ? const SizedBox()
                            : Column(
                                children: [
                                  Image.asset(
                                    'assets/images/not-found.png',
                                    height: 50,
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
                                    "CEP não encontrado!",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ))
              ],
            ),
          ),
        ),
        floatingActionButton: Obx(
          () => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const SizedBox(width: 30),
                  FloatingActionButton(
                    heroTag: 'listButton',
                    backgroundColor: const Color(0xff0474ac),
                    tooltip: 'Lista de CEP\'s',
                    onPressed: () {
                      Get.toNamed('/cepList');
                    },
                    child: const Icon(Icons.list),
                  ),
                ],
              ),
              Visibility(
                visible: favoriteIconVisible.value,
                child: FloatingActionButton(
                  heroTag: 'favoriteButton',
                  tooltip: "Favoritar CEP",
                  backgroundColor: const Color(0xff0474ac),
                  onPressed: () async {
                    await widget._controllerDB.getData();
                    var itemDB = widget._controllerDB.cepList;

                    for (var i = 0; i < itemDB.length; i++) {
                      if (itemDB[i].cep == itemApi.cep) {
                        alreadyExist.value = true;
                      }
                    }

                    if (alreadyExist.value == true) {
                      // ignore: use_build_context_synchronously
                      customAlertDialogMessage(context,
                          text: 'Este CEP já está cadastrado em sua lista!');
                      alreadyExist.value = false;
                    } else {
                      await widget._controllerDB.saveData(
                          cep: itemApi.cep.toString(),
                          logradouro: itemApi.logradouro.toString(),
                          complemento: itemApi.complemento.toString(),
                          bairro: itemApi.bairro.toString(),
                          localidade: itemApi.localidade.toString(),
                          uf: itemApi.uf.toString(),
                          ibge: itemApi.ibge.toString(),
                          gia: itemApi.gia.toString(),
                          ddd: itemApi.ddd.toString(),
                          siafi: itemApi.siafi.toString());
                      // ignore: use_build_context_synchronously
                      customAlertDialogMessage(context,
                          text: 'CEP salvo com sucesso!');
                    }
                  },
                  child: const Icon(Icons.favorite),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCard() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      height: 300,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 4.1),
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.amber, borderRadius: BorderRadius.circular(13)),
          ),
          Column(
            children: [
              const SizedBox(height: 0.5),
              SizedBox(
                width: double.infinity,
                child: Card(
                  elevation: 5,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: showCepResult(
                      logradouro: itemApi.logradouro.toString(),
                      complemento: '- ${itemApi.complemento.toString()}',
                      bairro: itemApi.bairro.toString(),
                      localidade: itemApi.localidade.toString(),
                      uf: itemApi.uf.toString(),
                      cep: itemApi.cep.toString(),
                      ddd: itemApi.ddd.toString(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
