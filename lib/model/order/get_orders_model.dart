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
