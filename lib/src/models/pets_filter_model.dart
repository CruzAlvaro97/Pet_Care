class PetsFilter {
  String typePet = 'Todos';
  String iconPet;
  String selectedIconPet = 'assets/icons/todosIcon2_enAdopcion.png';

  PetsFilter({
    required this.typePet,
    required this.iconPet,
    required this.selectedIconPet,
  });
}

List<PetsFilter> petsFilter = [
  PetsFilter(
    typePet: 'Todos',
    iconPet: 'assets/icons/todosIcon_enAdopcion.png',
    selectedIconPet: 'assets/icons/todosIcon2_enAdopcion.png',
  ),
  PetsFilter(
    typePet: 'Perros',
    iconPet: 'assets/icons/perrosIcon_enAdopcion.png',
    selectedIconPet: 'assets/icons/perrosIcon2_enAdopcion.png',
  ),
  PetsFilter(
    typePet: 'Gatos',
    iconPet: 'assets/icons/gatosIcon_enAdopcion.png',
    selectedIconPet: 'assets/icons/gatosIcon2_enAdopcion.png',
  ),
  PetsFilter(
    typePet: 'Conejos',
    iconPet: 'assets/icons/conejosIcon_enAdopcion.png',
    selectedIconPet: 'assets/icons/conejosIcon2_enAdopcion.png',
  ),
  PetsFilter(
    typePet: 'Aves',
    iconPet: 'assets/icons/avesIcon_enAdopcion.png',
    selectedIconPet: 'assets/icons/avesIcon2_enAdopcion.png',
  ),
  PetsFilter(
    typePet: 'Otros',
    iconPet: 'assets/icons/otrosIcon_enAdopcion.png',
    selectedIconPet: 'assets/icons/otrosIcon2_enAdopcion.png',
  ),
];
