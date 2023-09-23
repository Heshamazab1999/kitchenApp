import 'package:Kitchen_system/helper/network/dio_integration.dart';
import 'package:Kitchen_system/helper/network/error_handler.dart';
import 'package:Kitchen_system/model/body/attachment_model.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/view/base/custom_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

class AttachmentService {
  final dio = DioUtilNew.dio;

  addAttachments({int? clientFileId, List<AttachmentModel>? files}) async {
    FormData formData = FormData.fromMap({});

    for (int i = 0; i < files!.length; i++) {
      final fileBytes = await files[i].attachmentPath!.readAsBytes();
      final file = MultipartFile.fromBytes(fileBytes,
          filename: files[i].attachmentPath!.path.split("/").last);

      // formData.fields.addAll([
      //   MapEntry('model[$i].statusId', files[i].statusId!),
      // ]);
      formData.files.addAll([
        MapEntry('model[$i].attachmentPath', file),
      ]);
    }
    final response = await dio!.put(AppConstants.addClientFileAttachment,
        data: formData, queryParameters: {"clientFileId": clientFileId});
    print(response.statusCode);
    print(response.data);
    if (response.statusCode == 200) {
      showCustomSnackBar("تمت الاضافه بنجاح", Get.context!);
    } else {
      HandleError.handleException(response: response.statusCode);
    }
  }
}
