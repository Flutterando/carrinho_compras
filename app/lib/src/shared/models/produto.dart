class Produto {
  String id;
  String title;
  String price;
  String description;
  String image;

  Produto({
    this.id,
    this.title,
    this.price,
    this.description,
    this.image,
  });

  factory Produto.fromJson(Map<String, dynamic> json) => new Produto(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        image: json["image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "image": image,
      };
}
