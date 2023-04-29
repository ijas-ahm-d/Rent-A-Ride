import 'dart:convert';

List<CarDataModel> carDataModelFromJson(String str) => List<CarDataModel>.from(json.decode(str).map((x) => CarDataModel.fromJson(x)));

String carDataModelToJson(List<CarDataModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CarDataModel {
    String? id;
    String? name;
    String? rent;
    String? body;
    String? place;
    String? model;
    String? transmission;
    String? fuel;
    String? brand;
    String? description;
    String? image;
    bool? isBlocked;
    List<BookedSlot>? bookedSlots;
    DateTime? createdAt;
    DateTime? updatedAt;
    int? v;

    CarDataModel({
        this.id,
        this.name,
        this.rent,
        this.body,
        this.place,
        this.model,
        this.transmission,
        this.fuel,
        this.brand,
        this.description,
        this.image,
        this.isBlocked,
        this.bookedSlots,
        this.createdAt,
        this.updatedAt,
        this.v,
    });

    factory CarDataModel.fromJson(Map<String, dynamic> json) => CarDataModel(
        id: json["_id"],
        name: json["name"],
        rent: json["rent"],
        body: json["body"],
        place: json["place"],
        model: json["model"],
        transmission: json["transmission"],
        fuel: json["fuel"],
        brand: json["brand"],
        description: json["description"],
        image: json["image"],
        isBlocked: json["isBlocked"],
        bookedSlots: json["bookedSlots"] == null ? [] : List<BookedSlot>.from(json["bookedSlots"]!.map((x) => BookedSlot.fromJson(x))),
        createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        v: json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "rent": rent,
        "body": body,
        "place": place,
        "model": model,
        "transmission": transmission,
        "fuel": fuel,
        "brand": brand,
        "description": description,
        "image": image,
        "isBlocked": isBlocked,
        "bookedSlots": bookedSlots == null ? [] : List<dynamic>.from(bookedSlots!.map((x) => x.toJson())),
        "createdAt": createdAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "__v": v,
    };
}

class BookedSlot {
    DateTime? from;
    DateTime? to;
    String? id;

    BookedSlot({
        this.from,
        this.to,
        this.id,
    });

    factory BookedSlot.fromJson(Map<String, dynamic> json) => BookedSlot(
        from: json["from"] == null ? null : DateTime.parse(json["from"]),
        to: json["to"] == null ? null : DateTime.parse(json["to"]),
        id: json["_id"],
    );

    Map<String, dynamic> toJson() => {
        "from": from?.toIso8601String(),
        "to": to?.toIso8601String(),
        "_id": id,
    };
}
