
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import '../../app/user_and_seller/model/getMessages.dart';
import '../../constants/AppStrings.dart';
import '../../constants/apiEndPoints.dart';
import 'package:http/http.dart' as http;

import '../../helper/ApiHandler.dart';

class CommonController {

  static validateEmail(String input, Function(bool _isEmailValid) callback) {
    if (input.length > 0) {
      callback(RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$').hasMatch(input));
    } else {
      callback(true);
    }
  }

  static Future<List<GetMessages>> getMessages(String email) async {
    var postData = {
      'email': email,
    };
    var formData = FormData.fromMap(postData);
    try{
      var response = await GetDio.getDio()
          .post(ApiEndPoints.get_message, data: formData);
      return getMessagesFromJson(response.data);
    }catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
      return <GetMessages>[];
    }

  }

}