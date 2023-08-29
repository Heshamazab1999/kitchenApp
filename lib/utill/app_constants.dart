import 'package:Kitchen_system/model/body/language_model.dart';
import 'package:Kitchen_system/utill/images.dart';

class AppConstants {
  static const String baseurl = 'http://194.163.132.242:5000/api';
  static const String baseurlImages = 'http://194.163.132.242:5000';

  static const String arabic = 'Arabic';
  static const String english = 'English';
  static const String saveLanguage = 'SaveLanguage';

  static const String language = 'language';
  static const String yes = 'yes';
  static const String no = 'no';
  static const String wantToSignOut = 'wantToSignOut';
  static const String wantToRemove = 'wantToRemove';
  static const String signSuccess = 'signSuccess';
  static const String sendSuccess = 'sendSuccess';
  static const String findLanguage = 'find_language';
  static const String chooseLanguage = 'choose_language';
  static const String sendFailure = 'sendFailure';
  static const String unauthorized = 'unauthorized';
  static const String notFoundUrl = 'notFoundUrl';
  static const String notHasAuthorized = 'notHasAuthorized';
  static const String signError = 'signError';
  static const String serverFailure = 'serverFailure';
  static const String saveLocation = 'saveLocation';
  static const String send = 'send';

  static const String youDeniedLocationPermission =
      'you_denied_location_permission';

  // Shared Key
  static const String theme = 'theme';
  static const String ownerId = 'ownerId';
  static const String token = 'multivendor_token';
  static const String expireOn = 'expireOn';
  static const String countryCode = 'country_code';
  static const String languageCode = 'language_code';

// endPoint

  static const String login = '/Users/Login';

  static List<LanguageModel> languages = [
    LanguageModel(
        imageUrl: Images.arabic,
        languageName: AppConstants.arabic,
        countryCode: 'SA',
        languageCode: 'ar'),
    LanguageModel(
        imageUrl: Images.unitedKingdom,
        languageName: AppConstants.english,
        countryCode: 'US',
        languageCode: 'en'),
  ];
}
