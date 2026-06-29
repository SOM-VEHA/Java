import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Flutter code sample for [CupertinoAlertDialog].



class AlertDialogApp extends StatelessWidget {
  const AlertDialogApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      theme: CupertinoThemeData(brightness: .light),
      home: AlertDialogExample(),
    );
  }
}

class AlertDialogExample extends StatelessWidget {
  const AlertDialogExample({super.key});

  void _showAlertDialog(BuildContext context) {
    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Alert'),
        content: const Text('Proceed with destructive action?'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            /// This parameter indicates this action is the default,
            /// and turns the action's text to bold text.
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('No'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 200,
            width: 300,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0xFFFFFFFF)),
                left: BorderSide(color: Color(0xFFFFFFFF)),
                right: BorderSide(),
                bottom: BorderSide(),
              ),
            ),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 2.0),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: Color(0xFFDFDFDF)),
                  left: BorderSide(color: Color(0xFFDFDFDF)),
                  right: BorderSide(color: Color(0xFF7F7F7F)),
                  bottom: BorderSide(color: Color(0xFF7F7F7F)),
                ),
                color: Color(0xFFBFBFBF),
              ),
              child: const Text(
                  'OK',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF000000))
              ),
            ),
          ),
          CupertinoButton(
            onPressed: () => _showAlertDialog(context),
            child: const Text('CupertinoAlertDialog'),
          ),
        ],
      ),
    );
  }
}