import 'package:Kitchen_system/helper/configs/app.dart';
import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/utill/images.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:Kitchen_system/view/screens/home/controller/home_controller.dart';
import 'package:Kitchen_system/view/screens/offer_price/offer_price_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(HomeScreenController());
    AppSetting.init(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          leadingWidth: AppDimensions.space(4),
          leading: Row(
            children: [
              Image.asset(
                Images.notificationIcon,
                width: AppDimensions.space(2),
              ),
              Image.asset(
                Images.settingIcon,
                width: AppDimensions.space(2),
              ),
            ],
          ),
          title: Text(
            "الصفحة الرئيسية",
            style: cairoBold.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: AppDimensions.font(Dimensions.FONT_SIZE_SMALL)),
          ),
        ),
        body: GridView.builder(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: controller.labels.length - 1,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 3 / 2),
            itemBuilder: (_, index) => Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(() => controller.screens[index+1]);
                      },
                      child: Container(
                        width: AppDimensions.space(5),
                        height: AppDimensions.space(5),
                        decoration: BoxDecoration(
                            color: Theme.of(context).cardColor,
                            shape: BoxShape.circle),
                        child: Center(
                            child: Image.asset(
                          controller.images[index + 1],
                          width: AppDimensions.space(1.8),
                          color: Theme.of(context).primaryColor,
                        )),
                      ),
                    ),
                    Text(
                      controller.labels[index + 1],
                      style: cairoRegular.copyWith(
                          color: Theme.of(context).primaryColor,
                          fontSize: AppDimensions.font(
                              Dimensions.FONT_SIZE_EXTRA_SMALL)),
                    )
                  ],
                )),
      ),
    );
  }
}
