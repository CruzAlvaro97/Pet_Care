// To parse this JSON data, do
//
//     final publication3 = publication3FromMap(jsonString);

import 'dart:convert';

// To parse this JSON data, do
//
//     final publication3 = publication3FromMap(jsonString);

import 'dart:convert';

import 'package:pet_society/src/models/usuario_model.dart';

class Publication3 {
  Publication3({
    required this.id,
    required this.createdAt,
    required this.namePet,
    required this.genderPet,
    required this.agePet,
    required this.sizePet,
    required this.weigthPet,
    required this.descriptionPost,
    required this.statusPet,
    required this.featuresPet,
    required this.imagesPet,
    required this.breedPet,
    required this.speciePet,
    required this.tipo,
    required this.idUser,
    required this.usuario,
  });

  int id;
  DateTime createdAt;
  String namePet;
  String genderPet;
  String agePet;
  String sizePet;
  String weigthPet;
  String descriptionPost;
  StatusPet statusPet;
  List<String> featuresPet;
  List<String> imagesPet;
  String breedPet;
  String speciePet;
  String tipo;
  int idUser;
  Usuario usuario;

  factory Publication3.fromJson(String str) =>
      Publication3.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Publication3.fromMap(Map<String, dynamic> json) => Publication3(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        namePet: json["name_pet"],
        genderPet: json["gender_pet"],
        agePet: json["age_pet"],
        sizePet: json["size_pet"],
        weigthPet: json["weigth_pet"],
        descriptionPost: json["description_post"],
        statusPet: StatusPet.fromMap(json["status_pet"]),
        featuresPet: List<String>.from(json["features_pet"].map((x) => x)),
        imagesPet: List<String>.from(json["images_pet"].map((x) => x)),
        breedPet: json["breed_pet"],
        speciePet: json["specie_pet"],
        tipo: json["tipo"],
        idUser: json["id_user"],
        usuario: Usuario.fromMap(json["usuario"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "name_pet": namePet,
        "gender_pet": genderPet,
        "age_pet": agePet,
        "size_pet": sizePet,
        "weigth_pet": weigthPet,
        "description_post": descriptionPost,
        "status_pet": statusPet.toMap(),
        "features_pet": List<dynamic>.from(featuresPet.map((x) => x)),
        "images_pet": List<dynamic>.from(imagesPet.map((x) => x)),
        "breed_pet": breedPet,
        "specie_pet": speciePet,
        "tipo": tipo,
        "id_user": idUser,
        "usuario": usuario.toMap(),
      };
}

class StatusPet {
  StatusPet({
    required this.vacunado,
    required this.desparasitado,
    required this.sano,
    required this.esterilizado,
    required this.otras,
  });

  bool vacunado;
  bool desparasitado;
  bool sano;
  bool esterilizado;
  bool otras;

  factory StatusPet.fromJson(String str) => StatusPet.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory StatusPet.fromMap(Map<String, dynamic> json) => StatusPet(
        vacunado: json["vacunado"],
        desparasitado: json["desparasitado"],
        sano: json["sano"],
        esterilizado: json["esterilizado"],
        otras: json["otras"],
      );

  Map<String, dynamic> toMap() => {
        "vacunado": vacunado,
        "desparasitado": desparasitado,
        "sano": sano,
        "esterilizado": esterilizado,
        "otras": otras,
      };
}


// import 'dart:convert';

// class Publication3 {
//   int id;
//   DateTime createdAt;
//   String namePet;
//   String genderPet;
//   String agePet;
//   String sizePet;
//   String weigthPet;
//   String descriptionPost;
//   StatusPet statusPet;
//   List<String> featuresPet;
//   List<String> imagesPet;
//   String breedPet;
//   String speciePet;

//   Publication3({
//     required this.id,
//     required this.createdAt,
//     required this.namePet,
//     required this.genderPet,
//     required this.agePet,
//     required this.sizePet,
//     required this.weigthPet,
//     required this.descriptionPost,
//     required this.statusPet,
//     required this.featuresPet,
//     required this.imagesPet,
//     required this.breedPet,
//     required this.speciePet,
//   });

//   factory Publication3.fromJson(String str) =>
//       Publication3.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory Publication3.fromMap(Map<String, dynamic> json) => Publication3(
//         id: json["id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         namePet: json["name_pet"],
//         genderPet: json["gender_pet"],
//         agePet: json["age_pet"],
//         sizePet: json["size_pet"],
//         weigthPet: json["weigth_pet"],
//         descriptionPost: json["description_post"],
//         statusPet: StatusPet.fromMap(json["status_pet"]),
//         featuresPet: List<String>.from(json["features_pet"].map((x) => x)),
//         imagesPet: List<String>.from(json["images_pet"].map((x) => x)),
//         breedPet: json["breed_pet"],
//         speciePet: json["specie_pet"],
//       );

//   Map<String, dynamic> toMap() => {
//         "id": id,
//         "created_at": createdAt.toIso8601String(),
//         "name_pet": namePet,
//         "gender_pet": genderPet,
//         "age_pet": agePet,
//         "size_pet": sizePet,
//         "weigth_pet": weigthPet,
//         "description_post": descriptionPost,
//         "status_pet": statusPet.toMap(),
//         "features_pet": List<dynamic>.from(featuresPet.map((x) => x)),
//         "images_pet": List<dynamic>.from(imagesPet.map((x) => x)),
//         "breed_pet": breedPet,
//         "specie_pet": speciePet,
//       };
// }

// class StatusPet {
//   bool vacunado;
//   bool desparasitado;
//   bool sano;
//   bool esterilizado;
//   bool otras;

//   StatusPet({
//     required this.vacunado,
//     required this.desparasitado,
//     required this.sano,
//     required this.esterilizado,
//     required this.otras,
//   });

//   factory StatusPet.fromJson(String str) => StatusPet.fromMap(json.decode(str));

//   String toJson() => json.encode(toMap());

//   factory StatusPet.fromMap(Map<String, dynamic> json) => StatusPet(
//         vacunado: json["vacunado"],
//         desparasitado: json["desparasitado"],
//         sano: json["sano"],
//         esterilizado: json["esterilizado"],
//         otras: json["otras"],
//       );

//   Map<String, dynamic> toMap() => {
//         "vacunado": vacunado,
//         "desparasitado": desparasitado,
//         "sano": sano,
//         "esterilizado": esterilizado,
//         "otras": otras,
//       };
// }
