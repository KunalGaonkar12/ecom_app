import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import '../../../constants/apiEndPoints.dart';
import '../../../constants/AppStrings.dart';
import '../../../helper/ApiHandler.dart';
import '../model/Seller.dart';
import '../model/UserSoldProducts.dart';
import '../model/Users.dart';
import '../model/orderDetails.dart';
import '../model/pendingRequests.dart';
import '../model/sell_item_data.dart';
import '../model/appointmentUserModel.dart';
import '../model/products.dart';
import '../model/services.dart';



class UserController{

  static Future<List<AppointmentsUser>> getAppointments(String email) async {
    var postData = {
      'email': email,
    };
    var formData = FormData.fromMap(postData);
    try{
      var response = await GetDio.getDio()
          .post(ApiEndPoints.appointments_user, data: formData);
      return appointmentsUserFromJson(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
      return <AppointmentsUser>[];
    }

  }

 static Future<List<Products>> fetchAllCartItems() async {
   try{
     var response = await GetDio.getDio()
         .get(ApiEndPoints.appointments_user);
     return productsFromJson(response.data);
   }
   catch(e){
     EasyLoading.showError(AppStrings.ApiErrorMessage);
     return <Products>[];
   }
  }

  static Future<List<Products>> fetchAllProductsForRecomended() async {
    try{
      var response = await GetDio.getDio()
          .get(ApiEndPoints.product_list2);
      return productsFromJson(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
      return <Products>[];
    }

  }

  static  Future<List<Products>> fetchAllProducts() async {
    try{
      var response = await GetDio.getDio()
          .get(ApiEndPoints.product_list);

      return productsFromJson(response.data);
    }
    catch(e){
      print(e.toString());
      EasyLoading.showError(AppStrings.ApiErrorMessage);
      return <Products>[];
    }

  }

 static Future<List<RepairApi>> fetchAllServices() async {
   try{
     var response = await GetDio.getDio()
         .get(ApiEndPoints.repairapi);
     return repairApiFromJson(response.data);
   }
   catch(e){
     EasyLoading.showError(AppStrings.ApiErrorMessage);
     return <RepairApi>[];
   }

  }
  static Future<List<Category1>> fetchAllCategory() async {
    try{
      var response = await GetDio.getDio()
          .get(ApiEndPoints.categoryapi);
      return categoryFromJson(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
      return <Category1>[];
    }

  }

 static Future<List<Users>> fetchAllUsers() async {
   try{
     var response = await GetDio.getDio()
         .get(ApiEndPoints.userapi);
     return usersFromJson(response.data);
   }
   catch(e){
     EasyLoading.showError(AppStrings.ApiErrorMessage);
     return <Users>[];
   }

  }


 static Future<List<Seller>> fetchAllSeller() async {
   try{
     var response = await GetDio.getDio()
         .get(ApiEndPoints.sellerapi);
     return sellerFromJson(response.data.toString());
   }
   catch(e){
     print(e.toString());
     EasyLoading.showError(AppStrings.ApiErrorMessage);
     return <Seller>[];
   }

  }

  static Future<List<ProductsUser>> fetchAllProductsUser() async {
    try{
      var response = await GetDio.getDio()
          .get(ApiEndPoints.user_products_list);
      return productsUserFromJson(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
      return <ProductsUser>[];
    }

  }

  static Future confirmSendMessage(postData) async {
    var formData = FormData.fromMap(postData);
    try{
      var response = await GetDio.getDio()
          .post(ApiEndPoints.send_message,data: formData);
      return  jsonDecode(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
    }
  }

  static Future confirmRepairRequest(postData) async {
    var formData = FormData.fromMap(postData);
    try{
      var response = await GetDio.getDio()
          .post(ApiEndPoints.repair_request,data: formData);
      return  jsonDecode(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
    }

  }

  static Future rejectRepair(String rid) async {
    var postData = {
      'rid': rid,
    };
    var formData = FormData.fromMap(postData);
    try{
      await GetDio.getDio()
          .post(ApiEndPoints.reject_request,data: formData);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
    }
  }


  static Future<List<PendingRequests>> postEmail(String email) async {
    var postData = {
      'email': email,
    };
    var formData = FormData.fromMap(postData);
    try{
      var response  =  await GetDio.getDio()
          .post(ApiEndPoints.pendingrequests,data: formData);
      return pendingRequestsFromJson(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
      return <PendingRequests>[];
    }
  }

  static Future<List<OrderDetails>> fetchOrderHistory(String email) async {
    var postData = {
      'email': email,
    };
    var formData = FormData.fromMap(postData);
    try {
      var response = await GetDio.getDio()
          .post(ApiEndPoints.fetch_order_user, data: formData);
      return orderDetailsFromJson(response.data);
    }

    catch (e) {
      EasyLoading.showError(AppStrings.ApiErrorMessage);
      return <OrderDetails>[];
    }
  }



  static Future sellItem(postData) async {
    var formData = FormData.fromMap(postData);
    try{
      var response = await GetDio.getDio()
          .post(ApiEndPoints.reject_request,data: formData);
      return  jsonDecode(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
    }

  }

  static Future updateGSTShop(postData) async {
    var formData = FormData.fromMap(postData);
    try{
      var response = await GetDio.getDio()
          .post(ApiEndPoints.update_gst_shop, data: formData);
      return  jsonDecode(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
    }

  }

  static Future changeRepairDateTime(postData) async {
    var formData = FormData.fromMap(postData);
    try{
      var response = await GetDio.getDio()
          .post(ApiEndPoints.change_repair_time_date, data: formData);
      return  jsonDecode(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
    }

  }

  static Future fetchProfile(String email) async {
    var postData = {
      'email': email,
    };
    var formData = FormData.fromMap(postData);
    try{
      var response = await GetDio.getDio()
          .post(ApiEndPoints.fetch_seller_profile, data: formData);
      return jsonDecode(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
    }
  }

  static Future fetchWallet(String email) async {
    var postData = {
      'email': email,
    };
    var formData = FormData.fromMap(postData);
    try{
      var response = await GetDio.getDio()
          .post(ApiEndPoints.fetch_wallet, data: formData);
      return  jsonDecode(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
    }
  }

  static Future removeFromCart({required String email, required String pid}) async {
    var postData = {
      'email': email,
      'pid': pid,
    };
    var formData = FormData.fromMap(postData);
    try{
      var response = await GetDio.getDio()
          .post(ApiEndPoints.remove_from_cart, data: formData);
      return  jsonDecode(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
    }
  }

  static Future uploadContacts(postData) async {
    try{
      var response = await GetDio.getDio()
          .post(ApiEndPoints.usercontact, data: postData);
      return  jsonDecode(response.data);
    }
    catch(e){
      EasyLoading.showError(AppStrings.ApiErrorMessage);
    }
  }

}

