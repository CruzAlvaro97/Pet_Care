import 'package:flutter/material.dart';
import 'package:pet_society/providers/usuario_provider.dart';
import 'package:pet_society/src/preferences/user_preferences.dart';
import 'package:pet_society/src/utils/index_utils.dart';
import 'package:pet_society/src/views/pages/home_page/home_subpages/ayuda_subpage.dart';
import 'package:pet_society/src/views/pages/home_page/home_subpages/en_adopcion_subpage.dart';
import 'package:pet_society/src/views/pages/home_page/home_subpages/home_subpage.dart';
import 'package:pet_society/src/views/pages/home_page/home_subpages/profile_subpage.dart';
import 'package:pet_society/src/views/pages/home_page/home_subpages_admin/ayuda_subpage_admin.dart';
import 'package:pet_society/src/views/pages/home_page/home_subpages_admin/busqueda_subpage_admi.dart';
import 'package:pet_society/src/views/pages/home_page/home_subpages_admin/en_adopcion_subpage_admin.dart';
import 'package:pet_society/src/views/pages/home_page/home_subpages_admin/panel_subpage_admin.dart';
import 'package:pet_society/src/views/pages/home_page/home_subpages_admin/profile_subpage_admin.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectIndex = 0;

  static const List<Widget> _widgetOptions = [
    HomeSubPage(),
    EnAdopcionSubPage(),
    AyudaSubPage(),
    ProfileSubPage(),
  ];

  static const List<Widget> _widgetOptionsAdmin = [
    PanelSubPageAdmin(),
    EnAdopcionSubPageAdmin(),
    AyudaSubPageAdmin(),
    BusquedaSubPageAdmin(),
    ProfileSubPageAdmin(),
  ];

  void _seletedOption(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UsuarioProvider>(context);

    if (userProvider.isLoading == true &&
        PreferencesUser.nombreUsuario.isEmpty) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (PreferencesUser.id == 5) {
      return Scaffold(
        body: Center(
          child: _widgetOptionsAdmin.elementAt(_selectIndex),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            color: Colors.white,
          ),
          child: SalomonBottomBar(
            selectedColorOpacity: 0.3,
            selectedItemColor: CustomColor.primary,
            unselectedItemColor: CustomColor.grey,
            currentIndex: _selectIndex,
            onTap: _seletedOption,
            items: [
              SalomonBottomBarItem(
                icon: const Icon(Icons.home),
                title: Text(
                  "Inicio",
                  style: CustomTextStyle.text,
                ),
                selectedColor: CustomColor.primary,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.gas_meter_sharp),
                title: Text(
                  "Adopciones",
                  style: CustomTextStyle.text,
                ),
                selectedColor: CustomColor.primary,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.help),
                title: Text(
                  "Ayuda",
                  style: CustomTextStyle.text,
                ),
                selectedColor: CustomColor.primary,
              ),
              SalomonBottomBarItem(
                icon: const Icon(Icons.search),
                title: Text(
                  "Búsquedas",
                  style: CustomTextStyle.text,
                ),
                selectedColor: CustomColor.primary,
              ),
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
        ),
      );
    } else {
      return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectIndex),
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            color: Colors.white,
          ),
          child: SalomonBottomBar(
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
        ),
      );
    }
  }
}
