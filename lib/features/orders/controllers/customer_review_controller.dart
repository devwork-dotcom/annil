import 'package:get/get.dart';

class CustomerReviewController extends GetxController {
  var rating = 0.0.obs;
  var reviewText = ''.obs;
  var isSubmitting = false.obs;

  void setRating(double value) {
    rating.value = value;
  }

  void setReviewText(String text) {
    reviewText.value = text;
  }

  void submitReview() async {
    if (rating.value == 0.0) {
      Get.snackbar(
        'Error',
        'Please select a rating',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    if (reviewText.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Please write a review',
        snackPosition: SnackPosition.BOTTOM,
      );
      return;
    }

    isSubmitting.value = true;

    // Simulate API call
    await Future.delayed(Duration(seconds: 2));

    isSubmitting.value = false;

    Get.snackbar(
      'Success',
      'Review submitted successfully',
      snackPosition: SnackPosition.BOTTOM,
    );

    // Clear form
    rating.value = 0.0;
    reviewText.value = '';
  }
}