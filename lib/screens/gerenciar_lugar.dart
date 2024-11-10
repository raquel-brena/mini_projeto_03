import 'package:mini_projeto_03/components/item_list.dart';
import 'package:mini_projeto_03/screens/lugarForm.dart';
import 'package:mini_projeto_03/data/providers/lugar_provider.dart';
import 'package:mini_projeto_03/screens/menu_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GerenciarLugarScreen extends StatelessWidget {
  const GerenciarLugarScreen({super.key});


  @override
  Widget build(BuildContext context) {
    
    var _providerLugar = Provider.of<LugarProvider>(context, listen: true);

    return Scaffold(
      drawer: MenuDrawer(),
      appBar: AppBar(
        backgroundColor: ThemeData().primaryColor,
        title: const Text(
          "Gerenciar lugares",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body:   Column(
        
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
                     Navigator.pushNamed(context, '/addLugar');
                  },
                  label: const Text("Adicionar Novo Lugar",),
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
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _providerLugar.getLugares.length,
              itemBuilder: (context, index) {
                return ItemList(lugar: _providerLugar.getLugares.elementAt(index), index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}
