import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:get/get.dart';

class OfferScreenController extends BaseController {
  final labels = [
    "المطابخ",
    "الابواب",
    "خزائن الحائط",
    "الاعمال الخشبية",
    "الكل"
  ];
  final checkedValue = <bool>[].obs;
  final groupValue = false.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    checkedValue.value = List.filled(labels.length, false);
  }
}
