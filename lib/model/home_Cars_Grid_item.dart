// ignore_for_file: file_names





import '../util/icons.dart';

class CarInfo {
  final String iconPath;
  final String infoValue;
  final String infoType;
  CarInfo({
    required this.iconPath,
    required this.infoValue,
    required this.infoType,
  });
}

enum CarDetails {
  salary,
  yearOfManufacture,
  kilometer,
  guaranteedTo,
}

String getCarInfoTypeWord(CarDetails detail) {
  if (detail == CarDetails.salary) {
    return "السعر";
  } else if (detail == CarDetails.yearOfManufacture) {
    return "سنةالصنع";
  } else if (detail == CarDetails.kilometer) {
    return "كم";
  } else if (detail == CarDetails.guaranteedTo) {
    return "مكفولةل ";
  } else {
    return "";
  }
}

String getCarInfoTypeIconPath(CarDetails detail) {
  if (detail == CarDetails.salary) {
    return iconHomeAd1;
  } else if (detail == CarDetails.yearOfManufacture) {
    return iconHomeAd2;
  } else if (detail == CarDetails.kilometer) {
    return iconHomeAd3;
  } else if (detail == CarDetails.guaranteedTo) {
    return iconHomeAd4;
  } else {
    return "";
  }
}
