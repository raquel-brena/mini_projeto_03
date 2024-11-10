import 'package:mini_projeto_03/components/item_list.dart';
import 'package:mini_projeto_03/screens/paisForm.dart';
import 'package:mini_projeto_03/data/providers/pais_provider.dart';
import 'package:mini_projeto_03/screens/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GerenciarPaisScreen extends StatelessWidget {
  const GerenciarPaisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var _providerPais = Provider.of<PaisProvider>(context, listen: true);


    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        backgroundColor: ThemeData().primaryColor,
        title: const Text(
          "Gerenciar países",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(28),
                  bottomRight: Radius.circular(28)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                     onPressed: () {
                    Navigator.pushNamed(context, '/addPais');
                  },
                  label: const Text("Adicionar Novo País",),
                  icon:  Icon(
                    Icons.add,
                    size: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(horizontal: 90, vertical: 2),
                  ),
                ),
              ],
            ),
            // if (,
          ),
          Expanded(
              child: _providerPais.getPaises.length > 0
                  ? ListView.builder(
                      itemCount: _providerPais.getPaises.length,
                      itemBuilder: (context, index) {
                        return ItemList(
                            pais: _providerPais.getPaises.elementAt(index),
                            index: index);
                      },
                    )
                  : Center(
                      child: Text('Nenhum país cadastrado!'),
                    )),
        ],
      ),
    );
  }
}
