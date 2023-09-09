import 'package:Kitchen_system/helper/network/dio_integration.dart';
import 'package:Kitchen_system/helper/network/error_handler.dart';
import 'package:Kitchen_system/model/body/AddClientModel.dart';
import 'package:Kitchen_system/model/body/add_client_file_model.dart';
import 'package:Kitchen_system/model/response/client_model.dart';
import 'package:Kitchen_system/model/response/kitchen_model.dart';
import 'package:Kitchen_system/model/response/units_model.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:Kitchen_system/view/base/custom_snackbar.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class PriceDetailsServices {
  final dio = DioUtilNew.dio;

  getPriceDetails() async {
    try {
      final response = await dio!.get(AppConstants.loadPriceOffer);
      if (response.statusCode == 200) {
        return KitchenModel.fromJson(response.data);
      } else {
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  getUnits() async {
    try {
      final response = await dio!.get(AppConstants.getUnitsItemsbyCategory);
      if (response.statusCode == 200) {
        return UnitsModel.fromJson(response.data);
      } else {
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  addClient(BuildContext context, {AddClientModel? clientModel}) async {
    try {
      final response =
          await dio!.post(AppConstants.addClient, data: clientModel?.toJson());
      if (response.statusCode == 200) {
        showCustomSnackBar("تم اضافه العميل بنجاح", context, isError: false);
        return ClientModel.fromJson(response.data);
      } else {
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }

  addClientFile(BuildContext context, {AddClientFileModel? clientModel}) async {
    try {
      final response = await dio!
          .post(AppConstants.addClientFile, data: clientModel?.toJson());
      if (response.statusCode == 200) {
        showCustomSnackBar("تمت الاضافه  بنجاح", context, isError: false);
        return ClientModel.fromJson(response.data);
      } else {
        HandleError.handleException(response: response.statusCode);
      }
    } catch (e) {
      if (e is DioErrorType) {
        HandleError.handleExceptionDio(e);
      }
    }
  }
}
