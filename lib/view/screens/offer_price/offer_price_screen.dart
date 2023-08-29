import 'package:Kitchen_system/helper/configs/app.dart';
import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:Kitchen_system/view/base/custom_button.dart';
import 'package:Kitchen_system/view/base/custom_drawer.dart';
import 'package:Kitchen_system/view/screens/offer_price/controller/offer_screen_controller.dart';
import 'package:Kitchen_system/view/screens/price_details/price_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OfferPriceScreen extends StatelessWidget {
  const OfferPriceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OfferScreenController());
    AppSetting.init(context);
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        // leading: Icon(Icons.menu, color: Theme.of(context).primaryColor),
        centerTitle: true,
        title: Text("عرض الاسعار",
            style: cairoRegular.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: AppDimensions.font(Dimensions.FONT_SIZE_SMALL))),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppDimensions.space(Dimensions.heightSmall).sBH,
            Row(
              children: [
                AppDimensions.space(Dimensions.heightSmall).sBW,
                Text(
                  "النوع",
                  style: cairoRegular.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize:
                          AppDimensions.font(Dimensions.FONT_SIZE_EXTRA_SMALL)),
                ),
              ],
            ),
            AppDimensions.space(Dimensions.heightExtraSmall).sBH,
            Row(
              children: [
                AppDimensions.space(Dimensions.heightSmall).sBW,
                CustomButton(
                  width: AppDimensions.space(Dimensions.FONT_SIZE_EXTRA_SMALL),
                  radius: 9,
                  onPressed: () {
                    Get.to(() => PriceDetailsScreen());
                  },
                  buttonText: "إضافة",
                  icon: Icons.add,
                ),
              ],
            ),
            GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                itemCount: 5,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: 2 / 0.7, crossAxisCount: 2),
                itemBuilder: (_, index) => Obx(() => RadioListTile(
                    title: Text(controller.labels[index]),
                    value: false,
                    groupValue: controller.checkedValue[index],
                    onChanged: (v) {
                      // controller.checkedValue[index] = v ?? false;
                      print(v);
                    })))
          ],
        ),
      ),
    );
  }
}
