import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_up_login/login_page.dart';
import 'package:sign_up_login/utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sign_up_login/main.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
  //State<LoginPage> createState() => _LoginPageState();
}

//final navigatorKey = GlobalKey<NavigatorState>();

class _SignUpState extends State<SignUp> {
  //const _SignUpState({Key? key}) : super(key: key);
  bool passwordEye = true;
  IconData passwordIcon = Icons.remove_red_eye;

  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future signUpUsingMail() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(child: CircularProgressIndicator()));

    final String email = emailController.text.trim();
    final String password = passwordController.text.trim();
    final String userName = usernameController.text.trim();
    final String phone = phoneNumberController.text.trim();

    if (userName.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Username is empty',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR);
      Navigator.pop(context);
      return;
    }

    if (email.isEmpty || !isValidEmail(email)) {
      Fluttertoast.showToast(
          msg: 'Invalid email address',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR);
      Navigator.pop(context);
      return;
    }

    (currentUserName) async {
      try {
// if the size of value is greater then 0 then that doc exist.
        await FirebaseFirestore.instance
            .collection('Users')
            .where('email', isEqualTo: email)
            .get()
            .then((value) => value.size > 0 ? true : false);
      } catch (e) {
        debugPrint(e.toString());
      }
    };

    if (phone.isEmpty || !isValidPhNum(phone)) {
      Fluttertoast.showToast(
          msg: 'Invalid Phone Number',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR);
      Navigator.pop(context);
      return;
    }

    if (password.isEmpty) {
      Fluttertoast.showToast(
          msg: 'Password cant be Empty',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR);
      Navigator.pop(context);
      return;
    }

    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      print(e);
      Fluttertoast.showToast(
          msg: 'Some error occured, please try again later',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR);
      Navigator.pop(context);
      return;
    }

    try {
      await FirebaseFirestore.instance
          .collection('sign_up')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set({
        'username': userName,
        'email': email,
        'phone': phone,
        'password': password,
      });
    } catch (e) {
      Fluttertoast.showToast(
          msg: 'Some error occured, please try again later',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.SNACKBAR);
      Navigator.pop(context);
      return;
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

  bool isValidPhNum(String phone) {
    final RegExp phoneRegex = RegExp(
      r'^[0-9]{10}$',
      caseSensitive: false,
      multiLine: false,
    );
    return phoneRegex.hasMatch(phone);
  }

  String? _passwordError;

  String? validatePassword(String password) {
    // Check if the password is at least 8 characters long
    if (password.length < 6) {
      return 'Password must be at least 8 characters long';
    }

    // Check if the password contains at least one uppercase letter
    if (!password.contains(RegExp(r'[A-Z]'))) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check if the password contains at least one lowercase letter
    if (!password.contains(RegExp(r'[a-z]'))) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check if the password contains at least one digit
    if (!password.contains(RegExp(r'[0-9]'))) {
      return 'Password must contain at least one digit';
    }

    // Check if the password contains at least one special character
    if (!password.contains(RegExp(r'[!_@#$%^&*(),.?":{}|<>]'))) {
      return 'Password must contain at least one special character';
    }

    return null; // Return null if the password is valid
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Center(
          child: Image.asset('assests/img/Signup Page Background.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover),
        ),
        GestureDetector(
          onTap: () {
            FocusScope.of(context).requestFocus(new FocusNode());
          },
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
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
                        controller: usernameController,
                        cursorColor: Color.fromARGB(175, 0, 0, 0),
                        decoration: decoration('Username')),
                    const SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: emailController,
                      cursorColor: Color.fromARGB(175, 0, 0, 0),
                      decoration: decoration('Email'),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    TextField(
                      controller: phoneNumberController,
                      keyboardType: TextInputType.number,
                      cursorColor: Color.fromARGB(175, 0, 0, 0),
                      decoration: decoration('Phone Number'),
                    ),
                    const SizedBox(
                      height: 11,
                    ),
                    TextField(
                      onChanged: (value) {
                        setState(() {
                          _passwordError = validatePassword(value);
                        });
                      },
                      controller: passwordController,
                      obscureText: passwordEye,
                      cursorColor: Color.fromARGB(175, 0, 0, 0),
                      decoration: InputDecoration(
                        errorText: _passwordError,
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
                              width: 1.5, color: Color.fromARGB(255, 0, 0, 0)),
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
                        onPressed: signUpUsingMail,
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
                          avatar: Image.asset('assests/img/facebook-logo.png'),
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
                                    color: Color.fromARGB(255, 47, 137, 252))))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  InputDecoration decoration(String label) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderSide: BorderSide(color: const Color.fromARGB(102, 0, 0, 0)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1, color: Color.fromARGB(255, 0, 0, 0)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(width: 1.5, color: Color.fromARGB(255, 0, 0, 0)),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      labelText: 'Enter You ${label}',
      labelStyle: TextStyle(
          color: Color.fromARGB(178, 0, 0, 0),
          fontSize: 16,
          fontFamily: GoogleFonts.poppins().fontFamily),
    );
  }
}
