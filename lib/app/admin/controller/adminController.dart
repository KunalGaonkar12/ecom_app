
import 'package:dio/dio.dart';
import 'package:ecommerce_int2/constants/AppStrings.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../constants/apiEndPoints.dart';
import "dart:convert";
import 'package:ecommerce_int2/helper/app_properties.dart';
import '../../../helper/ApiHandler.dart';
import '../../user_and_seller/model/Seller.dart';
import '../../user_and_seller/model/Users.dart';
import '../../user_and_seller/model/getExtraCharges.dart';
import '../../user_and_seller/model/user_contact.dart';
import "package:http/http.dart" as http;

class AdminController{

 static Future<Map<String, String>> fetchAllContacts() async {
    var postData = {
      'email': "asd",
    };
    var formData = FormData.fromMap(postData);
    try{
      var response = await GetDio.getDio()
          .post(ApiEndPoints.fetch_contacts, data: formData);
      var k = List<String>.from(json.decode(UserContact.fromJson(jsonDecode(response.data)).name!));
      var v = List<String>.from(json.decode(UserContact.fromJson(jsonDecode(response.data)).phone!));
      return Map.fromIterables(k, v);
    }
    catch(e){
      print(e.toString());
      EasyLoading.showError(AppStrings.ApiErrorMessage);
      return <String, String>{};
    }

  }


 static Future<List<Seller>> fetchAllRestrictedSellers() async {
   try{
     var response = await GetDio.getDio()
         .get(ApiEndPoints.restrictedseller);
     return sellerFromJson(response.data);
   }
   catch(e){
     EasyLoading.showError(AppStrings.ApiErrorMessage);
     return <Seller>[];
   }

 }
 static Future<List<Users>> fetchAllRestrictedUsers() async {
   try{
     var response = await GetDio.getDio()
         .get(ApiEndPoints.restricteduser);
     return usersFromJson(response.data);
   }
   catch(e){
     EasyLoading.showError(AppStrings.ApiErrorMessage);
     return <Users>[];
   }

 }
 static Future<List<GetExtraCharges>> getExtraCharges() async {
   try{
     var response = await GetDio.getDio()
         .get(ApiEndPoints.get_extra_charges);
     return getExtraChargesFromJson(response.data);
   }
   catch(e){
     EasyLoading.showError(AppStrings.ApiErrorMessage);
     return <GetExtraCharges>[];
   }

 }

 static Future confirmRequest(postData) async {
   try{
     var response = await GetDio.getDio()
         .get(ApiEndPoints.change_charges);
    return jsonDecode(response.data);
   }
   catch(e){
     EasyLoading.showError(AppStrings.ApiErrorMessage);
   }
 }

 static Future restrictUser(String email, String change) async {
   var postData = {
     'email': email,
     'restrict': change,
   };
   var formData = FormData.fromMap(postData);
   try{
     var response = await GetDio.getDio()
         .post(ApiEndPoints.restrictuser,data: formData);
     return jsonDecode(response.data);
   }
   catch(e){
     EasyLoading.showError(AppStrings.ApiErrorMessage);
   }
 }


 static Future restrictSeller(String email, String change) async {
   var postData = {
     'email': email,
     'restrict': change,
   };
   var formData = FormData.fromMap(postData);
   try{
     var response = await GetDio.getDio()
         .post(ApiEndPoints.restrictseller,data: formData);
     return jsonDecode(response.data);
   }
   catch(e){
     EasyLoading.showError(AppStrings.ApiErrorMessage);
   }
 }
}