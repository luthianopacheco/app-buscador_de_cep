import 'package:buscador_de_cep/controller/cep_list_controller.dart';
import 'package:buscador_de_cep/shared/widgets/cep_result.dart';
import 'package:buscador_de_cep/shared/widgets/custom_alert_dialog.dart';
import 'package:buscador_de_cep/shared/widgets/custom_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class CepListPage extends StatefulWidget {
  final CepListController _controller;
  const CepListPage(this._controller, {super.key});

  @override
  State<CepListPage> createState() => _CepListPageState();
}

class _CepListPageState extends State<CepListPage> {
  @override
  void initState() {
    Get.find<CepListController>();
    widget._controller.getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget._controller.getData();
    return SafeArea(
        child: Scaffold(
      appBar: customAppBar('CEP\'s cadastrados', '/home'),
      body: Obx(
        () => widget._controller.isLoading.value
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () => widget._controller.getData(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Text(
                        "Total cadastrado: ${widget._controller.cepList.length}",
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    const Divider(
                        indent: 20,
                        endIndent: 20,
                        thickness: 2,
                        color: Color(0xff0474ac)),
                    const SizedBox(height: 15),
                    Expanded(
                      child: ListView.builder(
                        itemCount: widget._controller.cepList.length,
                        itemBuilder: (context, index) {
                          var item = widget._controller.cepList[index];
                          return Slidable(
                              closeOnScroll: true,
                              endActionPane: ActionPane(
                                  motion: const ScrollMotion(),
                                  children: [
                                    SlidableAction(
                                      autoClose: false,
                                      onPressed: (context) {
                                        Slidable.of(context)?.close(
                                            duration:
                                                const Duration(seconds: 1));
                                        widget._controller.cepList
                                            .removeAt(index);
                                        widget._controller
                                            .deleteData(item.objectId!);
                                      },
                                      backgroundColor: const Color(0xFFFE4A49),
                                      foregroundColor: Colors.white,
                                      icon: Icons.delete,
                                      label: 'Excluir',
                                    ),
                                    SlidableAction(
                                      onPressed: (context) => Get.toNamed(
                                          '/cepEdit',
                                          arguments: index),
                                      backgroundColor: const Color(0xff0474ac),
                                      foregroundColor: Colors.white,
                                      icon: Icons.edit,
                                      label: 'Editar',
                                    ),
                                  ]),
                              child: InkWell(
                                onTap: () {
                                  customAlertDialogCepInfo(
                                    context,
                                    widget: showCepResult(
                                      logradouro: item.logradouro.toString(),
                                      complemento: item.complemento.toString(),
                                      bairro: item.bairro.toString(),
                                      localidade: item.localidade.toString(),
                                      uf: item.uf.toString(),
                                      cep: item.cep.toString(),
                                      ddd: item.ddd.toString(),
                                    ),
                                  );
                                },
                                child: ListTile(
                                  leading:
                                      Image.asset('assets/images/logo.png'),
                                  title: Text(item.cep.toString()),
                                  subtitle: Text(
                                    '${item.logradouro} - ${item.localidade}',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  trailing: PopupMenuButton(
                                      itemBuilder: (BuildContext context) =>
                                          <PopupMenuEntry>[
                                            PopupMenuItem(
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                  Get.toNamed('/cepEdit',
                                                      arguments: index);
                                                },
                                                child: const Row(children: [
                                                  SizedBox(width: 15),
                                                  Icon(Icons.edit,
                                                      color: Color(0xff0474ac)),
                                                  SizedBox(width: 10),
                                                  Text('Editar')
                                                ]),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              child: InkWell(
                                                onTap: () {
                                                  Slidable.of(context)?.close(
                                                      duration: const Duration(
                                                          seconds: 1));
                                                  widget._controller.cepList
                                                      .removeAt(index);
                                                  widget._controller.deleteData(
                                                      item.objectId!);
                                                  Navigator.pop(context);
                                                },
                                                child: const Row(children: [
                                                  SizedBox(width: 15),
                                                  Icon(Icons.delete,
                                                      color: Color(0xff0474ac)),
                                                  SizedBox(width: 10),
                                                  Text('Excluir')
                                                ]),
                                              ),
                                            ),
                                          ]),
                                ),
                              ));
                        },
                      ),
                    ),
                  ],
                ),
              ),
      ),
    ));
  }
}
