import 'dart:convert';
import 'package:ecommerce_int2/app/user_and_seller/controller/userController.dart';
import 'package:ecommerce_int2/helper/base.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

import '../../../../constants/apiEndPoints.dart';
import '../../model/orderDetails.dart';
import '../profile_page/profile_page.dart';


class OrderHistroyUser extends StatelessWidget {
  static const routeName = "/OrderHistoryUser";

  @override
  Widget build(BuildContext context) {
    final email = context.extra;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text('Order History'),
      ),
      backgroundColor: Color(0xffF9F9F9),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16.0),
                child: FutureBuilder(
                  future: UserController.fetchOrderHistory(email),
                  builder: (context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (_, index) {
                            OrderDetails request = snapshot.data[index];

                            return SingleChildScrollView(
                              child: Column(children: <Widget>[
                                ListTile(
                                  title: Text(
                                    request.productName,
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  leading: Icon(
                                    Icons.add_box,
                                  ),
                                ),
                                ListTile(
                                  title: Text("Seller: ${request.seller}"),
                                ),
                                ListTile(
                                  title: Text(
                                      "Total Amount: \u{20B9} ${request.totalAmount}"),
                                ),
                                Divider(),
                              ]),
                            );
                          });
                    } else {
                      Padding(
                          padding: EdgeInsets.only(
                            left: 16.0,
                            right: 16.0,
                            top: 30,
                          ),
                          child: Text(
                            "No Pending Requests!",
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ));
                    }
                    return CircularProgressIndicator.adaptive();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
