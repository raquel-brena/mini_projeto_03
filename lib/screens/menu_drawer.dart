
import 'package:mini_projeto_03/components/button_menu.dart';
import 'package:flutter/material.dart';


class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});


  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: 340,
      child: SafeArea(
        child: Container(
          child: Column(
            children: [
              ButtonMenu(
                title: "Home",
                icon: Icons.home,
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              ),
                ButtonMenu(
                title: "Adicionar lugar",
                icon: Icons.add_location_alt,
                onTap: () {
                  Navigator.pushNamed(context, '/addLugar');
                },
              ),
               ButtonMenu(
                title: "Gerenciar lugares",
                icon: Icons.place,
                onTap: () {
                  Navigator.pushNamed(context, '/gerenciarLugares');
                },
              ),
               ButtonMenu(
                title: "Gerenciar países",
                icon: Icons.map,
                onTap: () {
                  Navigator.pushNamed(context, '/gerenciarPaises');
                },
              ),
              ButtonMenu(
                title: "Lugares favoritos",
                icon: Icons.favorite,
                onTap: () {
                  Navigator.pushNamed(context, '/favoritos');
                },
              ),
            ],
          ),
         
        ),
      ),
    );
  }
}
