import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mtw_project/utill/color.resouces.dart';
import 'package:mtw_project/utill/dimensions.dart';
import 'package:mtw_project/utill/images.dart';
import 'package:mtw_project/views/basewidget/custom_bottomnavigator.dart';
import 'package:mtw_project/views/screens/account/foseller/scanner_screen.dart';
import 'package:mtw_project/views/screens/account/foseller/seller_screen.dart';
import 'package:mtw_project/views/screens/auth/change_password.dart';
import 'package:mtw_project/views/screens/auth/new_register_screen.dart';
import 'package:mtw_project/views/screens/auth/register_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:sizer/sizer.dart';
import 'package:http/http.dart' as http;

class NewLoginScreen extends StatefulWidget {
  const NewLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  _NewLoginScreenState createState() => _NewLoginScreenState();
}

class _NewLoginScreenState extends State<NewLoginScreen> {
  final phonectrl = TextEditingController();
  final passwordctrl = TextEditingController();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg2.jpg'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          ListView(
            children: [
              SizedBox(
                height: 85.sp,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 150.sp,
                    height: 150.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      image: DecorationImage(
                        image: AssetImage(Images.logofti77),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ลงชื่อเข้าระบบ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'เบอร์มือถือ (Phone Number)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                            // fontWeight: FontWeight.w100,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: 240.sp,
                          height: 30.sp,
                          child: TextField(
                            style: TextStyle(
                              fontSize: 13.0,
                              height: 0.9,
                              color: Colors.black,
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            controller: phonectrl,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                  width: 1.0,
                                ),
                              ),
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 14,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'รหัสผ่าน (Password)',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 10.sp,
                          ),
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Container(
                          width: 240.sp,
                          height: 30.sp,
                          child: TextField(
                            obscureText: true,
                            enableSuggestions: false,
                            autocorrect: false,
                            style: TextStyle(
                              fontSize: 13.0,
                              height: 0.9,
                              color: Colors.black,
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                            ],
                            controller: passwordctrl,
                            decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                  width: 1.0,
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(
                                  color: Colors.blueAccent,
                                  width: 1.0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 35),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ChangePassword()));
                              print('ลืมรหัสผ่าน');
                            },
                            child: Text(
                              'ลืมรหัสผ่าน (Forgot Password?)',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 9.5.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'ลงทะเบียนได้ที่นี่',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Text(
                                  'New Here? ',
                                  style: TextStyle(
                                    color: ColorResources.BG_Blue,
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    print('goto Register');
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => NewRegisterScreen(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    'Register',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 9.5.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            var url =
                                "https://fti77.sapappwork.xyz/API/login-mobile-mtwa";
                            var data = {
                              'phone': phonectrl.text,
                              'password': passwordctrl.text
                            };
                            await http
                                .post(Uri.parse(url), body: data)
                                .then((response) async {
                              print(phonectrl.text);
                              var result = jsonDecode(response.body);
                              if (response.statusCode == 200) {
                                if (result['statuslogin'] == '1') {
                                  final SharedPreferences prefs =
                                      await SharedPreferences.getInstance();
                                  prefs.setString(
                                      'username', '${result['user_id']}');
                                  prefs.setString('role', '${result['role']}');
                                  if (result['role'] == 'U') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => CustomBottomNavigator(
                                          userid: '${result['user_id']}',
                                        ),
                                      ),
                                    );
                                  } else if (result['role'] == 'S') {
                                    Navigator.pushAndRemoveUntil(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                SellerScreen(
                                                  userId:
                                                      '${result['user_id']}',
                                                )),
                                        (route) => false);
                                  }
                                } else {
                                  Fluttertoast.showToast(
                                      gravity: ToastGravity.CENTER,
                                      msg:
                                          "เบอร์โทรศัพท์ หรือ password ไม่ถูกต้อง",
                                      toastLength: Toast.LENGTH_SHORT);
                                }
                              } else {
                                Fluttertoast.showToast(
                                    gravity: ToastGravity.CENTER,
                                    msg: "error 50x contact Adminstator",
                                    toastLength: Toast.LENGTH_SHORT);
                              }
                            });
                          },
                          child: Container(
                            width: 115.sp,
                            height: 50.sp,
                            child: Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 18.sp,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              color: Colors.black87,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10.sp,
                    ),
                    Center(
                      child: Text(
                        'Or',
                        style: TextStyle(
                          color: ColorResources.KTextWhite,
                        ),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Sign in with',
                        style: TextStyle(
                          color: ColorResources.KTextWhite,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 18.0, right: 18, top: 10, bottom: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          (Platform.isIOS)
                              ? Column(
                                  children: [
                                    Container(
                                      child: SignInWithAppleButton(
                                        style: SignInWithAppleButtonStyle
                                            .whiteOutlined,
                                        onPressed: () async {
                                          final credential =
                                              await SignInWithApple
                                                  .getAppleIDCredential(
                                            scopes: [
                                              AppleIDAuthorizationScopes.email,
                                              AppleIDAuthorizationScopes
                                                  .fullName,
                                            ],
                                          );
                                          var url =
                                              "https://mtwa.xyz/API/appleIdsign";
                                          var data = {
                                            'appleId':
                                                credential.userIdentifier,
                                            'firstname':
                                                credential.givenName ?? '',
                                            'lastname':
                                                credential.familyName ?? '',
                                            'email': credential.email ?? ''
                                          };
                                          await http
                                              .post(Uri.parse(url), body: data)
                                              .then((value) async {
                                            var result = jsonDecode(value.body);

                                            if (result['status'] == 'S') {
                                              final SharedPreferences prefs =
                                                  await SharedPreferences
                                                      .getInstance();
                                              prefs.setString('username',
                                                  '${result['userId']}');
                                              prefs.setString(
                                                  'role', '${result['role']}');
                                              if (result['role'] == 'U') {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (ctx) =>
                                                        CustomBottomNavigator(
                                                      userid:
                                                          '${result['userId']}',
                                                    ),
                                                  ),
                                                );
                                              } else if (result['role'] ==
                                                  'S') {
                                                Navigator.pushAndRemoveUntil(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (BuildContext
                                                                context) =>
                                                            SellerScreen(
                                                              userId:
                                                                  '${result['userId']}',
                                                            )),
                                                    (route) => false);
                                              }
                                            } else {
                                              Fluttertoast.showToast(
                                                  gravity: ToastGravity.CENTER,
                                                  msg:
                                                      "error 50x contact Adminstator",
                                                  toastLength:
                                                      Toast.LENGTH_SHORT);
                                            }
                                          });
                                          print(credential);
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.sp,
                                    )
                                  ],
                                )
                              : Container(),
                          GestureDetector(
                            onTap: () {
                              print('object');
                            },
                            child: Container(
                              width: double.infinity,
                              height: 35.sp,
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      color: Colors.white),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(Images.login_google),
                                      ),
                                      SizedBox(
                                        width: 4.sp,
                                      ),
                                      Text(
                                        'Sign in with Google',
                                        style: TextStyle(
                                            color: ColorResources.KTextBlack,
                                            fontSize: 15.sp),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                          GestureDetector(
                            onTap: () {
                              print('object');
                            },
                            child: Container(
                              width: double.infinity,
                              height: 35.sp,
                              child: DecoratedBox(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(8)),
                                      color: Colors.blue[900]),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image:
                                            AssetImage(Images.login_facebook),
                                      ),
                                      Text(
                                        'Sign in with Facebook',
                                        style: TextStyle(
                                            color: ColorResources.KTextWhite,
                                            fontSize: 15.sp),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 8.sp,
                          ),
                        ],
                      ),
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
