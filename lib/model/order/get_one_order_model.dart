class GetOneOrderModel {
  bool? success;
  Data? data;
  String? message;

  GetOneOrderModel({this.success, this.data, this.message});

  GetOneOrderModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['no'] = no;
    data['status'] = status;
    data['user_id'] = userId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    if (history != null) {
      data['history'] = history!.map((v) => v.toJson()).toList();
    }
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['item_name'] = itemName;
    data['item_descr'] = itemDescr;
    data['item_image'] = itemImage;
    data['price'] = price;
    data['item_link'] = itemLink;

    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['status'] = status;
    data['user_id'] = userId;
    data['order_id'] = orderId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
