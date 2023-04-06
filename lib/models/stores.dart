class Store {
  Store({
    required this.id,
    required this.status,
    this.sort,
    required this.userCreated,
    required this.dateCreated,
    this.userUpdated,
    this.dateUpdated,
    required this.name,
    this.streetNumber,
    this.streetName,
    this.suburb,
    this.province,
    this.city,
    this.logo,
    this.background,
    required this.itemsId,
  });

  String id;
  String status;
  int? sort;
  String userCreated;
  DateTime dateCreated;
  String? userUpdated;
  DateTime? dateUpdated;
  String name;
  String? streetNumber;
  String? streetName;
  String? suburb;
  String? province;
  String? city;
  String? logo;
  String? background;
  List<String> itemsId;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        id: json["id"],
        status: json["status"],
        sort: json["sort"],
        userCreated: json["user_created"],
        dateCreated: DateTime.parse(json["date_created"]),
        userUpdated: json["user_updated"],
        dateUpdated: json["date_updated"] == null
            ? null
            : DateTime.parse(json["date_updated"]),
        name: json["name"],
        streetNumber: json["street_number"],
        streetName: json["street_name"],
        suburb: json["suburb"],
        province: json["province"],
        city: json["city"],
        logo: json["logo"],
        background: json["background"],
        itemsId: List<String>.from(json["items_id"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "status": status,
        "sort": sort,
        "user_created": userCreated,
        "date_created": dateCreated.toIso8601String(),
        "user_updated": userUpdated,
        "date_updated": dateUpdated?.toIso8601String(),
        "name": name,
        "street_number": streetNumber,
        "street_name": streetName,
        "suburb": suburb,
        "province": province,
        "city": city,
        "logo": logo,
        "background": background,
        "items_id": List<dynamic>.from(itemsId.map((x) => x)),
      };
}
