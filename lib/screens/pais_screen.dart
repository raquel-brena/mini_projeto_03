import 'package:mini_projeto_03/components/item_pais.dart';
import 'package:mini_projeto_03/data/dados.dart';
import 'package:mini_projeto_03/data/providers/pais_provider.dart';
import 'package:mini_projeto_03/screens/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PaisScreen extends StatelessWidget {
  const PaisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        backgroundColor: ThemeData().primaryColor,
        title: const Text(
          "Países",
          style: TextStyle(color: Colors.white),
        ),
      ),
          body: Consumer<PaisProvider>(
        builder: (context, paisProvider, child) {
          final paises = paisProvider.getPaises;

          return GridView(
            padding: const EdgeInsets.all(16),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              mainAxisExtent: 120,
              childAspectRatio: 3 / 2,
              crossAxisSpacing: 20,
            ),
            children: paises.map((pais) => ItemPais(pais: pais)).toList(),
          );
        },
      ),
    );
  }
}
