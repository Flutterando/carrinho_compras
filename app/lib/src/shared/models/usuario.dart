class Usuario {
  final String id;
  final String name;
  final String email;

  Usuario({this.id, this.name, this.email});

  factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        name: json["name"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
      };
}
