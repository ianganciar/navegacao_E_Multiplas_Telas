import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingsSreens extends StatelessWidget {
  const SettingsSreens({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Configuracoes'),
        ),
      ),
      body: const Center(
        child: Text('Configuracoes'),
      ),
    );
  }
}
