import 'package:flutter/material.dart';

Widget showCepResult(
    {required String logradouro,
    required String complemento,
    required String bairro,
    required String localidade,
    required String uf,
    required String cep,
    required String ddd}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      const Text("Logradouro / Nome",
          style: TextStyle(
              fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w600)),
      Text("$logradouro ${complemento == '- ' ? '' : complemento}",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
      const SizedBox(height: 8),
      const Text("Bairro / Distrito",
          style: TextStyle(
              fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w600)),
      Text(bairro,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
      const SizedBox(height: 8),
      const Text("Localidade / UF",
          style: TextStyle(
              fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w600)),
      Text("$localidade /$uf",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
      const SizedBox(height: 8),
      const Text("CEP",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w600)),
      Text(cep,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
      const SizedBox(height: 8),
      const Text("DDD",
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 14, color: Colors.grey, fontWeight: FontWeight.w600)),
      Text(ddd,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
    ],
  );
}
