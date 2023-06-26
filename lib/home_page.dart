import 'package:flutter/material.dart';
import 'package:sign_up_login/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sign_up_login/Chat_Components/Screens/HomeScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int page = 0;
  String title = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(
        heading: title,
        image: 'assests/img/google-logo.png',
        callback: (p, t) {
          setState(() {
            page = p;
            title = t;
          });
        },
      ),
      // change the body to the current page as selected by navbar
      body: Center(
        child: page == 0
            ? const Home()
            : page == 1
                ? const Chat()
                : page == 2
                    ? const Create()
                    : page == 3
                        ? HomeScreen()
                        : page == 4
                            ? const Notifications()
                            : page == 5
                                ? const Activity()
                                : const Profile(),
      ),
      bottomNavigationBar: NavBar(
        page: page,
        callback: (p, t) {
          setState(() {
            page = p;
            title = t;
          });
        },
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Home');
  }
}

class Chat extends StatelessWidget {
  const Chat({super.key});

// HERE!!!HERE!!!HERE!!!HERE!!!HERE!!!HERE!!!HERE!!!HERE!!!

  @override
  Widget build(BuildContext context) {
    return Text('Chakldaslkdjt');
  }
}

class Create extends StatelessWidget {
  const Create({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Create');
  }
}

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Notifications');
  }
}

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Search');
  }
}

class Activity extends StatelessWidget {
  const Activity({super.key});

  @override
  Widget build(BuildContext context) {
    return Text('Activity');
  }
}

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Signed in as'),
          SizedBox(height: 10),
          Text(
            user.email!,
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 40),
          ElevatedButton.icon(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: Icon(
                Icons.arrow_back,
                size: 32,
              ),
              label: Text(
                'Sign Out',
                style: TextStyle(fontSize: 22),
              ))
        ],
      ),
    );
  }
}
