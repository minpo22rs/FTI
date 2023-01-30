import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:mtw_project/main.dart';
import 'package:mtw_project/models/attraction_model.dart';
import 'package:mtw_project/models/banner_main.dart';
import 'package:mtw_project/models/category_product_model.dart';
import 'package:mtw_project/models/category_restaurant.dart';
import 'package:mtw_project/models/hotel_model.dart';
import 'package:mtw_project/models/product_reccomment_model.dart';
import 'package:mtw_project/models/rating_line_one.dart';
import 'package:mtw_project/models/rating_line_two.dart';
import 'package:mtw_project/models/rating_one_model.dart';
import 'package:mtw_project/models/rating_two_model.dart';
import 'package:mtw_project/models/restaurant_model.dart';
import 'package:mtw_project/utill/color.resouces.dart';
import 'package:mtw_project/views/screens/auth/login_screen.dart';
import 'package:mtw_project/views/screens/auth/new_login_screen.dart';
import 'package:mtw_project/views/screens/pages/home_scrren.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class LoadingScreen extends StatefulWidget {
  final String userid;
  const LoadingScreen({Key? key, required this.userid}) : super(key: key);
  @override
  _LoadingScreenState createState() => _LoadingScreenState(userid);
}

class _LoadingScreenState extends State<LoadingScreen> {
  late String userid;
  _LoadingScreenState(this.userid);
  @override
  void initState() {
    super.initState();
    indexmain();

    // _mockcheckforSession().then((status) {
    //   if (status) {
    //     _navigateToHome();
    //   } else {
    //     _navigateToHome();
    //   }
    // });
  }

  Future<Null> indexmain() async {
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final String? userId = prefs.getString('username');

    var url = "https://fti77.sapappwork.xyz/API/index-main";
    var data = {'userid': userid};
    await http.post(Uri.parse(url), body: data).then((response) async {
      var result1 = jsonDecode(response.body);
      resultData = result1['bannermain'];
      main = <Main>[];
      resultData2 = result1['top1'];
      onecon = <RatingOne>[];
      resultData3 = result1['top3'];
      twocon = <RatingTwo>[];
      resultData4 = result1['top9'];
      onelinecon = <RatingLineone>[];
      resultData5 = result1['top15'];
      twolinecon = <RatingLineTwo>[];
      bannersub = result1['banners']['photo'];
      bannerfooter = result1['bannerf']['photo'];
      resultRestaurant = result1['restaurant'];
      restaurants = <Restaurant>[];
      resultProduct = result1['product'];
      products = <ProductRec>[];
      resultHotel = result1['hotel'];
      hotels = <Hotel>[];
      resultAttraction = result1['location'];
      attractions = <Attraction>[];
      var numformat =
          NumberFormat('#,###.##').format(result1['account']['wallet']);
      account_name = '${result1['account']['name']}';
      account_wallet = '${numformat}';
      resultDatacate = result1['cate_p'];
      cate = <CategoryProduct>[];
      resultDatacater = result1['cate_r'];
      cater = <CategoryRestaurant>[];

      for (var i = 0; i < resultData.length; i++) {
        Main t = Main.fromJson(resultData[i]);
        main.add(t);
      }
      for (var j = 0; j < resultData2.length; j++) {
        RatingOne d = RatingOne.fromJson(resultData2[j]);
        onecon.add(d);
      }
      for (var i = 0; i < resultData3.length; i++) {
        RatingTwo d = RatingTwo.fromJson(resultData3[i]);
        twocon.add(d);
      }
      for (var k = 0; k < resultData4.length; k++) {
        RatingLineone d = RatingLineone.fromJson(resultData4[k]);
        onelinecon.add(d);
      }
      for (var z = 0; z < resultData5.length; z++) {
        RatingLineTwo d = RatingLineTwo.fromJson(resultData5[z]);
        twolinecon.add(d);
      }
      for (var j = 0; j < resultRestaurant.length; j++) {
        Restaurant d = Restaurant.fromJson(resultRestaurant[j]);
        restaurants.add(d);
      }
      for (var j = 0; j < resultProduct.length; j++) {
        ProductRec d = ProductRec.fromJson(resultProduct[j]);
        products.add(d);
      }
      for (var j = 0; j < resultHotel.length; j++) {
        Hotel d = Hotel.fromJson(resultHotel[j]);
        hotels.add(d);
      }
      for (var j = 0; j < resultAttraction.length; j++) {
        Attraction d = Attraction.fromJson(resultAttraction[j]);
        attractions.add(d);
      }
      for (var i = 0; i < resultDatacate.length; i++) {
        CategoryProduct t = CategoryProduct.fromJson(resultDatacate[i]);
        cate.add(t);
      }
      for (var i = 0; i < resultDatacater.length; i++) {
        CategoryRestaurant t = CategoryRestaurant.fromJson(resultDatacater[i]);
        cater.add(t);
      }
      await Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => HomeScreen(
              mainbanner: main,
              onecon: onecon,
              twocon: twocon,
              onelinecon: onelinecon,
              twolinecon: twolinecon,
              bannersub: bannersub,
              bannerfooter: bannerfooter,
              restaurants: restaurants,
              categoryProduct: cate,
              categoryrestaurants: cater,
              products: products,
              hotels: hotels,
              attractions: attractions,
              wallet: account_wallet)));
    });
  }

  late String bannersub, bannerfooter, wallet;
  List<Main> main = <Main>[];
  var resultData;
  bool statusData = false;

  List<RatingOne> onecon = <RatingOne>[];
  var resultData2;

  List<RatingTwo> twocon = <RatingTwo>[];
  var resultData3;

  List<RatingLineone> onelinecon = <RatingLineone>[];
  var resultData4;

  List<RatingLineTwo> twolinecon = <RatingLineTwo>[];
  var resultData5;

  List<Restaurant> restaurants = <Restaurant>[];
  var resultRestaurant;

  List<ProductRec> products = <ProductRec>[];
  var resultProduct;

  List<Hotel> hotels = <Hotel>[];
  var resultHotel;

  List<Attraction> attractions = <Attraction>[];
  var resultAttraction;

  List<CategoryProduct> cate = <CategoryProduct>[];
  var resultDatacate;

  List<CategoryRestaurant> cater = <CategoryRestaurant>[];
  var resultDatacater;

  var account_name;
  var account_wallet;

  // Future<Null> accountDetail() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   final String? userId = prefs.getString('username');

  //   print(userId);
  //   if (userId != '') {
  //     var url = "https://fti77.sapappwork.xyz/API/account-detail";
  //     var data = {'userid': userId};
  //     await http.post(Uri.parse(url), body: data).then((response) {
  //       if (response.statusCode == 200) {
  //         var detail = jsonDecode(response.body);
  //         account_name = '${detail['name']}';
  //         account_wallet = '${detail['wallet']}';
  //         print(account_name);
  //         print(account_wallet);
  //       }
  //     });
  //   }
  // }

  Future<bool> _mockcheckforSession() async {
    await Future.delayed(Duration(milliseconds: 3500), () {});

    return true;
  }

  void _navigateToHome() async {
    await Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen(
            mainbanner: main,
            onecon: onecon,
            twocon: twocon,
            onelinecon: onelinecon,
            twolinecon: twolinecon,
            bannersub: bannersub,
            bannerfooter: bannerfooter,
            restaurants: restaurants,
            categoryProduct: cate,
            categoryrestaurants: cater,
            products: products,
            hotels: hotels,
            attractions: attractions,
            wallet: account_wallet)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Container(
            decoration: BoxDecoration(color: Colors.black),
          ),
          new Container(
            child: Image.asset('assets/images/bg2.jpg', fit: BoxFit.cover),
          ),
          Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          ColorResources.KTextPink),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      '   loading....',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
