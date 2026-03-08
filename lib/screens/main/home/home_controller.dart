import 'package:get/get.dart';

import '/components/_.dart';

class HomeController extends AppBaseController {
  final amountCents = 0.obs;

  String get amountDisplay =>
      '${(amountCents.value / 100).toStringAsFixed(2)}₮';

  final itemCount = 0.obs;

  void onKeypadTap(String key) {
    if (key == 'C') {
      amountCents.value = 0;
      return;
    }
    if (key == '+') {
      itemCount.value = itemCount.value + 1;
      return;
    }
    final digit = int.tryParse(key);
    if (digit == null) return;
    const maxCents = 99999999;
    final next = amountCents.value * 10 + digit;
    amountCents.value = next > maxCents ? amountCents.value : next;
  }

  void onReviewSale() {
    // TODO: navigate to review sale
  }

  void onAddNote() {
    // TODO: add note
  }
}
