import 'package:dio/dio.dart';
import 'package:Kitchen_system/helper/cache_helper.dart';
import 'package:Kitchen_system/utill/app_constants.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioUtilNew {
  static DioUtilNew? _instance;
  static Dio? _dio;

  static DioUtilNew? getInstance() {
    if (_instance == null) {
      _dio = Dio(_getOptions());
      // _dio!.interceptors.add(LoggingInterceptor());
      _dio!.interceptors.add((PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
      )));
    }
    return _instance;
  }

  static Dio? get dio => _dio;

  static void setDioAgain() {
    _dio = Dio(_getOptions());
  }

  static BaseOptions _getOptions() {
    BaseOptions options = BaseOptions(

      followRedirects: false,
      validateStatus: (status) => status! <= 500,
    );

    options.connectTimeout = 20 * 1000; //10 sec
    options.receiveTimeout = 20 * 1000; //20 sec
    options.baseUrl = AppConstants.baseurl;
    options.headers = {
      // 'Content-type': 'application/json',
      // 'Accept': 'application/json',
      'Authorization': "Bearer ${CacheHelper.getData(key: AppConstants.token)}",
      // "Accept-Language":
      //     CacheHelper.getData(key: AppConstants.languageCode) == "en"
      //         ? "en-US"
      //         : "ar-EG"
    };
    options.queryParameters = {};

    return options;
  }

//this just returns the language key
}
