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
    usernameUser: '@jormg_',
  ),
  Publication(
    id: 2,
    description:
        'Buenas tardes amigos, este gatito lo recogi y lo tenía tan lindo con nosotros, pero como hace sol le gustaba salir a abrigarse  en las bancas del.ovalo la familia. El sabado 03 cerca de las 6 de la tarde estaba afuera y fue acariciado por un chico que se lo llevó, dejandonos tristes por ser un compañerito muy cariñoso y engreído. Si  lo ven por ahi perdido, o tal vez quien se lo llevó nos lo devuelva, estaré agradecida. Su colita es bien esponjosa',
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
        'Buenas tardes amigos, este gatito lo recogi y lo tenía tan lindo con nosotros, pero como hace sol le gustaba salir a abrigarse  en las bancas del.ovalo la familia. El sabado 03 cerca de las 6 de la tarde estaba afuera y fue acariciado por un chico que se lo llevó, dejandonos tristes por ser un compañerito muy cariñoso y engreído. Si  lo ven por ahi perdido, o tal vez quien se lo llevó nos lo devuelva, estaré agradecida. Su colita es bien esponjosa',
    photo:
        'https://images.unsplash.com/photo-1534361960057-19889db9621e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    likes: 23,
    commentary: 11,
    idUser: 3,
    nameUser: 'Lorena',
    lastnameUser: 'Matta',
    photoUser:
        'https://plus.unsplash.com/premium_photo-1667727016889-cc64212b1b46?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=688&q=80',
    usernameUser: '@lorenam',
  ),
];
