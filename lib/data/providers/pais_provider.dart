import 'package:mini_projeto_03/model/pais.dart';
import 'package:flutter/material.dart';
import '../dados.dart';

class PaisProvider with ChangeNotifier { 
  List<Pais> _paisesData = List.from(paises);
  Pais? clickedPais = null;

  List<Pais> get getPaises => _paisesData;
  Pais get getClickedPais => clickedPais!;


  void addPais(Pais pais) {
    _paisesData.add(pais);
    notifyListeners();
  }

  void removePais(Pais pais) {
    _paisesData.remove(pais);
    notifyListeners();
  }

  void updatePais(Pais pais) {
    final index = _paisesData.indexWhere((element) => element.id == pais.id);
    _paisesData[index] = pais;
    notifyListeners();
  }

  Pais getPaisById(String id) {
    return _paisesData.firstWhere((element) => element.id == id);
  }

  void clickPais(Pais pais) {
    clickedPais = pais;
    notifyListeners();
  }

}