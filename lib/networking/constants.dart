

// ignore_for_file: constant_identifier_names

class ApiConstants {
  static var environment = ENVIRONMENT.DEV;

  static const baseDevUrl = "http://196.218.209.39:8081";

  static const home = "/api/v2/home/";
 


  static const defaultSubStatus = 0;
  static const saveFile = "file/save";

  static bool enableMockUp = true;
}

class CacheStorageKeys {
  CacheStorageKeys._();
  // static const basketProductsKey = 'basket_products_key';

}

enum ENVIRONMENT {
  DEV,
  QC,
  PROD,
  MOCKUP,
}
