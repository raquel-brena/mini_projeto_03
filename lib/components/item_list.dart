import 'package:mini_projeto_03/components/CustomDialog.dart';
import 'package:mini_projeto_03/data/providers/lugar_provider.dart';
import 'package:mini_projeto_03/data/providers/pais_provider.dart';
import 'package:mini_projeto_03/model/lugar.dart';
import 'package:mini_projeto_03/model/pais.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ItemList extends StatelessWidget {
  final Pais? _pais;
  final Lugar? _lugar;
  final int? index;

  ItemList({super.key, Pais? pais, Lugar? lugar, required this.index})
      : _pais = pais,
        _lugar = lugar;

  String getTitulo() {
    return _pais != null ? _pais!.titulo : _lugar!.titulo;
  }

  @override
  Widget build(BuildContext context) {
    var _providerPais = Provider.of<PaisProvider>(context, listen: true);
    var _providerLugar = Provider.of<LugarProvider>(context, listen: true);

void excluir() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return CustomDialog(
        title: 'Excluir',
        content: const Text("Deseja excluir?"),
        onPressed: () {
          if (_pais != null) {
            _providerPais.removePais(_pais);
          } else {
            _providerLugar.removeLugar(_lugar!);
          }
        },
      );
    },
  );
}

void editar() {
 if (_pais != null) {
   Navigator.pushNamed(context, '/addPais', arguments: _pais);
 } else { 
    Navigator.pushNamed(context, '/addLugar', arguments: _lugar);
 }
 
}

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [
                  Theme.of(context)
                      .primaryColor
                      .withOpacity(0.2), //cor passad com opacidade
                  Theme.of(context).primaryColor.withOpacity(0.5), //cor passada
                ],
                begin: Alignment.topLeft, //inicio do gradiente
                end: Alignment.bottomRight // fim
                ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    (index! + 1).toString(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    getTitulo(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18,
                    ),
                  )
                ],
              ),
               Row(
                 children: [
                   IconButton(
                    onPressed: () => excluir(),
                    icon: const Icon(
                      Icons.restore_from_trash,
                      size: 18,
                      color: Colors.white,
                    ),
                   
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeData().primaryColor.withOpacity(0.8),
                      minimumSize: const Size(30, 30),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    ),
                                 ),
                   IconButton(
                    onPressed: () => editar(),
                    icon: const Icon(
                      Icons.edit,
                      size: 18,
                      color: Colors.white,
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: ThemeData().primaryColor.withOpacity(0.8),
                      minimumSize: const Size(30, 30),
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    ),
                                 ),
                 ],
               ),
              // if (_lugar != null)
              //   Image.network(
              //     _lugar!.imagemUrl,
              //     height: 50,
              //     width: 50,
              //   ),
            ],
          ),
        ),
      ),
    );
  }
}