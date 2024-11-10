import 'package:mini_projeto_03/model/lugar.dart';
import 'package:mini_projeto_03/model/pais.dart';
import 'package:flutter/material.dart';
import '../dados.dart';

class LugarProvider with ChangeNotifier { 
  List<Lugar> _lugaresData = List.from(lugares); 
  List <String> _lugaresFavoritos = [];

  List<Lugar> get getLugares => _lugaresData;
  List<Lugar> get getLugaresFavoritos => _getLugaresFavoritos();

 void addLugar (Lugar lugar) {

  
   _lugaresData.add(lugar);
   notifyListeners();
 }

  void removeLugar (Lugar lugar) {
    _lugaresData.remove(lugar);
    notifyListeners();
  }

  void updateLugar (Lugar lugar) {
    final index = _lugaresData.indexWhere((element) => element.id == lugar.id);
    _lugaresData[index] = lugar;
    notifyListeners();
  }

  Lugar getLugarById (String id) {
    return _lugaresData.firstWhere((element) => element.id == id);
  }

  void favoritarLugar (String id) {
    final lugar = getLugarById(id);
    if (_lugaresFavoritos.contains(lugar.id)) {
      return;
    }
    
    _lugaresFavoritos.add(id);
    notifyListeners();
  }

 void desfavoritarLugar (String id) {
    final lugar = getLugarById(id);
    if (lugar == null) {
      return;
    }
    _lugaresFavoritos.remove(id);
    notifyListeners();
 }

 List<Lugar> _getLugaresFavoritos () {
   return _lugaresData.where((lugar) => _lugaresFavoritos
    .contains(lugar.id)).toList();
 }

 bool isFavorito (String id) {
  return _lugaresFavoritos.contains(id);
 } } 