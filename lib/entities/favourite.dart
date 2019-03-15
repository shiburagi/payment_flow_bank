class Favourite {
  String name;
  String image;

  Map toJson() {
    return {
      "name": name,
      "image": image,
    };
  }

  Favourite fromJson(Map map) {
    name = map["name"];
    image = map["image"];

    return this;
  }
}
