import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_up_login/login_page.dart';
import 'package:sign_up_login/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
  //State<LoginPage> createState() => _LoginPageState();
}

class _SignUpState extends State<SignUp> {
  //const _SignUpState({Key? key}) : super(key: key);
  bool passwordEye = true;
  IconData passwordIcon = Icons.remove_red_eye;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: SvgPicture.asset(
            "assests/img/Signup Page Background.svg",
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.cover,
          ),
        ),
        GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Expanded(
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 35,
                      ),
                      Center(
                        child: Text('SIGN UP',
                            style: GoogleFonts.robotoSlab(
                                fontSize: 40,
                                color: Color.fromARGB(255, 81, 73, 91))),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text('Create an account',
                            style: GoogleFonts.robotoSlab(
                                fontSize: 24, fontWeight: FontWeight.bold)),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      TextField(
                        cursorColor: Color.fromARGB(175, 0, 0, 0),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color.fromARGB(102, 0, 0, 0)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.5,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelText: 'Enter Your Username',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(178, 0, 0, 0),
                              fontSize: 16,
                              fontFamily: GoogleFonts.poppins().fontFamily),
                        ),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      TextField(
                        cursorColor: Color.fromARGB(175, 0, 0, 0),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color.fromARGB(102, 0, 0, 0)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.5,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelText: 'Enter Your Email',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(178, 0, 0, 0),
                              fontSize: 16,
                              fontFamily: GoogleFonts.poppins().fontFamily),
                        ),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: Color.fromARGB(175, 0, 0, 0),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color.fromARGB(102, 0, 0, 0)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.5,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelText: 'Enter Your Phone Number',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(178, 0, 0, 0),
                              fontSize: 16,
                              fontFamily: GoogleFonts.poppins().fontFamily),
                        ),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      TextField(
                        obscureText: passwordEye,
                        cursorColor: Color.fromARGB(175, 0, 0, 0),
                        decoration: InputDecoration(
                          suffixIcon: IconButton(
                            icon: Icon(
                              passwordIcon,
                              color: const Color.fromARGB(147, 0, 0, 0),
                            ),
                            onPressed: () {
                              setState(() {
                                passwordEye = !passwordEye;
                                if (passwordEye == true) {
                                  passwordIcon = Icons.remove_red_eye;
                                } else {
                                  passwordIcon = Icons.visibility_off;
                                }
                              });
                            },
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: const Color.fromARGB(102, 0, 0, 0)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1, color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 1.5,
                                color: Color.fromARGB(255, 0, 0, 0)),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelText: 'Enter Your Password',
                          labelStyle: TextStyle(
                              color: Color.fromARGB(178, 0, 0, 0),
                              fontSize: 16,
                              fontFamily: GoogleFonts.poppins().fontFamily),
                        ),
                      ),
                      const SizedBox(
                        height: 13,
                      ),
                      FilledButton(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: MaterialStateColor.resolveWith(
                                (states) => Color.fromARGB(255, 56, 106, 32)),
                            minimumSize: MaterialStateProperty.resolveWith(
                                (states) => Size(247, 48)),
                            shape: MaterialStateProperty.resolveWith((states) =>
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5))),
                          ),
                          child: Text('Sign Up',
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w500))),
                      const SizedBox(
                        height: 22,
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: Divider(
                            color: const Color.fromARGB(127, 0, 0, 0),
                          )),
                          Container(
                            margin: EdgeInsets.only(left: 13, right: 13),
                            child: Text('Or Sign Up With',
                                style: GoogleFonts.poppins(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                    color: Color.fromARGB(204, 0, 0, 0))),
                          ),
                          Expanded(
                              child: Divider(
                            color: Color.fromARGB(127, 0, 0, 0),
                          )),
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ActionChip(
                            onPressed: () {},
                            avatar: Image.asset('assests/img/google-logo.png'),
                            label: Text(
                              'Google',
                              style: TextStyle(
                                  color: const Color.fromARGB(153, 0, 0, 0)),
                            ),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          ActionChip(
                            onPressed: () {},
                            avatar:
                                Image.asset('assests/img/facebook-logo.png'),
                            label: Text(
                              'Facebook',
                              style: TextStyle(
                                  color: Color.fromARGB(229, 255, 255, 255)),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 24, 119, 242),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          ActionChip(
                            onPressed: () {},
                            avatar: Image.asset(
                                'assests/img/twitter-logo-bg-EAS.png'),
                            label: Text(
                              'Twitter',
                              style: TextStyle(
                                  color: Color.fromARGB(229, 255, 255, 255)),
                            ),
                            backgroundColor:
                                const Color.fromARGB(255, 83, 169, 234),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Already have an account?',
                              style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Color.fromARGB(204, 0, 0, 0))),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: Text('Login',
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color:
                                          Color.fromARGB(255, 47, 137, 252))))
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
