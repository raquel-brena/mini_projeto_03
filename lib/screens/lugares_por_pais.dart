import 'package:mini_projeto_03/components/item_lugar.dart';
import 'package:mini_projeto_03/data/dados.dart';
import 'package:mini_projeto_03/data/providers/lugar_provider.dart';
import 'package:mini_projeto_03/data/providers/pais_provider.dart';
import 'package:mini_projeto_03/model/lugar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LugarPorPaisScreen extends StatelessWidget {
  LugarPorPaisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _providerPais = Provider.of<PaisProvider>(context, listen: true);
    var _providerLugar = Provider.of<LugarProvider>(context, listen: true);

    // Prepara a lista de lugares por pais
    final List<Lugar> lugaresPorPais = _providerPais.clickedPais != null
        ? lugares.where((lugar) {
            return lugar.paises.contains(_providerPais.clickedPais!.id);
          }).toList()
        : [];

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: _providerPais.clickedPais?.cor,
          title: Text(
            "Lugares em ${_providerPais.clickedPais?.titulo}",
            style: const TextStyle(color: Colors.white),
          ),
          bottom: TabBar(
            tabs: <Widget>[
              Tab(
                  icon: Icon(
                Icons.list,
                color: Colors.white,
              )),
              Tab(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            ListView.builder(
              itemCount: lugaresPorPais.length,
              itemBuilder: (context, index) {
                return ItemLugar(lugar: lugaresPorPais.elementAt(index));
              },
            ),
            _providerLugar.getLugaresFavoritos.isEmpty
                ? Center(child: Text('Nenhum lugar favoritado'))
                : Center(
                    child: ListView.builder(
                      itemCount: _providerLugar.getLugaresFavoritos.length,
                      itemBuilder: (context, index) {
                        return ItemLugar(
                            lugar: _providerLugar.getLugaresFavoritos
                                .elementAt(index));
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
