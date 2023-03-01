class Order {
  bool? success;
  List<Data>? data;
  String? message;

  Order({this.success, this.data, this.message});

  Order.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    message = json['message'];
  }
}

class Data {
  int? id;
  String? no;
  String? status;
  int? userId;
  String? createdAt;
  String? updatedAt;
  List<Items>? items;
  List<History>? history;

  Data(
      {this.id,
      this.no,
      this.status,
      this.userId,
      this.createdAt,
      this.updatedAt,
      this.items,
      this.history});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    no = json['no'];
    status = json['status'];
    userId = json['user_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    if (json['history'] != null) {
      history = <History>[];
      json['history'].forEach((v) {
        history!.add(History.fromJson(v));
      });
    }
  }
}

class Items {
  int? id;
  int? orderId;
  String? itemName;
  String? itemDescr;
  String? itemImage;
  String? price;
  String? itemLink;

  String? createdAt;
  String? updatedAt;

  Items(
      {this.id,
      this.orderId,
      this.itemName,
      this.itemDescr,
      this.itemImage,
      this.price,
      this.itemLink,
      this.createdAt,
      this.updatedAt});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    itemName = json['item_name'];
    itemDescr = json['item_descr'];
    itemImage = json['item_image'];
    price = json['price'];
    itemLink = json['item_link'];

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

class History {
  int? id;
  String? status;
  int? userId;
  int? orderId;
  String? createdAt;
  String? updatedAt;

  History(
      {this.id,
      this.status,
      this.userId,
      this.orderId,
      this.createdAt,
      this.updatedAt});

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    status = json['status'];
    userId = json['user_id'];
    orderId = json['order_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }
}

























// ignore_for_file: non_constant_identifier_names

// class Order {
//   String? status;
//   List<Data> data = [];
//   Order({this.status});

//   Order.fromJson(Map<String, dynamic> json) {
//     json['data'].forEach((v) => data.add(Data.fromJson(v)));
//     Order(
//       status: json['status'],
//     );
//   }
// }

// class Data {
//   String? no;
//   int? id;
//   String? status;
//   List<History> history = [];
//   List<Items> items = [];
//   Data({this.no, this.status, this.id});

//   Data.fromJson(Map<String, dynamic> json) {
//     json['items'].forEach((v) => items.add(Items.fromJson(v)));
//     json['history'].forEach((v) => items.add(Items.fromJson(v)));
//     Data(
//       id: json['id'],
//       no: json['no'],
//       status: json['status'],
//     );
//   }
// }

// class Items {
//   int? order_id;
//   String? item_name,
//       item_image,
//       item_descr,
//       price,
//       item_link,
//       created_at,
//       updated_at;

//   Items({
//     this.order_id,
//     this.item_name,
//     this.item_image,
//     this.item_descr,
//     this.item_link,
//     this.price,
//     this.created_at,
//     this.updated_at,
//   });

//   Items.fromJson(Map<String, dynamic> json) {
//     Items(
//       order_id: json['order_id'],
//       item_name: json['item_name'],
//       item_image: json['item_image'],
//       item_descr: json['item_descr'],
//       price: json['price'],
//       item_link: json['item_link'],
//       created_at: json['created_at'],
//       updated_at: json['updated_at'],
//     );
//   }
// }

// class History {
//   String? status;

//   History({
//     this.status,
//   });

//   History.fromJson(Map<String, dynamic> json) {
//     History(
//       status: json['status'],
//     );
//   }
// }




















// // To parse this JSON data, do

// //     final getOrderModel = getOrderModelFromJson(jsonString);

// import 'dart:convert';

// GetOrderModel getOrderModelFromJson(String str) =>
//     GetOrderModel.fromJson(json.decode(str));

// String getOrderModelToJson(GetOrderModel data) => json.encode(data.toJson());

// class GetOrderModel {
//   GetOrderModel({
//     required this.success,
//     required this.data,
//     required this.message,
//   });

//   bool success;
//   List<Datum> data;
//   String message;

//   factory GetOrderModel.fromJson(Map<String, dynamic> json) => GetOrderModel(
//         success: json["success"],
//         data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         message: json["message"],
//       );

//   Map<String, dynamic> toJson() => {
//         "success": success,
//         "data": List<dynamic>.from(data.map((x) => x.toJson())),
//         "message": message,
//       };
// }

// class Datum {
//   Datum({
//     required this.id,
//     required this.no,
//     required this.status,
//     required this.userId,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.items,
//     required this.history,
//   });

//   int id;
//   String no;
//   String status;
//   int userId;
//   DateTime createdAt;
//   DateTime updatedAt;
//   List<Item> items;
//   List<History> history;

//   factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         id: json["id"],
//         no: json["no"],
//         status: json["status"],
//         userId: json["user_id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//         items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
//         history:
//             List<History>.from(json["history"].map((x) => History.fromJson(x))),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "no": no,
//         "status": status,
//         "user_id": userId,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//         "items": List<dynamic>.from(items.map((x) => x.toJson())),
//         "history": List<dynamic>.from(history.map((x) => x.toJson())),
//       };
// }

// class History {
//   History({
//     required this.id,
//     required this.status,
//     required this.userId,
//     required this.orderId,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   int id;
//   String status;
//   int userId;
//   int orderId;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory History.fromJson(Map<String, dynamic> json) => History(
//         id: json["id"],
//         status: json["status"],
//         userId: json["user_id"],
//         orderId: json["order_id"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "status": status,
//         "user_id": userId,
//         "order_id": orderId,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }

// class Item {
//   Item({
//     required this.id,
//     required this.orderId,
//     required this.itemName,
//     required this.itemDescr,
//     required this.itemImage,
//     required this.price,
//     required this.itemLink,
//     this.fees,
//     required this.createdAt,
//     required this.updatedAt,
//   });

//   int id;
//   int orderId;
//   String itemName;
//   String itemDescr;
//   String itemImage;
//   String price;
//   String itemLink;
//   dynamic fees;
//   DateTime createdAt;
//   DateTime updatedAt;

//   factory Item.fromJson(Map<String, dynamic> json) => Item(
//         id: json["id"],
//         orderId: json["order_id"],
//         itemName: json["item_name"],
//         itemDescr: json["item_descr"],
//         itemImage: json["item_image"],
//         price: json["price"],
//         itemLink: json["item_link"],
//         fees: json["fees"],
//         createdAt: DateTime.parse(json["created_at"]),
//         updatedAt: DateTime.parse(json["updated_at"]),
//       );

//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "order_id": orderId,
//         "item_name": itemName,
//         "item_descr": itemDescr,
//         "item_image": itemImage,
//         "price": price,
//         "item_link": itemLink,
//         "fees": fees,
//         "created_at": createdAt.toIso8601String(),
//         "updated_at": updatedAt.toIso8601String(),
//       };
// }

