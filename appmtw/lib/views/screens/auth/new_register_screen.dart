import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mtw_project/utill/dimensions.dart';
import 'package:mtw_project/utill/images.dart';
import 'package:mtw_project/views/screens/auth/new_login_screen.dart';
import 'package:sizer/sizer.dart';

class NewRegisterScreen extends StatefulWidget {
  const NewRegisterScreen({
    Key? key,
  }) : super(key: key);
  @override
  _NewRegisterScreenState createState() => _NewRegisterScreenState();
}

class _NewRegisterScreenState extends State<NewRegisterScreen> {
  final namectrl = TextEditingController();
  final emailctrl = TextEditingController();
  final phonectrl = TextEditingController();
  final passwordctrl = TextEditingController();
  final otpctrl = TextEditingController();
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
                height: 10.sp,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
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
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'ลงทะเบียนสมัครสมาชิก',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Register',
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
                          'อีเมล์ (Email)',
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
                              LengthLimitingTextInputFormatter(100),
                            ],
                            controller: emailctrl,
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
                            keyboardType: TextInputType.emailAddress,
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
                          'ชื่อ - นามสกุล (Full Name)',
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
                              LengthLimitingTextInputFormatter(100),
                            ],
                            controller: namectrl,
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
                      height: 14,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Text(
                        "OTP",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.sp,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(),
                      child: Row(
                        children: [
                          Container(
                            width: 55.w,
                            height: 30.sp,
                            child: TextField(
                              style: TextStyle(
                                fontSize: 13.0,
                                height: 0.9,
                                color: Colors.black,
                              ),
                              controller: otpctrl,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide(
                                    color: Colors.black,
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
                                    color: Colors.black,
                                    width: 1.0,
                                  ),
                                ),
                              ),
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 20.w,
                            height: 4.h,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blue[900],
                              ),
                              onPressed: () async {
                                if (phonectrl.text != '') {
                                  var url =
                                      "https://fti77.sapappwork.xyz/API/otp-mobile-mtwa";
                                  var data = {
                                    'phone': phonectrl.text,
                                  };
                                  // print(data);
                                  await http
                                      .post(Uri.parse(url), body: data)
                                      .then((response) {
                                    var resultotp = jsonDecode(response.body);
                                    print(resultotp);
                                  });
                                } else {
                                  Fluttertoast.showToast(
                                      gravity: ToastGravity.CENTER,
                                      msg: "กรุณากรอกเบอร์โทรศัพท์ของท่านค่ะ",
                                      toastLength: Toast.LENGTH_SHORT);
                                  return;
                                }
                              },
                              child: Text(
                                "ส่ง OTP",
                                style: TextStyle(fontSize: 10.sp),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            if (namectrl.text != '' ||
                                passwordctrl.text != '' ||
                                phonectrl.text != '') {
                              if (otpctrl.text != '') {
                                var url =
                                    "https://fti77.sapappwork.xyz/API/register-mobile-mtwa";
                                var data = {
                                  'name': namectrl.text,
                                  'email': emailctrl.text,
                                  'phone': phonectrl.text,
                                  'password': passwordctrl.text,
                                  'otp_code': otpctrl.text,
                                };
                                // var res =
                                //     await http.post(Uri.parse(url), body: data);
                                // var datajson = json.decode(res.body);
                                // print(datajson);
                                await http
                                    .post(Uri.parse(url), body: data)
                                    .then((response) {
                                  print(phonectrl.text);
                                  // print(response.body);

                                  var result = json.decode(response.body);

                                  if (response.statusCode == 200) {
                                    if (result['statusregister'] == '1') {
                                      Fluttertoast.showToast(
                                          gravity: ToastGravity.CENTER,
                                          msg: "Register Success",
                                          toastLength: Toast.LENGTH_SHORT);
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (ctx) => NewLoginScreen(),
                                        ),
                                      );
                                    } else if (result['statusregister'] ==
                                        '2') {
                                      Fluttertoast.showToast(
                                          gravity: ToastGravity.CENTER,
                                          msg:
                                              "เบอร์โทรศัพท์หรืออีเมล์นี้ได้ถูกใช้งานไปแล้วค่ะ",
                                          toastLength: Toast.LENGTH_SHORT);
                                    } else if (result['statusregister'] ==
                                        '4') {
                                      Fluttertoast.showToast(
                                          gravity: ToastGravity.CENTER,
                                          msg: "รหัส OTP ไม่ถูกต้องค่ะ",
                                          toastLength: Toast.LENGTH_SHORT);
                                    }
                                  }
                                });
                              } else {
                                Fluttertoast.showToast(
                                    gravity: ToastGravity.CENTER,
                                    msg: "กรุณากรอกรหัส OTP ของท่านค่ะ",
                                    toastLength: Toast.LENGTH_SHORT);
                                return;
                              }
                            } else {
                              Fluttertoast.showToast(
                                  gravity: ToastGravity.CENTER,
                                  msg: "กรุณากรอกข้อมูลให้ครบค่ะ",
                                  toastLength: Toast.LENGTH_SHORT);
                              return;
                            }
                          },
                          child: Container(
                            width: 115.sp,
                            height: 50.sp,
                            child: Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  // fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.black,
                                width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                      ],
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
