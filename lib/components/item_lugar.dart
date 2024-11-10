import 'package:mini_projeto_03/data/providers/lugar_provider.dart';
import 'package:mini_projeto_03/model/lugar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ItemLugar extends StatelessWidget {
  const ItemLugar({super.key, required this.lugar});

  final Lugar lugar;

  @override
  Widget build(BuildContext context) {
    var _providerLugar = Provider.of<LugarProvider>(context, listen: true);
    bool isFavorito = _providerLugar.isFavorito(lugar.id);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Stack(children: <Widget>[
            ClipRRect(
              //bordas na imagem
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                lugar.imagemUrl,
                height: 250,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 10,
              right: 10,
              child: IconButton(
                icon: isFavorito
                    ? Icon(Icons.favorite)
                    : Icon(Icons.favorite_outline),
                onPressed: () {
                  isFavorito
                      ? _providerLugar.desfavoritarLugar(lugar.id)
                      : _providerLugar.favoritarLugar(lugar.id);
                },
              ),
            ),
            Positioned(
              //só funciona no contexto do Stack - posso posicionar o elemento
              right: 10,
              bottom: 20,
              child: Container(
                width: 300,
                color: Colors.black54,
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: Text(
                  lugar.titulo,
                  style: TextStyle(fontSize: 26, color: Colors.white),
                  softWrap: true, //quebra de lina
                  overflow: TextOverflow.fade, //case de overflow
                ),
              ),
            )
          ]),
          //Text(place.titulo),
          Padding(
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(Icons.star),
                    SizedBox(
                      width: 6,
                    ),
                    Text('${lugar.avaliacao}/5')
                  ],
                ),
                Row(
                  children: <Widget>[
                    Icon(Icons.attach_money),
                    SizedBox(
                      width: 6,
                    ),
                    Text('custo: R\$${lugar.custoMedio}')
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
