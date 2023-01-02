import 'dart:convert';

class Usuario {
  int id;
  DateTime createdAt;
  String? nombreUsuario;
  String apellidoUsuario;
  String usernameUsuario;
  String correoUsuario;
  String fotoUsuario;
  String token;

  Usuario({
    required this.id,
    required this.createdAt,
    this.nombreUsuario = '',
    required this.apellidoUsuario,
    required this.usernameUsuario,
    required this.correoUsuario,
    required this.fotoUsuario,
    required this.token,
  });

  factory Usuario.fromJson(String str) => Usuario.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Usuario.fromMap(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        nombreUsuario: json["nombre_usuario"],
        apellidoUsuario: json["apellido_usuario"],
        usernameUsuario: json["username_usuario"],
        correoUsuario: json["correo_usuario"],
        fotoUsuario: json["foto"],
        token: json["token_id"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "created_at": createdAt.toIso8601String(),
        "nombre_usuario": nombreUsuario,
        "apellido_usuario": apellidoUsuario,
        "username_usuario": usernameUsuario,
        "correo_usuario": correoUsuario,
        "foto": fotoUsuario,
        "token_id": token,
      };
}
