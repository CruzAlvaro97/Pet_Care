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
    namePet: 'Fridda',
    genderPet: 'Hembra',
    typePet: 'Perro',
    statusfilterPet: 'Perdido',
    photoPet:
        'https://images.unsplash.com/photo-1558322394-4d8813ceef8a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1169&q=80',
  ),
  PetsHelp(
    namePet: 'Zambi',
    genderPet: 'Macho',
    typePet: 'Gato',
    statusfilterPet: 'Apoyo',
    photoPet:
        'https://images.unsplash.com/photo-1533743983669-94fa5c4338ec?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1092&q=80',
  ),
  PetsHelp(
    namePet: 'Paquito',
    genderPet: 'Macho',
    typePet: 'Perro',
    statusfilterPet: 'Perdido',
    photoPet:
        'https://images.unsplash.com/photo-1666549707908-264fee9aeb9b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80',
  ),
  PetsHelp(
    namePet: 'Luna',
    genderPet: 'Hembra',
    typePet: 'Gato',
    statusfilterPet: 'Perdido',
    photoPet:
        'https://images.unsplash.com/photo-1511044568932-338cba0ad803?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ),
  PetsHelp(
    namePet: 'Tommy',
    genderPet: 'Macho',
    typePet: 'Perro',
    statusfilterPet: 'Apoyo',
    photoPet:
        'https://images.unsplash.com/photo-1606043810890-bfee20c5032b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
  ),
];
