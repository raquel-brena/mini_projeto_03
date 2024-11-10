

import 'package:mini_projeto_03/screens/lugarForm.dart';
import 'package:mini_projeto_03/screens/lugares_favoritos.dart';
import 'package:mini_projeto_03/screens/paisForm.dart';
import 'package:mini_projeto_03/data/providers/lugar_provider.dart';
import 'package:mini_projeto_03/data/providers/pais_provider.dart';
import 'package:mini_projeto_03/screens/gerenciar_lugar.dart';
import 'package:mini_projeto_03/screens/gerenciar_pais.dart';
import 'package:mini_projeto_03/screens/lugares_por_pais.dart';
import 'package:mini_projeto_03/screens/pais_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(
      MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => LugarProvider()),
        ChangeNotifierProvider(create: (context) => PaisProvider()),
      ],
      child: MeuApp(),
    ),
  );
}

class MeuApp extends StatelessWidget {
   MeuApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    initialRoute: '/',
  
    routes: {
      '/' : (context) => PaisScreen(),
      '/lugaresPais' : (context) => LugarPorPaisScreen(),
      '/gerenciarPaises' : (context) => GerenciarPaisScreen(),
      '/gerenciarLugares' : (context) => GerenciarLugarScreen(),
      '/addPais': (context) => PaisForm(),
      '/addLugar': (context) => LugarForm(),
      '/favoritos': (context) => LugaresFavoritos(),
    },
  );
  }
}