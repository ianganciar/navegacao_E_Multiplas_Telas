import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals/models/settings.dart';
import '../components/main_drawer.dart';

class SettingsSreens extends StatefulWidget {
  const SettingsSreens(this.onSettingsChanged, this.settings, {Key? key})
      : super(key: key);

  final Settings settings;
  final Function(Settings) onSettingsChanged;

  @override
  State<SettingsSreens> createState() => _SettingsSreensState();
}

class _SettingsSreensState extends State<SettingsSreens> {
  Settings? settings;

  @override
  void initState() {
    super.initState();
    settings = widget.settings;
  }

  Widget _createSwitch(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return SwitchListTile.adaptive(
        title: Text(title),
        subtitle: Text(subtitle),
        value: value,
        onChanged: (value) {
          onChanged(value);
          widget.onSettingsChanged(settings!);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('Configuracoes'),
        ),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Filtros',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              _createSwitch(
                'Sem Gluten',
                'so exibe refeicoes sem Gluten',
                settings!.isGlutenFree,
                (value) => setState(() => settings!.isGlutenFree = value),
              ),
              _createSwitch(
                'Sem Lactose',
                'so exibe refeicoes sem Lactose',
                settings!.isLactoseFree,
                (value) => setState(() => settings!.isLactoseFree = value),
              ),
              _createSwitch(
                'Vegana',
                'so exibe refeicoes sem Vegana',
                settings!.isVegan,
                (value) => setState(() => settings!.isVegan = value),
              ),
              _createSwitch(
                'Vegetariana',
                'so exibe refeicoes sem Vegetariana',
                settings!.isVegetarian,
                (value) => setState(() => settings!.isVegetarian = value),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
