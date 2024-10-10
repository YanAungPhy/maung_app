import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:two_d/utils/const_text.dart';
import 'package:two_d/utils/shared_pref.dart';
import '../models/response_model.dart';

enum RequestType { get, post, getNum, put }

class ApiService {
  String baseUrl = ConstText.baseUrl;
  // GetRequest
  Future<ResponseModel> getReq(
    String endPoint, {
    Map<String, dynamic>? mapParam,
    FormData? formData,
  }) {
    return dioReq(
      RequestType.get,
      endPoint: endPoint,
      formData: formData,
      mapParam: mapParam,
    );
  }

  // Check app update
  Future<ResponseModel> checkAppUpdate(String endPoint) {
    return dioReq(
      RequestType.getNum,
      endPoint: endPoint,
    );
  }

  // Get Win Num
  Future<ResponseModel> getWinNum(String endPoint) {
    return dioReq(
      RequestType.getNum,
      endPoint: endPoint,
    );
  }

// PostRequest
  Future<ResponseModel> postReq(
    String endPoint, {
    Map<String, dynamic>? mapParam,
    FormData? formData,
  }) {
    return dioReq(
      RequestType.post,
      endPoint: endPoint,
      formData: formData,
      mapParam: mapParam,
    );
  }

  // PutReq
  Future<ResponseModel> putReq(
    String endPoint, {
    Map<String, dynamic>? mapParam,
    FormData? formData,
  }) {
    return dioReq(
      RequestType.put,
      endPoint: endPoint,
      formData: formData,
      mapParam: mapParam,
    );
  }

// DioRequest
  Future<ResponseModel> dioReq(
    RequestType requestType, {
    required String endPoint,
    Map<String, dynamic>? mapParam,
    FormData? formData,
    Function? onDataCallBack,
    Function? onErrorCallBack,
  }) async {
    BaseOptions options = BaseOptions();

    String? tokens = await SharedPref.getData(key: ConstText.token);
    if (tokens != 'null' || tokens != null) {
      options.headers = {"Authorization": "Bearer  $tokens"};
    }

    options.validateStatus = (status) {
      return status! <= 500;
    };
    Dio dio = Dio(options);
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

    ResponseModel responseModel = ResponseModel();
    Response response;
    try {
      // Response response;
      // check request type
      if (requestType == RequestType.getNum) {
        response = await dio.get(endPoint);
      } else if (requestType == RequestType.get) {
        if (mapParam != null) {
          response =
              await dio.get("$baseUrl$endPoint", queryParameters: mapParam);
        } else {
          response = await dio.get("$baseUrl$endPoint");
        }
      } else if (requestType == RequestType.post) {
        if (mapParam != null || formData != null) {
          response =
              await dio.post("$baseUrl$endPoint", data: mapParam ?? formData);
        } else {
          response = await dio.post("$baseUrl$endPoint");
        }
      } else {
        if (mapParam != null || formData != null) {
          response =
              await dio.put("$baseUrl$endPoint", data: mapParam ?? formData);
        } else {
          response = await dio.put("$baseUrl$endPoint");
        }
      }

      if (response.statusCode == 200) {
        if (response.data.toString().startsWith("[")) {
          List<dynamic> responseList = response.data;
          responseModel.msgState = MsgState.data;
          responseModel.data = responseList;
          return responseModel;
        }
        Map<String, dynamic> responseMap = response.data;
        responseModel.msgState = MsgState.data;
        responseModel.data = responseMap;
        return responseModel;
      } else if (response.statusCode == 400) {
        Map<String, dynamic> responseMap = response.data;
        responseModel.msgState = MsgState.error;
        responseModel.data = responseMap['message'].toString();
        responseModel.errState = ErrState.userErr;
        return responseModel;
      } else if (response.statusCode == 404) {
        responseModel.data = 'Not Found Error';
        responseModel.msgState = MsgState.error;
        responseModel.errState = ErrState.notFoundErr;
        return responseModel;
      } else if (response.statusCode == 500) {
        responseModel.data = 'Internal Server Error';
        responseModel.msgState = MsgState.error;
        responseModel.errState = ErrState.severErr;
        return responseModel;
      } else {
        responseModel.data = 'Unknown Error';
        responseModel.msgState = MsgState.error;
        responseModel.errState = ErrState.unknownErr;
        return responseModel;
      }
    } catch (e) {
      print(e.toString());
      if (e.toString().contains('Connecting timed out') ||
          e.toString().contains('SocketException')) {
        responseModel.data = 'အင်တာနက်မရှိပါ';
        responseModel.msgState = MsgState.error;
        responseModel.errState = ErrState.noConnectionErr;
        return responseModel;
      } else {
        responseModel.data = 'Unknown Error';
        responseModel.msgState = MsgState.error;
        responseModel.errState = ErrState.unknownErr;
        return responseModel;
      }
    }
  }
}
