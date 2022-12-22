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
    typePet: 'Perro',
    iconPet: 'assets/icons/perrosIcon_enAdopcion.png',
    selectedIconPet: 'assets/icons/perrosIcon2_enAdopcion.png',
  ),
  PetsFilter(
    typePet: 'Gato',
    iconPet: 'assets/icons/gatosIcon_enAdopcion.png',
    selectedIconPet: 'assets/icons/gatosIcon2_enAdopcion.png',
  ),
  PetsFilter(
    typePet: 'Conejo',
    iconPet: 'assets/icons/conejosIcon_enAdopcion.png',
    selectedIconPet: 'assets/icons/conejosIcon2_enAdopcion.png',
  ),
  PetsFilter(
    typePet: 'Ave',
    iconPet: 'assets/icons/avesIcon_enAdopcion.png',
    selectedIconPet: 'assets/icons/avesIcon2_enAdopcion.png',
  ),
  PetsFilter(
    typePet: 'Roedor',
    iconPet: 'assets/icons/roedorIcon_enAdopcion.png',
    selectedIconPet: 'assets/icons/roedorIcon2_enAdopcion.png',
  ),
];
