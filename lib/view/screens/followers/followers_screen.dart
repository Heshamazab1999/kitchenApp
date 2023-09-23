import 'package:Kitchen_system/helper/configs/app_dimensions.dart';
import 'package:Kitchen_system/utill/extension_sized_box.dart';
import 'package:Kitchen_system/view/base/custom_button.dart';
import 'package:Kitchen_system/view/base/custom_text_field.dart';
import 'package:Kitchen_system/view/screens/followers/controller/follower_controller.dart';
import 'package:file_icon/file_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FollowersScreen extends StatelessWidget {
  const FollowersScreen({super.key, this.clientFileId});

  final int? clientFileId;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FollowerController(id: clientFileId));
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
        title: const Text("المتابعات",
            style: TextStyle(fontSize: 20, color: Colors.black)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Text(
              "تفاصيل الطلب",
              style: TextStyle(color: Colors.black, fontSize: 18),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "ملف طلب",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Obx(() => Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(color: Colors.grey)),
                        child: FileIcon(
                          controller.path.value,

                          // Icon size
                          size: 50,
                        ),
                      )),
                  IconButton(
                    icon:
                        const Icon(Icons.upload, color: Colors.black, size: 35),
                    onPressed: () {
                      controller.selectFile();
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Text(
                    "ملاحظة",
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  Expanded(child: CustomTextField(
                    onChanged: (value) {
                      controller.note.value = value;
                    },
                  ))
                ],
              ),
            ),
            20.sBH,
            CustomButton(
              width: AppDimensions.space(10),
              buttonText: "اضافه",
              onPressed: () {
                controller.addFollowUp(context, clientFileId: clientFileId);
              },
            )
          ],
        ),
      ),
    ));
  }
}
