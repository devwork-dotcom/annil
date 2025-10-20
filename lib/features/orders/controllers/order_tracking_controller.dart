import 'package:get/get.dart';

class OrderTrackingController extends GetxController {
  final isOrderPlaced = true.obs;
  final isOrderConfirmed = true.obs;
  final isProductDelivered = false.obs; // false করুন test করার জন্য

  final placedDate = '12/03/2025'.obs;
  final confirmDate = '12/03/2025'.obs;
  final deliveredDate = ''.obs;
  final estimateDelivery = ''.obs;

  List<Map<String, String>> get timelineData {
    final List<Map<String, String>> data = [];

    if (isOrderPlaced.value) {
      data.add({
        'title': 'Order placed',
        'date': placedDate.value.isNotEmpty ? placedDate.value : '',
        'status': 'completed', // status add করুন
      });
    }

    if (isOrderConfirmed.value) {
      data.add({
        'title': 'Order Confirm',
        'date': confirmDate.value.isNotEmpty ? confirmDate.value : '',
        'status': 'completed',
      });
    }

    if (isProductDelivered.value) {
      final Map<String, String> deliveredItem = {
        'title': 'Product delivered',
        'date': deliveredDate.value.isNotEmpty ? deliveredDate.value : '',
        'status': 'completed',
      };

      if (estimateDelivery.value.isNotEmpty) {
        deliveredItem['extra'] = 'Estimate delivery: ${estimateDelivery.value}';
      }

      data.add(deliveredItem);
    } else {
      data.add({
        'title': 'Product delivered',
        'date': '',
        'status': 'pending',
      });
    }

    return data;
  }

  String get currentStatus {
    if (isProductDelivered.value) return 'Delivered';
    if (isOrderConfirmed.value) return 'Order Confirmed';
    if (isOrderPlaced.value) return 'Order Placed';
    return 'Pending';
  }
}