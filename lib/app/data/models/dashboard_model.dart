class DashboardModel {
  double? ordersTotal;
  double? ordersCount;
  double? salesTotal;
  double? salesCount;
  double? averageTicket;
  List<OrdersModel>? orders;

  DashboardModel({
    this.ordersCount,
    this.ordersTotal,
    this.salesCount,
    this.salesTotal,
    this.averageTicket,
    this.orders,
  });

  DashboardModel.fromJson(Map<String, dynamic> json) {
    ordersCount = json["orders_total"];
    ordersTotal = json["orders_count"];
    salesCount = json["sales_total"];
    salesTotal = json["sales_count"];
    averageTicket = json["average_ticket"];
    orders = (json["orders"] as List).map(JsonToOrder.fromJson).toList();
  }
}

class OrdersModel {
  String? idOrder;
  String? idSeller;
  DateTime? createTime;
  String? name;
  String? cpf;
  String? statusOrder;
  String? statusPayment;
  String? paymentMethod;
  double? total;

  OrdersModel({
    this.idOrder,
    this.idSeller,
    this.createTime,
    this.name,
    this.cpf,
    this.statusOrder,
    this.statusPayment,
    this.paymentMethod,
    this.total,
  });
}

class JsonToOrder {
  static OrdersModel fromJson(dynamic json) {
    return OrdersModel(
      idOrder: json['_id'],
      idSeller: json['seller']['id'],
      createTime: DateTime.parse(json['createdAt']),
      name: json['customer']['name'],
      cpf: json['customer']['doc'],
      statusOrder: json['status'],
      statusPayment: json['payment']['status'],
      paymentMethod: json['payment']['method'],
      total: json['payment']['amount'],
    );
  }
}
