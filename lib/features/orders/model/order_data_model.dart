class OrderItem {
  final String hotelName;
  final String productName;
  final String orderId;
  final int quantity;
  final double price;
  final String status;

  OrderItem({
    required this.hotelName,
    required this.productName,
    required this.orderId,
    required this.quantity,
    required this.price,
    required this.status,
  });
}