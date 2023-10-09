import 'package:buscador_de_cep/controller/cep_list_controller.dart';
import 'package:buscador_de_cep/shared/widgets/custom_appbar.dart';
import 'package:buscador_de_cep/shared/widgets/custom_snackbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CepEditPage extends StatelessWidget {
  final CepListController _controller;
  const CepEditPage(this._controller, {super.key});

  @override
  Widget build(BuildContext context) {
    var index = Get.arguments;
    var item = _controller.cepList[index];
    final formKey = GlobalKey<FormState>();
    final cepController = TextEditingController(text: item.cep);
    final logradouroController = TextEditingController(text: item.logradouro);
    final complementoController = TextEditingController(text: item.complemento);
    final bairroController = TextEditingController(text: item.bairro);
    final localidadeController = TextEditingController(text: item.localidade);
    final ufController = TextEditingController(text: item.uf);
    final dddController = TextEditingController(text: item.ddd);
    final ibgeController = TextEditingController(text: item.ibge);
    final siafiController = TextEditingController(text: item.siafi);
    final giaController = TextEditingController(text: item.gia);

    var maskCepFormatter = MaskTextInputFormatter(
        mask: '#####-###',
        filter: {"#": RegExp(r'[0-9]')},
        type: MaskAutoCompletionType.lazy);

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        appBar: customAppBar('Editar', 'cepList'),
        body: Padding(
          padding: const EdgeInsets.all(6),
          child: SizedBox(
            child: Card(
              elevation: 10,
              shape: ContinuousRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: formKey,
                  child: ListView(
                    children: [
                      const SizedBox(height: 30),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "Detalhes",
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const Divider(thickness: 1.5, color: Color(0xff0474ac)),
                      const SizedBox(height: 25),
                      Center(
                        child: customTextFormField(
                          controller: cepController,
                          labelText: 'CEP',
                          cepLenghtValidate: cepController.text.length,
                          keyboardType: TextInputType.number,
                          maxWidthConstraints: 140,
                          formatter: maskCepFormatter,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: customTextFormField(
                            controller: logradouroController,
                            labelText: 'Logradouro / Nome',
                            maxWidthConstraints: 280),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          customTextFormField(
                              controller: complementoController,
                              labelText: 'Complemento',
                              isToValidate: false,
                              maxWidthConstraints: 145),
                          customTextFormField(
                              controller: bairroController,
                              labelText: 'Bairro',
                              maxWidthConstraints: 190),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: customTextFormField(
                            controller: localidadeController,
                            labelText: 'Cidade / Localidade',
                            maxWidthConstraints: 280),
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          customTextFormField(
                              controller: ufController,
                              labelText: 'UF',
                              maxLength: 2,
                              capitalization: TextCapitalization.characters,
                              maxWidthConstraints: 100),
                          customTextFormField(
                              controller: dddController,
                              labelText: 'DDD',
                              maxLength: 2,
                              keyboardType: TextInputType.number,
                              maxWidthConstraints: 100),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          customTextFormField(
                              controller: ibgeController,
                              labelText: 'IBGE',
                              maxLength: 7,
                              keyboardType: TextInputType.number,
                              maxWidthConstraints: 140),
                          customTextFormField(
                              controller: siafiController,
                              labelText: 'SIAFI',
                              maxLength: 11,
                              keyboardType: TextInputType.number,
                              maxWidthConstraints: 150),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Center(
                        child: customTextFormField(
                            controller: giaController,
                            labelText: 'GIA',
                            maxLength: 7,
                            keyboardType: TextInputType.number,
                            isToValidate: false,
                            maxWidthConstraints: 130),
                      ),
                      const SizedBox(height: 25),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 130,
                            child: FilledButton(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0xff0474ac))),
                                onPressed: () {
                                  Get.toNamed('/cepList');
                                },
                                child: const Text("Cancelar")),
                          ),
                          SizedBox(
                            width: 130,
                            child: FilledButton(
                                style: const ButtonStyle(
                                    backgroundColor: MaterialStatePropertyAll(
                                        Color(0xff0474ac))),
                                onPressed: () async {
                                  if (formKey.currentState!.validate()) {
                                    await _controller.updateData(
                                        objectId: item.objectId.toString(),
                                        cep: cepController.text,
                                        logradouro: logradouroController.text,
                                        complemento: complementoController.text,
                                        bairro: bairroController.text,
                                        localidade: localidadeController.text,
                                        uf: ufController.text,
                                        ibge: ibgeController.text,
                                        gia: giaController.text,
                                        ddd: dddController.text,
                                        siafi: siafiController.text);

                                    // ignore: use_build_context_synchronously
                                    customSnackBar(context,
                                        text: 'CEP atualizado com sucesso!');
                                    Get.toNamed('/cepList');
                                  } else {
                                    await customSnackBar(context,
                                        text:
                                            'Preencha os campos corretamente!');
                                  }
                                },
                                child: const Text("Salvar")),
                          )
                        ],
                      ),
                      const SizedBox(height: 25)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  customTextFormField(
      {double maxWidthConstraints = double.infinity,
      int maxLength = 30,
      var keyboardType = TextInputType.text,
      TextCapitalization capitalization = TextCapitalization.words,
      var formatter,
      bool isToValidate = true,
      var cepLenghtValidate,
      required controller,
      required labelText}) {
    return SizedBox(
      height: 70,
      child: TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        maxLength: maxLength,
        validator: (value) {
          if (value == null || value.isEmpty && isToValidate) {
            return "Campo obrigatório!";
          }
          if (value.length != 9 && labelText == 'CEP') {
            return "8 números!";
          }
          if (value.length != 2 && (labelText == 'UF' || labelText == 'DDD')) {
            return "2 caracteres!";
          }
          return null;
        },
        inputFormatters: [
          formatter ??
              FilteringTextInputFormatter.deny(
                  RegExp(r'[-.,\\"\[\]\{\}_><;:?!@#$%&*\(\)=+|]'))
        ],
        textAlignVertical: TextAlignVertical.top,
        textCapitalization: capitalization,
        onTapOutside: (event) => FocusManager.instance.primaryFocus?.unfocus(),
        decoration: InputDecoration(
          counterText: '',
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          label: Text(
            labelText,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            strutStyle: const StrutStyle(),
          ),
          constraints:
              BoxConstraints(maxWidth: maxWidthConstraints, maxHeight: 50),
          border: const OutlineInputBorder(
              borderSide: BorderSide(width: 2),
              borderRadius: BorderRadius.all(Radius.circular(20))),
        ),
      ),
    );
  }
}
