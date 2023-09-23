import 'dart:io';

import 'package:Kitchen_system/controller/base_controller.dart';
import 'package:Kitchen_system/model/body/attachment_model.dart';
import 'package:Kitchen_system/view/screens/attachments/attachment_services/attachment_services.dart';
import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';

class AttachmentController extends BaseController {
  final service = AttachmentService();
  final files = <File>[].obs;
  final attachments = <AttachmentModel>[].obs;

  selectFile() async {
    FilePickerResult? result =
        await FilePicker.platform.pickFiles(allowMultiple: true);

    if (result != null) {
      files.value = result.paths.map((path) => File(path!)).toList();
      files.forEach((element) {
        attachments.add(AttachmentModel(attachmentPath: element));
      });
    } else {
      // User canceled the picker
    }
  }

  addAttachments({int? clientFileId}) async {
    await service.addAttachments(
        clientFileId: clientFileId, files: attachments);
  }
}
