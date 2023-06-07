import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

void main() {
  //var app = ;
  runApp(const HomePage());
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;

    return MaterialApp(
        title: 'Flutter App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.greenAccent,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('Flutter App'),
            backgroundColor: Colors.black,
          ),
          body: Center(
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
            // floatingActionButton: FloatingActionButton(
            //   onPressed: () {},
            //   child: const Icon(
            //     Icons.add_a_photo,
            //     color: Colors.black,
            //   ),
            // ),
          ),
        ));
  }
}
