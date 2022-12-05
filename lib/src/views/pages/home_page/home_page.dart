import 'package:flutter/material.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;

  static List<Widget> widgetOption = const [
    Text('Inicio'),
    Text('En adopción'),
    Text('Apoyo'),
    Text('Perfil'),
  ];
  void _seletedOption(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // SubPaginas
      body: Center(
        child: widgetOption.elementAt(_selectIndex),
      ),
      //
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      // BottomBar Salomon
      bottomNavigationBar: SalomonBottomBar(
        selectedColorOpacity: 0.3,
        selectedItemColor: CustomColor.primary,
        unselectedItemColor: CustomColor.grey,
        currentIndex: _selectIndex,
        onTap: _seletedOption,
        items: [
          /// Inicio
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: Text(
              "Inicio",
              style: CustomTextStyle.text,
            ),
            selectedColor: CustomColor.primary,
          ),

          /// En Adopción
          SalomonBottomBarItem(
            icon: const Icon(Icons.pets),
            title: Text(
              "En Adopción",
              style: CustomTextStyle.text,
            ),
            selectedColor: CustomColor.primary,
          ),

          /// Apoyo
          SalomonBottomBarItem(
            icon: const Icon(Icons.medical_services),
            title: Text(
              "Apoyo",
              style: CustomTextStyle.text,
            ),
            selectedColor: CustomColor.primary,
          ),

          /// Perfil
          SalomonBottomBarItem(
            icon: const Icon(Icons.person),
            title: Text(
              "Perfil",
              style: CustomTextStyle.text,
            ),
            selectedColor: CustomColor.primary,
          ),
        ],
      ),
    );
  }
}
