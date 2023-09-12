import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../constants/apiEndPoints.dart';
import '../../../constants/AppStrings.dart';
import '../../../helper/ApiHandler.dart';

class UserAuthController{

  static Future userLogin(String email,String password) async {
    var data = {
      "email": email,
      "password": password,
    };
    var formData = FormData.fromMap(data);
    try{
      var response = await GetDio.getDio()
          .post(ApiEndPoints.loginapi, data: formData);
      var decodedResponse = jsonDecode(response.data);
      return decodedResponse;
    }catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
    }

  }
  static Future RegisterUser({required String email,required String password,required String code}) async {
    var postData = {
      "email": email,
      "password": password ,
      "code": code,
    };
    var formData = FormData.fromMap(postData);
    try{
    await GetDio.getDio()
          .post(ApiEndPoints.registerapi, data: formData);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
    }

  }
  static Future userOwnerLogin({required String email, required String password}) async {
    var data = {
      "email": email ,
      "password": password,
    };
    var formData = FormData.fromMap(data);
    try{
      var response = await GetDio.getDio()
          .post(ApiEndPoints.loginapiowner, data: formData);
      var decodedResponse = jsonDecode(response.data);
      return decodedResponse;
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
    }

  }

  static Future registerApiOwner(data) async {
    var formData = FormData.fromMap(data);
    try {
      var response = await GetDio.getDio()
          .post(ApiEndPoints.registrationapiowner, data: formData);
      return jsonDecode(response.data);
    }
    catch (e) {
      EasyLoading.showError(AppStrings.ApiErrorMessage);
    }
  }


}