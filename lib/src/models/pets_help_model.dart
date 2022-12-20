class PetsHelp {
  String namePet;
  String photoPet;
  String genderPet;
  String typePet;
  String statusfilterPet;

  PetsHelp({
    required this.namePet,
    required this.photoPet,
    required this.genderPet,
    required this.typePet,
    required this.statusfilterPet, //para filtro
  });
}

// Agregar los animales nuevos al inicio
List<PetsHelp> petsHelp = [
  PetsHelp(
    namePet: 'Scott',
    genderPet: 'Macho',
    typePet: 'Perro',
    statusfilterPet: 'Perdido',
    photoPet:
        'https://cdn.pixabay.com/photo/2020/06/30/22/34/dog-5357794_960_720.jpg',
  ),
  PetsHelp(
    namePet: 'Stuart',
    genderPet: 'Macho',
    typePet: 'Otros',
    statusfilterPet: 'Apoyo',
    photoPet:
        'https://cdn.pixabay.com/photo/2017/05/13/17/37/hamster-2310228_960_720.jpg',
  ),
  PetsHelp(
    namePet: 'Mango',
    genderPet: 'Macho',
    typePet: 'Gato',
    statusfilterPet: 'Perdido',
    photoPet: 'assets/images/mango.jpeg',
  ),
  PetsHelp(
    namePet: 'MinPao',
    genderPet: 'Macho',
    typePet: 'Gato',
    statusfilterPet: 'Perdido',
    photoPet: 'assets/images/minpao.jpeg',
  ),
  PetsHelp(
    namePet: 'Quacky',
    genderPet: 'Macho',
    typePet: 'Ave',
    statusfilterPet: 'Apoyo',
    photoPet:
        'https://cdn.pixabay.com/photo/2015/01/07/10/32/mandarin-591333_960_720.jpg',
  ),
];
