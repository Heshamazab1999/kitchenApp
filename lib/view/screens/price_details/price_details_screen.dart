import 'package:Kitchen_system/helper/configs/app.dart';
import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:Kitchen_system/view/base/drop_down_widget.dart';
import 'package:Kitchen_system/view/base/row_text_field.dart';
import 'package:flutter/material.dart';

class PriceDetailsScreen extends StatelessWidget {
  const PriceDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    AppSetting.init(context);
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).primaryColor,
          ),
          centerTitle: true,
          title: Text(
            "عرض الاسعار",
            style: cairoBold.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: AppDimensions.font(Dimensions.FONT_SIZE_EXTRA_SMALL)),
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppDimensions.space(Dimensions.heightExtraSmall).sBH,
            Row(
              children: [
                AppDimensions.space(Dimensions.heightSmall).sBW,
                Text(
                  "الزبون ",
                  style: cairoBold.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize:
                          AppDimensions.font(Dimensions.FONT_SIZE_EXTRA_SMALL)),
                )
              ],
            ),
            const CustomRowTextField(label: "الاسم     "),
            const CustomRowTextField(label: "     الرقم"),
            const CustomRowTextField(label: "العنوان"),
            AppDimensions.space(Dimensions.heightExtraSmall).sBH,
            Row(
              children: [
                AppDimensions.space(Dimensions.heightSmall).sBW,
                Text(
                  "المطبخ ",
                  style: cairoBold.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize:
                          AppDimensions.font(Dimensions.FONT_SIZE_EXTRA_SMALL)),
                ),

              ],
            ),
            Row(
              children: [
                Expanded(child: DropDownWidget(label: "الجرانيت",list: [],onchange: (value){},)),
                AppDimensions.space(Dimensions.heightSmall).sBW,
                Expanded(child: const CustomRowTextField(label: "التوب"))
              ],
            ),
            Row(
              children: [
                AppDimensions.space(Dimensions.heightSmall).sBW,
                Text(
                  "المجاميع ",
                  style: cairoBold.copyWith(
                      color: Theme.of(context).primaryColor,
                      fontSize:
                          AppDimensions.font(Dimensions.FONT_SIZE_EXTRA_SMALL)),
                )
              ],
            ),
            Row(
              children: [
                Expanded(child: const CustomRowTextField(label: "الخشب")),
                Expanded(child: const CustomRowTextField(label: "المجلي")),
              ],
            ),
            Row(
              children: [
                Expanded(child: const CustomRowTextField(label: "التوصيلات")),
                Expanded(child: const CustomRowTextField(label: "خصم")),
              ],
            ),
            CustomRowTextField(label: "المجموع"),
            AppDimensions.space(Dimensions.heightExtraSmall).sBH,
            Row(
              children: [
                Expanded(child: const CustomRowTextField(label: "التوب")),
                Expanded(child: const CustomRowTextField(label: "الإنارة")),
              ],
            ),
            const Row(
              children: [
                Expanded(child: CustomRowTextField(label: "الشفا")),
                Expanded(child: CustomRowTextField(label: "الاياد")),
              ],
            ),
            const CustomRowTextField(label: "المجموع"),
            AppDimensions.space(Dimensions.heightExtraSmall).sBH,
            const Row(
              children: [
                Expanded(child: CustomRowTextField(label: " الاكسسوار")),
                Expanded(child: CustomRowTextField(label: "تسميك")),
              ],
            ),Row(
              children: [
                Expanded(child: const CustomRowTextField(label: "البطار")),
                Spacer()
              ],
            ),
            CustomRowTextField(label: "المجموع"),
            AppDimensions.space(Dimensions.heightExtraSmall).sBH,
            Row(
              children: [
                Expanded(child: const CustomRowTextField(label: " البانيل")),
                Expanded(child: const CustomRowTextField(label: "الكورنيش")),
              ],
            ),Row(
              children: [
                Expanded(child: const CustomRowTextField(label: "تصفيح الجدران ")),

              ],
            ),
            CustomRowTextField(label: "المجموع"),
            AppDimensions.space(Dimensions.heightExtraSmall).sBH,

          ],
        ),
      ),
    );
  }
}
