import 'package:flutter/material.dart';

customAlertDialogMessage(context, {required text}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        content: Text(
          text,
        ),
        insetPadding: const EdgeInsets.all(0),
        contentPadding:
            const EdgeInsets.only(bottom: 0, top: 20, right: 20, left: 20),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"))
        ],
      );
    },
  );
}

customAlertDialogCepInfo(context, {required widget}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(color: Colors.amber, width: 3)),
        shadowColor: const Color(0xff0474ac),
        content: widget,
        scrollable: true,
        contentPadding:
            const EdgeInsets.only(bottom: 0, top: 20, right: 20, left: 20),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("OK"))
        ],
      );
    },
  );
}

customAlertDialogWithAction(context, controller, index,
    {required content, required function}) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        shape: const ContinuousRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(color: Colors.amber, width: 3)),
        shadowColor: const Color(0xff0474ac),
        content: content,
        scrollable: true,
        contentPadding:
            const EdgeInsets.only(bottom: 0, top: 20, right: 20, left: 20),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Cancelar')),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
                function;
              },
              child: const Text('Confirmar'))
        ],
      );
    },
  );
}
