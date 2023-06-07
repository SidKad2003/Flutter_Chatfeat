// import 'dart:ffi';
// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sign_up_login/main.dart';
import 'package:sign_up_login/utils.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
  //State<LoginPage> createState() => _LoginPageState();
}

//final navigatorKey = GlobalKey<NavigatorState>();

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  Future signIn() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    final String email = _usernameController.text.trim();
    final String password = _passwordController.text.trim();

    if (email.isEmpty || !isValidEmail(email)) {
      Fluttertoast.showToast(
          msg: 'Invalid email address',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
      Navigator.pop(context);
      return;
    }

    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          // email: _usernameController.text.trim(),
          // password: _passwordController.text.trim()
          email: email,
          password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
    }

    navigatorKey.currentState!.popUntil((route) => route.isFirst);
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
      caseSensitive: false,
      multiLine: false,
    );
    return emailRegex.hasMatch(email);
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    double fem = MediaQuery.of(context).size.width / w;
    double ffem = fem * 0.97;
    return Scaffold(
        backgroundColor: Colors.greenAccent,
        body: Stack(fit: StackFit.expand, children: [
          Image.asset(
            'assests/img/Signup-Page-Background.png',
            fit: BoxFit.cover,
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 30),
                  // width: w,
                  // height: h * 0.3,
                  width: 300,
                  height: 235,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image:
                              AssetImage("assests/img/login-illustration.png"),
                          fit: BoxFit.fitHeight)),
                ),
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("LOGIN",
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 50,
                      ),
                      Container(
                          // width: 407,
                          // height: 73,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 7,
                                    offset: Offset(1, 1),
                                    color: Colors.green.withOpacity(0.2))
                              ]),
                          child: TextField(
                            controller: _usernameController,
                            decoration: InputDecoration(
                                hintText: ('Enter your email address'),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                      color: Colors.black,
                                      width: 1.0,
                                    )),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide(
                                        color: Colors.white, width: 1)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 10,
                                    spreadRadius: 7,
                                    offset: Offset(1, 1),
                                    color: Colors.green.withOpacity(0.2))
                              ]),
                          child: TextField(
                            controller: _passwordController,
                            obscureText: true,
                            decoration: InputDecoration(
                                hintText: ('Enter your password'),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                  color: Colors.black,
                                  width: 1.0,
                                )),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30))),
                          )),

                      SizedBox(
                        height: 30,
                      ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Container(),
//                         ),
//                         SizedBox(
//                           height: 24,
//                           width: 24,
//                           child: Theme(

//                         )
// //                         SizedBox(
// //       height: 24.0,
// // width: 24.0,
// // child: Theme(
// // data: ThemeData(
// // unselectedWidgetColor: Color(0xff00C8E8) // Your color
// // ),
//                         Text("Remember Me",
//                             style: TextStyle(
//                                 color: Colors.green,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Rubic')),
//                         SizedBox(width: 50.0),
//                         Text("Forgot Password ?",
//                             style: TextStyle(
//                                 color: Colors.green,
//                                 fontSize: 20,
//                                 fontWeight: FontWeight.bold,
//                                 fontFamily: 'Rubic')),
//                         //Text("LOGIN",
//                         //style: TextStyle(
//                         //    fontSize: 50, fontWeight: FontWeight.bold)),
//                       ],
//                     )
                    ],
                  ),
                ),
                Container(
                  width: 300,
                  height: 48,
                  child: Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: double.infinity,
                      child: ElevatedButton(
                          //style: TextButton.styleFrom(foregroundColor: Colors.white),
                          //style: ButtonStyle.styleFrom(primary: Color(#386A20)
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xFF386A20)),
                          ),
                          onPressed: signIn,
                          // onPressed: () {
                          //   Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //           builder: ((context) => SignUp())));
                          // },
                          child: Text('Login')),
                    ),
                  ),
                ),
                // SizedBox(
                //   height: w * 0.45,
                // ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    // frame1kjp (17:258)
                    //width: double.infinity,
                    //height: 27 * fem,
                    child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // linefield6Ht (17:229)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 19 * fem, 0 * fem),
                      //height: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            // line12hL (17:230)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 14 * fem, 0 * fem),
                            width: 120 * fem,
                            height: 1 * fem,
                            decoration: BoxDecoration(
                              color: Color(0x7f000000),
                            ),
                          ),
                          Text(
                            // ortextMDp (17:232)
                            'Or Login With',
                            style: SafeGoogleFont(
                              'Poppins',
                              fontSize: 18 * ffem,
                              fontWeight: FontWeight.w400,
                              height: 1.5 * ffem / fem,
                              color: Color(0xcc000000),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      // line1Gra (17:257)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 1 * fem, 0 * fem, 0 * fem),
                      width: 120 * fem,
                      height: 1 * fem,
                      decoration: BoxDecoration(
                        color: Color(0x7f000000),
                      ),
                    ),
                    // SizedBox(height: 20),
                    // RichText(
                    //   text: TextSpan(
                    //       text: "Don’t have an account ?  ",
                    //       style:
                    //           TextStyle(color: Color(0xFF0D0E0E), fontSize: 10),
                    //       children: [
                    //         TextSpan(
                    //           text: " Sign Up",
                    //           style: TextStyle(
                    //               color: Color(0xFF160062),
                    //               fontSize: 15,
                    //               fontWeight: FontWeight.bold),
                    //         )
                    //       ]),
                    // )
                  ],
                )),
              ],
            ),
          )

          // Container(
          //     // autogroupyasjobc (U2vQurrSdNk91XTAyzyASJ)
          //     padding:
          //         EdgeInsets.fromLTRB(26 * fem, 21 * fem, 26 * fem, 0 * fem),
          //     //width: double.infinity,
          //     height: double.infinity,
          //     child:
          //         Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          //       Container(
          //         // loginwithgoogle886 (19:68)
          //         margin:
          //             EdgeInsets.fromLTRB(8 * fem, 0 * fem, 8 * fem, 21 * fem),
          //         padding: EdgeInsets.fromLTRB(
          //             6.64 * fem, 9.13 * fem, 59.1 * fem, 9.13 * fem),
          //         //width: double.infinity,
          //         //height: double.infinity,
          //         decoration: BoxDecoration(
          //           border: Border.all(color: Color(0x66000000)),
          //           color: Color(0xffffffff),
          //           borderRadius: BorderRadius.circular(8.301281929 * fem),
          //         ),
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.end,
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Container(
          //               // googlelogoP42 (17:228)
          //               margin: EdgeInsets.fromLTRB(
          //                   0 * fem, 0 * fem, 40.68 * fem, 0 * fem),
          //               // width: 21.58 * fem,
          //               width: 20,
          //               height: 21.58 * fem,
          //               //height: 100,
          //               child: Image.asset(
          //                 //'assets/page-1/images/google-logo.png',
          //                 'assests/img/google-logo.png',
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //             // Container(
          //             //   // loginwithgoogletexttWa (17:227)
          //             //   margin: EdgeInsets.fromLTRB(
          //             //       0 * fem, 0 * fem, 0 * fem, 1.58 * fem),
          //             //   child: Text(
          //             //     'Signup with Google',
          //             //     style: SafeGoogleFont(
          //             //       'Poppins',
          //             //       fontSize: 13.2820510864 * ffem,
          //             //       fontWeight: FontWeight.w600,
          //             //       height: 1.5 * ffem / fem,
          //             //       color: Color(0x99000000),
          //             //     ),
          //             //   ),
          //             // ),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         // loginwithfacebookZsc (19:69)
          //         margin:
          //             EdgeInsets.fromLTRB(8 * fem, 0 * fem, 8 * fem, 21 * fem),
          //         padding: EdgeInsets.fromLTRB(
          //             7.47 * fem, 5.81 * fem, 48.57 * fem, 10.71 * fem),
          //         //width: double.infinity,
          //         decoration: BoxDecoration(
          //           color: Color(0xff1877f2),
          //           borderRadius: BorderRadius.circular(8.301281929 * fem),
          //         ),
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.center,
          //           children: [
          //             Container(
          //               // facebooklogoqKL (17:224)
          //               margin: EdgeInsets.fromLTRB(
          //                   0 * fem, 0 * fem, 32.37 * fem, 1.74 * fem),
          //               width: 21.58 * fem,
          //               height: 21.58 * fem,
          //               child: Image.asset(
          //                 //'assets/page-1/images/facebook-logo.png',
          //                 'assests/img/facebook-logo.png',
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //             // Container(
          //             //   // loginwithfacebooktextkSJ (17:223)
          //             //   margin: EdgeInsets.fromLTRB(
          //             //       0 * fem, 3.32 * fem, 0 * fem, 0 * fem),
          //             //   child: Text(
          //             //     'Signup with Facebook',
          //             //     style: SafeGoogleFont(
          //             //       'Poppins',
          //             //       fontSize: 13.2820510864 * ffem,
          //             //       fontWeight: FontWeight.w600,
          //             //       height: 1.5 * ffem / fem,
          //             //       color: Color(0xe5ffffff),
          //             //     ),
          //             //   ),
          //             // ),
          //           ],
          //         ),
          //       ),
          //       Container(
          //         // signupwithtwitterrkE (19:76)
          //         margin:
          //             EdgeInsets.fromLTRB(8 * fem, 0 * fem, 8 * fem, 21 * fem),
          //         //width: double.infinity,
          //         height: 39.85 * fem,
          //         child: Container(
          //           // loginwithfacebookbC2 (19:70)
          //           padding: EdgeInsets.fromLTRB(
          //               7.47 * fem, 5.81 * fem, 68.57 * fem, 6.85 * fem),
          //           // width: double.infinity,
          //           height: double.infinity,
          //           decoration: BoxDecoration(
          //             color: Color(0xff53a9ea),
          //             borderRadius: BorderRadius.circular(8.301281929 * fem),
          //           ),
          //           child: Row(
          //             crossAxisAlignment: CrossAxisAlignment.center,
          //             children: [
          //               Container(
          //                 // autogroupj1svVoC (U2vRASGVHgQbqmsmYDj1Sv)
          //                 margin: EdgeInsets.fromLTRB(
          //                     0 * fem, 0 * fem, 24.43 * fem, 0 * fem),
          //                 padding: EdgeInsets.fromLTRB(
          //                     3.53 * fem, 1.19 * fem, 0 * fem, 0 * fem),
          //                 width: 29.53 * fem,
          //                 height: double.infinity,
          //                 child: Align(
          //                   // twitterlogoo3C (19:75)
          //                   alignment: Alignment.bottomRight,
          //                   child: SizedBox(
          //                     // width: double.infinity,
          //                     // height: 26 * fem,
          //                     child: Container(
          //                       decoration: BoxDecoration(
          //                         borderRadius: BorderRadius.circular(90 * fem),
          //                         image: DecorationImage(
          //                           fit: BoxFit.cover,
          //                           image: AssetImage(
          //                             // 'assets/page-1/images/twitter-logo-bg-7MG.png',
          //                             'assests/img/twitter-logo-bg.png',
          //                           ),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ),
          //               // Container(
          //               //   // loginwithfacebooktext6nz (I19:70;17:223)
          //               //   margin: EdgeInsets.fromLTRB(
          //               //       0 * fem, 0 * fem, 0 * fem, 0.55 * fem),
          //               //   child: Text(
          //               //     'Signup with Twitter',
          //               //     style: SafeGoogleFont(
          //               //       'Poppins',
          //               //       fontSize: 13.2820510864 * ffem,
          //               //       fontWeight: FontWeight.w600,
          //               //       height: 1.5 * ffem / fem,
          //               //       color: Color(0xe5ffffff),
          //               //     ),
          //               //   ),
          //               // ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ]))
        ]));
  }
}
