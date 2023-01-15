class OrderModel
{
  int orderId;
  int orderCustomerId;
  int orderCustomerAddress;
  
  int order_delivery_id;
   String order_note;
  int order_rate;
  int item_id;
  double item_price;
  int item_qty;

  OrderModel({
    this.orderId,
    this.orderCustomerId,
    this.orderCustomerAddress,
    this.order_delivery_id,
    this.order_note,
    this.order_rate,
    this.item_id,
    this.item_price,
    this.item_qty
  });

  factory OrderModel.fromJson(Map<String, dynamic> json){
    return OrderModel(
      orderId: int.tryParse(json['order_id']),
      orderCustomerId: int.tryParse(json['order_customer_id ']),
      orderCustomerAddress: json['order_customer_address'],
      order_delivery_id: int.tryParse(json['order_delivery_id']),
      order_note:json['order_note'],
      order_rate: int.tryParse(json['order_rate']),
      item_id: int.tryParse( json['item_id']),
      item_price: double.tryParse( json['item_price']),
      item_qty: int.tryParse( json['item_qty']),
    );
  }

  
}