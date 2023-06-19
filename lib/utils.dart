import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}

TextStyle SafeGoogleFont(
  String fontFamily, {
  TextStyle? textStyle,
  Color? color,
  Color? backgroundColor,
  double? fontSize,
  FontWeight? fontWeight,
  FontStyle? fontStyle,
  double? letterSpacing,
  double? wordSpacing,
  TextBaseline? textBaseline,
  double? height,
  Locale? locale,
  Paint? foreground,
  Paint? background,
  List<Shadow>? shadows,
  List<FontFeature>? fontFeatures,
  TextDecoration? decoration,
  Color? decorationColor,
  TextDecorationStyle? decorationStyle,
  double? decorationThickness,
}) {
  try {
    return GoogleFonts.getFont(
      fontFamily,
      textStyle: textStyle,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  } catch (ex) {
    return GoogleFonts.getFont(
      "Source Sans Pro",
      textStyle: textStyle,
      color: color,
      backgroundColor: backgroundColor,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      letterSpacing: letterSpacing,
      wordSpacing: wordSpacing,
      textBaseline: textBaseline,
      height: height,
      locale: locale,
      foreground: foreground,
      background: background,
      shadows: shadows,
      fontFeatures: fontFeatures,
      decoration: decoration,
      decorationColor: decorationColor,
      decorationStyle: decorationStyle,
      decorationThickness: decorationThickness,
    );
  }
}

class TopBar extends AppBar {
  TopBar({
    super.key,
    required this.heading,
    required this.image,
    required this.callback,
  });

  final String heading;
  final String image;
  final Function(int, String) callback;

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.list),
            onPressed: () {
              widget.callback(5, 'My Activity');
            },
            iconSize: 40,
            color: Colors.black,
          );
        },
      ),
      title: Text(widget.heading,
          style: SafeGoogleFont(
            "Roboto",
            textStyle: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          )),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {
            widget.callback(6, 'My Profile');
          },
          child: Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 71, 224, 215),
                  Color.fromARGB(255, 84, 102, 121)
                ],
              ),
            ),
            margin: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              radius: MediaQuery.of(context).size.height * 0.032,
              backgroundColor: Colors.transparent,
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.height * 0.029,
                backgroundImage: AssetImage(widget.image),
              ),
            ),
          ),
        ),
      ],
      flexibleSpace: Container(
        child: Stack(
          children: <Widget>[
            Image.asset(
              'assests/img/Up image rectangle.png',
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
      ),
    );
  }
}

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
    required this.callback,
    required this.page
  });
  final Function(int, String) callback;
  final int page;
  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  Color homebg = Color.fromARGB(255, 128, 225, 66);
  Color messagebg = Colors.transparent;
  Color createbg = Color.fromARGB(255, 46, 119, 0);
  Color searchbg = Colors.transparent;
  Color notifybg = Colors.transparent;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(
              child: CircleAvatar(
                radius: 28,
                backgroundColor: homebg,
                child: const Icon(Icons.home_filled,
                    color: Colors.black, size: 30),
              ),
              onTap: () {
                setState(() {
                  widget.callback(0, 'Feeds');
                  homebg = Color.fromARGB(255, 128, 225, 66);
                  messagebg = Colors.transparent;
                  createbg = Color.fromARGB(255, 46, 119, 0);
                  searchbg = Colors.transparent;
                  notifybg = Colors.transparent;
                });
              },
            ),
            GestureDetector(
              child: CircleAvatar(
                radius: 28,
                backgroundColor: messagebg,
                child: const Icon(Icons.message, color: Colors.black, size: 30),
              ),
              onTap: () {
                setState(() {
                  widget.callback(1, 'Chat');
                  homebg = Colors.transparent;
                  messagebg = Color.fromARGB(255, 128, 225, 66);
                  createbg = Color.fromARGB(255, 46, 119, 0);
                  searchbg = Colors.transparent;
                  notifybg = Colors.transparent;
                });
              },
            ),
            GestureDetector(
              child: CircleAvatar(
                radius: 28,
                backgroundColor: createbg,
                child: const Icon(Icons.add, size: 30, color: Colors.white),
              ),
              onTap: () {
                setState(() {
                  widget.callback(2, 'Create Event');
                  homebg = Colors.transparent;
                  messagebg = Colors.transparent;
                  createbg = Color.fromARGB(255, 101, 207, 33);
                  searchbg = Colors.transparent;
                  notifybg = Colors.transparent;
                });
              },
            ),
            GestureDetector(
              child: CircleAvatar(
                radius: 28,
                backgroundColor: searchbg,
                child: const Icon(Icons.search, color: Colors.black, size: 30),
              ),
              onTap: () {
                setState(() {
                  widget.callback(3, 'Explore');
                  homebg = Colors.transparent;
                  messagebg = Colors.transparent;
                  createbg = Color.fromARGB(255, 46, 119, 0);
                  searchbg = Color.fromARGB(255, 128, 225, 66);
                  notifybg = Colors.transparent;
                });
              },
            ),
            GestureDetector(
              child: CircleAvatar(
                radius: 28,
                backgroundColor: notifybg,
                child: const Icon(Icons.notifications,
                    color: Colors.black, size: 30),
              ),
              onTap: () {
                setState(() {
                  widget.callback(4, 'Notifications');
                  homebg = Colors.transparent;
                  messagebg = Colors.transparent;
                  createbg = Color.fromARGB(255, 46, 119, 0);
                  searchbg = Colors.transparent;
                  notifybg = Color.fromARGB(255, 128, 225, 66);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
