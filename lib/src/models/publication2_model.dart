class Publication2 {
  //post
  int id;
  String description;
  String photo;
  int likes;
  int commentary;
  int idUser;
  String nameUser;
  String lastnameUser;
  String photoUser;
  String usernameUser;
  //pet datos básicos
  String namePet;
  String speciesPet;
  String breedPet;
  String agePet;
  String sexPet;
  double weigthPet;
  String sizePet;
  //pet características

  //type publication
  bool isPublicationAdoption;
  bool isPublicationSupport;
  bool isPublicationSearch;

  Publication2({
    //post
    required this.id,
    required this.description,
    required this.photo,
    required this.likes,
    required this.commentary,
    required this.idUser,
    required this.nameUser,
    required this.lastnameUser,
    required this.photoUser,
    required this.usernameUser,
    //pet datos básicos
    required this.namePet,
    required this.speciesPet,
    required this.breedPet,
    required this.agePet,
    required this.sexPet,
    required this.weigthPet,
    required this.sizePet,

    //type publication
    required this.isPublicationAdoption,
    required this.isPublicationSupport,
    required this.isPublicationSearch,

    //pet
  });
}

List<Publication2> publications2 = [
  Publication2(
    id: 1,
    description:
        'Buenas tardes amigos, este gatita lo recogi y lo tenía tan lindo con nosotros, pero como hace sol le gustaba salir a abrigarse  en las bancas del.ovalo la familia. El sabado 03 cerca de las 6 de la tarde estaba afuera y fue acariciado por un chico que se lo llevó, dejandonos tristes por ser un compañerito muy cariñoso y engreído. Si  lo ven por ahi perdido, o tal vez quien se lo llevó nos lo devuelva, estaré agradecida. Su colita es bien esponjosa',
    photo:
        'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715&q=80',
    likes: 43,
    commentary: 12,
    idUser: 1,
    nameUser: 'Juan',
    lastnameUser: 'Jiménez',
    photoUser:
        'https://images.unsplash.com/photo-1442328166075-47fe7153c128?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    usernameUser: '@juanjimenez_',

    ///
    namePet: 'Canela',
    speciesPet: 'Gato',
    breedPet: 'Mestizo',
    agePet: '2',
    sexPet: 'Hembra',
    weigthPet: 5.4,
    sizePet: 'Pequeño',

    ///
    isPublicationAdoption: true,
    isPublicationSupport: false,
    isPublicationSearch: false,
  ),
  Publication2(
    id: 2,
    description:
        "¡AYÚDENME A ENCONTRAR A KEYLOR! Amigos de Facebook, mi cachorro salió hace 3 semanas de mi casa y no pudo volver, tiene 7 meses de edad, su manto es de color plomo-negro y el trébol en su rostro es bastante pronunciado. Mi familia y sobretodo yo lo extrañamos mucho, si alguien lo reconoce, les pido que por favor se comuniquen con los números en la imagen (el primero es mi número personal). Se reconocerá una recompensa 🙏",
    photo:
        'https://images.unsplash.com/photo-1543466835-00a7907e9de1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
    likes: 53,
    commentary: 22,
    idUser: 2,
    nameUser: 'Julio',
    lastnameUser: 'Torres',
    photoUser:
        'https://images.unsplash.com/photo-1442328166075-47fe7153c128?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    usernameUser: '@julio_to',

    ///
    namePet: 'Keylor',
    speciesPet: 'Perro',
    breedPet: 'Mestizo',
    agePet: '1',
    sexPet: 'Macho',
    weigthPet: 2.4,
    sizePet: 'Pequeño',

    ///
    isPublicationAdoption: false,
    isPublicationSupport: true,
    isPublicationSearch: false,
  ),
  Publication2(
    id: 3,
    description:
        'Hola , hago esta publicación porque aún tengo esperanza de que aparezca mi perrito , se perdió el día miércoles 30 de noviembre , ayer se cumplió una semana de su desaparición. Mi perro se llama Braco y se perdió en Nv.Chimbote - Urb.Bellamar 2da etapa Referencia frente al hotel Afrodita.',
    photo:
        'https://images.unsplash.com/photo-1612389258858-b1da33e68ae0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=764&q=80',
    likes: 23,
    commentary: 11,
    idUser: 3,
    nameUser: 'Lorena',
    lastnameUser: 'Matta',
    photoUser:
        'https://images.unsplash.com/photo-1628015081036-0747ec8f077a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    usernameUser: '@lorenam',

    ///
    namePet: 'Braco',
    speciesPet: 'Perro',
    breedPet: 'Cocker',
    agePet: '5',
    sexPet: 'Macho',
    weigthPet: 10.4,
    sizePet: 'Pequeño',

    ///
    isPublicationAdoption: false,
    isPublicationSupport: false,
    isPublicationSearch: true,
  ),
  Publication2(
    id: 4,
    description:
        '💕🦮Pequeños en Busca de una familia responsable que les brinde mucho amor y buena calidad de vida💕',
    photo:
        'https://images.unsplash.com/photo-1564087040905-670d5e551bac?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=735&q=80',
    likes: 55,
    commentary: 51,
    idUser: 4,
    nameUser: 'Marco',
    lastnameUser: 'Parodi',
    photoUser:
        'https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    usernameUser: '@marpa',

    ///
    namePet: 'Negro',
    speciesPet: 'Perro',
    breedPet: 'Mestizo',
    agePet: '10',
    sexPet: 'Macho',
    weigthPet: 13.4,
    sizePet: 'Mediano',

    ///
    isPublicationAdoption: true,
    isPublicationSupport: false,
    isPublicationSearch: false,
  ),
  Publication2(
    id: 5,
    description:
        'ADOPCION RESPONSABLE❤️🐶\nCACHORRITOS DE UN MES  , CRIOLLITOS DE RAZA PEQUEÑA .NECESITAN DUEÑOS QUE PUEDAN CUIDARLOS CORRECTAMENTE. Ayudenme a encontrar hogar  a estos angelitos..',
    photo:
        'https://images.unsplash.com/photo-1588022274210-7aab7c55c631?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    likes: 72,
    commentary: 54,
    idUser: 5,
    nameUser: 'Paola',
    lastnameUser: 'Fernandez',
    photoUser:
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    usernameUser: '@paof',

    ///
    namePet: 'Chispas',
    speciesPet: 'Perro',
    breedPet: 'Mestizo',
    agePet: '1',
    sexPet: 'Macho',
    weigthPet: 5.0,
    sizePet: 'Pequeño',

    ///
    isPublicationAdoption: true,
    isPublicationSupport: false,
    isPublicationSearch: false,
  ),
  Publication2(
    id: 6,
    description:
        'Buenas tardes amigos, se da en adopción a Tommy, es un pastor escosés amigable con otros perros, le gusta salir a caminar por el parque. Los motivos por los que lo doy en adopción es por motivos de viaje ya no podré tenerlo. Ayúdame a encontrar una buena familia para Tommy.',
    photo:
        'https://images.unsplash.com/photo-1606043810890-bfee20c5032b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    likes: 22,
    commentary: 14,
    idUser: 6,
    nameUser: 'Patty',
    lastnameUser: 'Wong',
    photoUser:
        'https://images.unsplash.com/photo-1506901437675-cde80ff9c746?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    usernameUser: '@pattyw',

    ///
    namePet: 'Tommy',
    speciesPet: 'Perro',
    breedPet: 'Pastor escosés',
    agePet: '3',
    sexPet: 'Macho',
    weigthPet: 35.0,
    sizePet: 'Grande',

    ///
    isPublicationAdoption: true,
    isPublicationSupport: false,
    isPublicationSearch: false,
  ),
  Publication2(
    id: 7,
    description:
        'Bns. tardes, se solicita apoyo para Luna, es una gatita que encontré por el mercado 21 de Abril, necesita apoyo ya que se encontró herida y con varias fracturas. Ayudenme por favor, pueden llamar al siguiente numero o contactarnos por aquí 992 323 232. Espero su apoyo 🙏🙏🙏🙏',
    photo:
        'https://images.unsplash.com/photo-1533743983669-94fa5c4338ec?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1092&q=80',
    likes: 47,
    commentary: 24,
    idUser: 7,
    nameUser: 'Carlos',
    lastnameUser: 'Bazán',
    photoUser:
        'https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    usernameUser: '@carl.baz',

    ///
    namePet: 'Luna',
    speciesPet: 'Gata',
    breedPet: 'Mestizo',
    agePet: '1',
    sexPet: 'Hembra',
    weigthPet: 5.0,
    sizePet: 'Pequeño',

    ///
    isPublicationAdoption: false,
    isPublicationSupport: true,
    isPublicationSearch: false,
  ),
];
