class PetsFilter {
  String typePet;
  String iconPet;

  PetsFilter({
    required this.typePet,
    required this.iconPet,
  });
}

List<PetsFilter> petsFilter = [
  PetsFilter(
    typePet: 'Todos',
    iconPet: 'assets/icons/todosIcon_enAdocion.png',
  ),
  PetsFilter(
    typePet: 'Perros',
    iconPet: 'assets/icons/perrosIcon_enAdocion.png',
  ),
  PetsFilter(
    typePet: 'Gatos',
    iconPet: 'assets/icons/gatosIcon_enAdopcion.png',
  ),
  PetsFilter(
    typePet: 'Conejos',
    iconPet: 'assets/icons/conejosIcon_enAdopcion.png',
  ),
  PetsFilter(
    typePet: 'Aves',
    iconPet: 'assets/icons/avesIcon_enAdopcion.png',
  ),
  PetsFilter(
    typePet: 'Otros',
    iconPet: 'assets/icons/otrosIcon_enAdopcion.png',
  ),
];
