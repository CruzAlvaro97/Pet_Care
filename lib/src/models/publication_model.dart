class Publication {
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

  Publication({
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
  });
}

List<Publication> publications = [
  Publication(
    id: 1,
    description:
        'Buenas tardes amigos, este gatito lo recogi y lo tenía tan lindo con nosotros, pero como hace sol le gustaba salir a abrigarse  en las bancas del.ovalo la familia. El sabado 03 cerca de las 6 de la tarde estaba afuera y fue acariciado por un chico que se lo llevó, dejandonos tristes por ser un compañerito muy cariñoso y engreído. Si  lo ven por ahi perdido, o tal vez quien se lo llevó nos lo devuelva, estaré agradecida. Su colita es bien esponjosa',
    photo:
        'https://images.unsplash.com/photo-1560114928-40f1f1eb26a0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    likes: 43,
    commentary: 12,
    idUser: 1,
    nameUser: 'Roberto',
    lastnameUser: 'Jiménez',
    photoUser:
        'https://images.unsplash.com/photo-1442328166075-47fe7153c128?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    usernameUser: '@robert_',
  ),
  Publication(
    id: 2,
    description:
        "¡AYÚDENME A ENCONTRAR A KEYLOR! Amigos de Facebook, mi cachorro salió hace 3 semanas de mi casa y no pudo volver, tiene 7 meses de edad, su manto es de color plomo-negro y el trébol en su rostro es bastante pronunciado. Mi familia y sobretodo yo lo extrañamos mucho, si alguien lo reconoce, les pido que por favor se comuniquen con los números en la imagen (el primero es mi número personal). Se reconocerá una recompensa 🙏",
    photo:
        'https://images.unsplash.com/photo-1543466835-00a7907e9de1?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
    likes: 53,
    commentary: 22,
    idUser: 2,
    nameUser: 'Fabricio',
    lastnameUser: 'Torres',
    photoUser:
        'https://images.unsplash.com/photo-1442328166075-47fe7153c128?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    usernameUser: '@fabri_torres',
  ),
  Publication(
    id: 3,
    description:
        'Hola , hago esta publicación porque aún tengo esperanza de que aparezca mi perrito , se perdió el día miércoles 30 de noviembre , ayer se cumplió una semana de su desaparición. Mi perro se llama Braco y se perdió en Nv.Chimbote - Urb.Bellamar 2da etapa Referencia frente al hotel Afrodita.',
    photo:
        'https://images.unsplash.com/photo-1534361960057-19889db9621e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    likes: 23,
    commentary: 11,
    idUser: 3,
    nameUser: 'Lorena',
    lastnameUser: 'Matta',
    photoUser:
        'https://images.unsplash.com/photo-1628015081036-0747ec8f077a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80',
    usernameUser: '@lorenam',
  ),
  Publication(
    id: 4,
    description:
        '💕🦮Pequeños en Busca de una familia responsable que les brinde mucho amor y buena calidad de vida💕',
    photo:
        'https://images.unsplash.com/photo-1518791841217-8f162f1e1131?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    likes: 55,
    commentary: 51,
    idUser: 4,
    nameUser: 'Marco',
    lastnameUser: 'Parodi',
    photoUser:
        'https://images.unsplash.com/photo-1600486913747-55e5470d6f40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    usernameUser: '@marpa',
  ),
  Publication(
    id: 5,
    description:
        'ADOPCION RESPONSABLE❤️🐶\nCACHORRITOS DE UN MES  , CRIOLLITOS DE RAZA PEQUEÑA .NECESITAN DUEÑOS QUE PUEDAN CUIDARLOS CORRECTAMENTE. Ayudenme a encontrar hogar  a estos angelitos..',
    photo:
        'https://images.unsplash.com/photo-1587300003388-59208cc962cb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    likes: 72,
    commentary: 54,
    idUser: 5,
    nameUser: 'Paola',
    lastnameUser: 'Fernandez',
    photoUser:
        'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    usernameUser: '@paof',
  ),
  Publication(
    id: 6,
    description:
        'Buenas tardes amigos, este gatito lo recogi y lo tenía tan lindo con nosotros, pero como hace sol le gustaba salir a abrigarse  en las bancas del.ovalo la familia. El sabado 03 cerca de las 6 de la tarde estaba afuera y fue acariciado por un chico que se lo llevó, dejandonos tristes por ser un compañerito muy cariñoso y engreído. Si  lo ven por ahi perdido, o tal vez quien se lo llevó nos lo devuelva, estaré agradecida. Su colita es bien esponjosa',
    photo:
        'https://images.unsplash.com/photo-1554456854-55a089fd4cb2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    likes: 22,
    commentary: 14,
    idUser: 6,
    nameUser: 'Patty',
    lastnameUser: 'Wong',
    photoUser:
        'https://images.unsplash.com/photo-1506901437675-cde80ff9c746?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    usernameUser: '@pattyw',
  ),
  Publication(
    id: 7,
    description:
        'Buenas tardes amigos, este gatito lo recogi y lo tenía tan lindo con nosotros, pero como hace sol le gustaba salir a abrigarse  en las bancas del.ovalo la familia. El sabado 03 cerca de las 6 de la tarde estaba afuera y fue acariciado por un chico que se lo llevó, dejandonos tristes por ser un compañerito muy cariñoso y engreído. Si  lo ven por ahi perdido, o tal vez quien se lo llevó nos lo devuelva, estaré agradecida. Su colita es bien esponjosa',
    photo:
        'https://images.unsplash.com/photo-1626602411112-10742f9a3ab8?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1074&q=80',
    likes: 47,
    commentary: 24,
    idUser: 7,
    nameUser: 'Carlos',
    lastnameUser: 'Bazán',
    photoUser:
        'https://images.unsplash.com/photo-1463453091185-61582044d556?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    usernameUser: '@carl.baz',
  ),
];
