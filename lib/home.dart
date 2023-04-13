import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'package:http/http.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:sample/details.dart';

import 'package:sample/login.dart';

import 'package:sample/staticclass.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<dynamic> ebook() async {
    print('>>>>>>>>>>>>>>>');
    String Url = "https://www.googleapis.com/books/v1/volumes?q=flutter";
    Response responce = await get(Uri.parse(Url));
    Map data = jsonDecode(responce.body);
    BookDetails.myBookList = data['items'];
    print(data['items'].length);
    return data;
  }

  _signOut() async {
    await GoogleSignIn().signOut();
    await FirebaseAuth.instance.signOut();
    return Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) {
      return logIn();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
          child: SingleChildScrollView(
        child: Container(
            child: Column(
          children: [],
        )),
      )),
      backgroundColor: Color.fromARGB(255, 66, 65, 65),
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: const Text("Book Hub"),
        leading: IconButton(
            onPressed: () {
              print("menu butto tapped");
            },
            icon: Icon(Icons.menu)),
        actions: [
          IconButton(
              onPressed: () {
                print("notification button tapped");
              },
              icon: Icon(
                Icons.notifications_active,
                color: Colors.orange[300],
              )),
          IconButton(
              onPressed: () {
                print("Log out request");

                _signOut();
              },
              icon: Icon(
                Icons.logout,
                color: Colors.orange[300],
              ))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey[300],
                    prefixIcon: const Icon(Icons.search_rounded),
                    contentPadding: const EdgeInsets.all(8),
                    hintText: "Search your favorite books...",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none)),
              ),
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text("My Books",
                style: GoogleFonts.alegreya(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    color: Colors.white,
                    fontSize: 38,fontWeight: FontWeight.bold)
                //  TextStyle(
                //     fontSize: 33,
                //     fontWeight: FontWeight.w600,
                //     color: Colors.black),
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          FutureBuilder(
              future: ebook(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SizedBox(
                      height: 50,
                      child: LoadingIndicator(
                        indicatorType: Indicator.ballClipRotatePulse,
                        strokeWidth: 0.5,
                        colors: [Colors.indigo],
                      ),
                    ),
                  );
                } else if (snapshot.hasData) {
                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data['items'].length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              height: 130,
                              width: MediaQuery.of(context).size.width,
                              child: Padding(
                                padding: const EdgeInsets.all(1.0),
                                child: Card(
                                  elevation: 10,
                                  shadowColor: Colors.blue,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  color: Color.fromARGB(196, 202, 208, 211),
                                  child: Center(
                                    child: ListTile(
                                      onTap: () {
                                        print(index);
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (cnxt) {
                                          return Details(data: index);
                                        }));
                                      },
                                      leading: Padding(
                                        padding: const EdgeInsets.only(
                                            top: 5, left: 5),
                                        child: SizedBox(
                                        
                                          child: Image(   height: 250,
                                              image: NetworkImage(
                                               
                                                snapshot
                                                          .data['items'][index]
                                                      ['volumeInfo']['imageLinks']
                                                  ['smallThumbnail'])),
                                        ),
                                      ),
                                      title: Text(
                                        snapshot.data['items'][index]
                                            ['volumeInfo']['title'],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        snapshot.data['items'][index]
                                                ['volumeInfo']['subtitle'] ??
                                            'Subtitle not found',
                                      ),
                                      trailing: Text(
                                        snapshot.data['items'][index]
                                            ['volumeInfo']['authors'][0],
                                        style: TextStyle(
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.orange[900]),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  );
                } else {
                  return const Center(
                      child: Text("Ooops..Something Went Wrong..!!"));
                }
              })
        ],
      ),
    );
  }
}
