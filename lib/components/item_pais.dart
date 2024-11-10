import 'package:mini_projeto_03/data/providers/pais_provider.dart';
import 'package:mini_projeto_03/model/pais.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ItemPais extends StatelessWidget {
  ItemPais({super.key, required Pais pais}) : _pais = pais;

  final Pais _pais;

 void _clickPais (BuildContext context) {
   Provider.of<PaisProvider>(context, listen: false).clickedPais = _pais;
     Navigator.pushNamed(context, '/lugaresPais');
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
         onTap: () {
         _clickPais(context);
        },
        child: Container(
          padding: EdgeInsets.all(15),
          child: Text(
            _pais.titulo,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18,),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: LinearGradient(
                colors: [
                  _pais.cor.withOpacity(0.5), //cor passad com opacidade
                  _pais.cor, //cor passada
                ],
                begin: Alignment.topLeft, //inicio do gradiente
                end: Alignment.bottomRight // fim
                ),
          ),
        ),
      ),
    );
  }
}
