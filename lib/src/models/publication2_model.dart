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

  List<String> pics;

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

    required this.pics,
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
    //
    pics: [
      'https://images.unsplash.com/photo-1573865526739-10659fec78a5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=715&q=80',
      "https://images.unsplash.com/photo-1519052537078-e6302a4968d4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80",
      'https://images.unsplash.com/photo-1574063413132-354db9f190fd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1171&q=80',
      'https://images.unsplash.com/photo-1596854407944-bf87f6fdd49e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=880&q=80',
    ],
  ),
  Publication2(
    id: 2,
    description:
        "¡AYÚDENME A ENCONTRAR A KEYLOR! Amigos de Facebook, mi cachorro salió hace 3 semanas de mi casa y no pudo volver, tiene 7 meses de edad, su manto es de color plomo-negro y el trébol en su rostro es bastante pronunciado. Mi familia y sobretodo yo lo extrañamos mucho, si alguien lo reconoce, les pido que por favor se comuniquen con los números en la imagen (el primero es mi número personal). Se reconocerá una recompensa 🙏",
    photo:
        'https://cdn.pixabay.com/photo/2019/04/13/13/58/pit-bull-4124677__340.jpg',
    likes: 53,
    commentary: 22,
    idUser: 2,
    nameUser: 'Julio',
    lastnameUser: 'Torres',
    photoUser:
        'https://images.unsplash.com/photo-1615109398623-88346a601842?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
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

    pics: [
      'https://cdn.pixabay.com/photo/2019/04/13/13/58/pit-bull-4124677__340.jpg',
      'https://cdn.pixabay.com/photo/2019/06/04/20/33/dog-4252274__340.jpg',
      'https://cdn.pixabay.com/photo/2019/04/26/21/50/dog-4158784__340.jpg',
    ],
  ),
  Publication2(
    id: 3,
    description:
        'Hola , hago esta publicación porque aún tengo esperanza de que aparezca mi perrito , se perdió el día miércoles 30 de noviembre , ayer se cumplió una semana de su desaparición. Mi perro se llama Braco y se perdió en Nv.Chimbote - Urb.Bellamar 2da etapa Referencia frente al hotel Afrodita.',
    photo:
        'https://cdn.pixabay.com/photo/2016/01/13/08/16/cute-1137375__340.jpg',
    likes: 23,
    commentary: 11,
    idUser: 3,
    nameUser: 'Lorena',
    lastnameUser: 'Matta',
    photoUser:
        'https://images.unsplash.com/photo-1599842057874-37393e9342df?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
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

    pics: [
      'https://cdn.pixabay.com/photo/2016/01/13/08/16/cute-1137375__340.jpg',
      'https://cdn.pixabay.com/photo/2022/05/04/09/41/shitzu-7173610__340.jpg',
      'https://cdn.pixabay.com/photo/2022/03/02/09/36/shitzu-7042735__340.jpg',
    ],
  ),
  Publication2(
    id: 4,
    description:
        '💕🦮Pequeños en Busca de una familia responsable que les brinde mucho amor y buena calidad de vida💕',
    photo:
        'https://cdn.pixabay.com/photo/2017/09/15/19/49/dog-2753369__340.jpg',
    likes: 57,
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

    pics: [
      'https://cdn.pixabay.com/photo/2017/09/15/19/49/dog-2753369__340.jpg',
      'https://cdn.pixabay.com/photo/2022/11/07/02/12/golden-retriever-7575400__340.jpg',
      'https://cdn.pixabay.com/photo/2018/11/13/16/09/puppy-3813379__340.jpg',
    ],
  ),
  Publication2(
    id: 5,
    description:
        'ADOPCION RESPONSABLE❤️🐶\nCACHORRITOS DE UN MES  , CRIOLLITOS DE RAZA PEQUEÑA .NECESITAN DUEÑOS QUE PUEDAN CUIDARLOS CORRECTAMENTE. Ayudenme a encontrar hogar  a estos angelitos..',
    photo:
        'https://cdn.pixabay.com/photo/2017/03/29/10/35/animal-2184791__340.jpg',
    likes: 49,
    commentary: 54,
    idUser: 5,
    nameUser: 'Paola',
    lastnameUser: 'Fernandez',
    photoUser:
        'https://images.unsplash.com/photo-1558499932-9609acb6f443?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
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

    pics: [
      'https://cdn.pixabay.com/photo/2017/03/29/10/35/animal-2184791__340.jpg',
      'https://cdn.pixabay.com/photo/2014/11/28/08/23/dog-548611__340.jpg',
      'https://cdn.pixabay.com/photo/2018/12/17/07/43/labrador-3879893__340.jpg',
    ],
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
        'https://cdn.pixabay.com/photo/2014/03/20/23/48/siberian-husky-291721__340.jpg',
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

    pics: [
      'https://cdn.pixabay.com/photo/2014/03/20/23/48/siberian-husky-291721__340.jpg',
      'https://cdn.pixabay.com/photo/2016/10/26/14/47/siberian-husky-1771667__340.jpg',
      'https://cdn.pixabay.com/photo/2017/06/26/12/39/husky-2443664__340.jpg',
    ],
  ),
  Publication2(
    id: 7,
    description:
        'Bns. tardes, se solicita apoyo para Luna, es una gatita que encontré por el mercado 21 de Abril, necesita apoyo ya que se encontró herida y con varias fracturas. Ayudenme por favor, pueden llamar al siguiente numero o contactarnos por aquí 992 323 232. Espero su apoyo 🙏🙏🙏🙏',
    photo:
        'https://cdn.pixabay.com/photo/2017/01/20/21/22/kitten-asleep-in-a-pot-1995961__340.jpg',
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

    pics: [
      'https://cdn.pixabay.com/photo/2017/01/20/21/22/kitten-asleep-in-a-pot-1995961__340.jpg',
      'https://cdn.pixabay.com/photo/2018/03/27/17/25/cat-3266671__340.jpg',
      'https://cdn.pixabay.com/photo/2016/11/21/14/47/adorable-1845790__340.jpg',
    ],
  ),
];
