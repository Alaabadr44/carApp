import '../../base/BaseResponse.dart';

class HomeResModel extends BaseResponse<HomeResModel> {
  HomeResModel({
    required this.status,
    required this.msg,
    required this.data,
  });

  int status;
  String msg;
  Data data;

  factory HomeResModel.fromJson(Map<String, dynamic> json) => HomeResModel(
        status: json["status"],
        msg: json["msg"],
        data: Data.fromJson(json["data"]),
      );
}

class Data {
  Data({
    required this.stories,
    required this.banar,
    required this.cars,
    required this.notificationCount,
    required this.footer,
  });

  List<Story> stories;
  String banar;
  List<Car> cars;
  String footer;
  int notificationCount;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        stories:
            List<Story>.from(json["stories"].map((x) => Story.fromJson(x))),
        banar: json["banar"],
        cars: (json["cars"] as List).isNotEmpty
            ? List<Car>.from(json["cars"].map((x) => Car.fromJson(x)))
            : [],
        notificationCount: json["notification_count"],
        footer: json["footer"],
      );
}

class Car {
  Car({
    required this.id,
    required this.imagePath,
    required this.topHeadLine,
    required this.salary,
    required this.yearOfManufacture,
    required this.kilometer,
    required this.guaranteedTo,
    required this.type,
    required this.isFavorites,
    required this.status,
    required this.evenGuaranteed,
    required this.features,
    required this.description,
    required this.cylinder,
    required this.agentImgUrl,
    required this.agentName,
    required this.more,
  });

  int id;
  String imagePath;
  String topHeadLine;
  String salary;
  String yearOfManufacture;
  String kilometer;
  String guaranteedTo;
  Type type;
  bool isFavorites;
  String status;
  String evenGuaranteed;
  List<Features> features;
  String description;
  int cylinder;
  String agentName;
  String agentImgUrl;
  List<Car> more;
  factory Car.fromJson(Map<String, dynamic> json) => Car(
      id: json["id"],
      imagePath: json["image_path"],
      topHeadLine: json["topHeadLine"],
      salary: json["salary"],
      yearOfManufacture: json["yearOfManufacture"],
      kilometer: json["kilometer"],
      guaranteedTo: json["guaranteedTo"],
      type: typeValues.map[json["type"]]!,
      isFavorites: json["is_favorites"],
      status: json["status"],
      evenGuaranteed: json["even_guaranteed"],
      features:
          (json["features"] as List).map((e) => Features.fromJson(e)).toList(),
      description: json["description"],
      cylinder: json['cylinder'],
      agentImgUrl: json['agent_img_url'],
      agentName: json['agent_name'],
      more: List<Car>.from(json["more_cars"].map((x) => Car.fromJson(x))));
}

class Features {
  Features({
    required this.key,
    required this.value,
  }) {
    type = featuresTypeValues.map[key]!;
  }

  final String key;
  final String value;
  late FeaturesType type;
  factory Features.fromJson(Map<String, dynamic> json) =>
      Features(key: json['key'], value: json['value']);
}

enum FeaturesType {
  exteriorColor,
  innerColor,
  seatType,
  sunroof,
  rearCamera,
  sensor,
  cylinder,
  motionVector,
}

// String getFeaturesTypeIcon(FeaturesType type) {
//   switch (type) {
//     case FeaturesType.exteriorColor:
//       // Handle exterior color feature
//       break;
//     case FeaturesType.innerColor:
//       // Handle inner color feature
//       break;
//     case FeaturesType.seatType:
//       // Handle seat type feature
//       break;
//     case FeaturesType.sunroof:
//       // Handle sunroof feature
//       break;
//     case FeaturesType.rearCamera:
//       // Handle rear camera feature
//       break;
//     case FeaturesType.sensor:
//       // Handle sensor feature
//       break;
//     case FeaturesType.cylinder:
//       // Handle cylinder feature
//       break;
//     case FeaturesType.motionVector:
//       // Handle motion vector feature
//       break;
//     default:
//       // Handle unknown feature type
//       break;
//   }
// }

final featuresTypeValues = EnumValues({
  "اللون الخارجي": FeaturesType.exteriorColor,
  "اللون الداخلي": FeaturesType.innerColor,
  "نوع المقعد": FeaturesType.seatType,
  "فتحة السقف": FeaturesType.sunroof,
  "كاميرا خلفية": FeaturesType.rearCamera,
  "سينسر": FeaturesType.sensor,
  "سيلندر": FeaturesType.cylinder,
  "ناقل الحركة": FeaturesType.motionVector,
});

enum Type { ASIN, EUROPEAN, AMERICAN }

final typeValues = EnumValues(
    {"American": Type.AMERICAN, "asin": Type.ASIN, "European": Type.EUROPEAN});

class Story {
  Story({
    required this.id,
    required this.imagePath,
    required this.title,
    required this.isShow,
  });

  int id;
  String imagePath;
  String title;
  bool isShow;

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        id: json["id"],
        imagePath: json["image_path"],
        title: json["title"],
        isShow: json["is_show"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_path": imagePath,
        "title": title,
        "is_show": isShow,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
