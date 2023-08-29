import 'package:Kitchen_system/helper/configs/app.dart';
import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/dimensions.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/utill/styles.dart';
import 'package:Kitchen_system/view/base/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomRowTextField extends StatelessWidget {
  const CustomRowTextField({super.key, this.label});

  final String? label;

  @override
  Widget build(BuildContext context) {
    AppSetting.init(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Text(
            label!,
            style: cairoBold.copyWith(
                color: Theme.of(context).primaryColor,
                fontSize: AppDimensions.font(Dimensions.FONT_SIZE_EXTRA_SMALL)),
          ),
          AppDimensions.space(Dimensions.heightSmall).sBW,
          const Flexible(flex: 3, child: CustomTextField()),
          AppDimensions.space(Dimensions.heightSmall).sBW,
        ],
      ),
    );
  }
}
