import 'BaseError.dart';

class BaseResponse<T> {
  T? result;
  bool? success;
  String? message;

  ResponseException? error;
  late Paging paging;
  late List<Links> links;

  BaseResponse();

  BaseResponse.fromJson(Map<String, dynamic> map) {
   

    if (map['status'] != 1) {
      success = false;
      message = map['message'];
    }
  }

  fromJson(Map<String, dynamic> map) {
    BaseResponse baseResponse = BaseResponse<T>();
    success = map['success'];
    message = map['message'];
    if (map.containsKey('error')) {
      error = ResponseException.fromJson(map['error']);
    }

    if (map.containsKey('result')) {
      var json = map['result'];

      if (json.runtimeType != List) {
        if (json.containsKey('paging')) {
          paging = Paging.fromJson(json['paging']);
        }

        if (json.containsKey('links')) {
          links = <Links>[];
          json['links'].forEach((v) {
            links.add(Links.fromJson(v));
          });
        }
      }
    }
  }

  _findValueByKey(Map<String, dynamic> map, dynamic key) {
    map.keys.firstWhere((k) => k.toString().contains(key), orElse: () => key);
  }
}

class Paging {
  late int totalItems;
  late int pageNumber;
  late int pageSize;
  late int totalPages;

  Paging();

  Paging.fromJson(Map<String, dynamic> json) {
    totalItems = json['totalItems'];
    pageNumber = json['pageNumber'];
    pageSize = json['pageSize'];
    totalPages = json['totalPages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalItems'] = totalItems;
    data['pageNumber'] = pageNumber;
    data['pageSize'] = pageSize;
    data['totalPages'] = totalPages;
    return data;
  }
}

class Links {
  late String href;
  late String rel;
  late String method;

  Links();

  Links.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    rel = json['rel'];
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['href'] = href;
    data['rel'] = rel;
    data['method'] = method;
    return data;
  }
}
