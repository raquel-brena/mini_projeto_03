import 'package:mini_projeto_03/components/item_lugar.dart';
import 'package:mini_projeto_03/data/dados.dart';
import 'package:mini_projeto_03/data/providers/lugar_provider.dart';
import 'package:mini_projeto_03/data/providers/pais_provider.dart';
import 'package:mini_projeto_03/model/lugar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LugaresFavoritos extends StatelessWidget {
  LugaresFavoritos({super.key});

  @override
  Widget build(BuildContext context) {
    var _providerLugar = Provider.of<LugarProvider>(context, listen: true);

    // Prepara a lista de lugares por pais

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white70,
          title: Text(
            "Lugares favoritos",
            style: const TextStyle(color: Colors.black),
          ),
        ),
        body: Center(
          child: _providerLugar.getLugaresFavoritos.isEmpty
              ? Text('Nenhum lugar favoritado')
              : ListView.builder(
                  itemCount: _providerLugar.getLugaresFavoritos.length,
                  itemBuilder: (context, index) {
                    return ItemLugar(
                        lugar: _providerLugar.getLugaresFavoritos
                            .elementAt(index));
                  },
                ),
        ),
      ),
    );
  }
}
