import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sample/home.dart';
import 'package:sample/staticclass.dart';


class logIn extends StatefulWidget {
  const logIn({super.key});

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {
  signInWithGoogle() async {
    print('Function strts');
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    print(googleUser.toString() + "user>>>>>");
    // googleUser?.clearAuthCache();
    // Obtain the auth details from the request
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
    print(googleAuth?.accessToken);
    // Create a new credential
    final credential = await GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );
    print({credential, ",,,,,,,,,,,,"});
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    bool a = await GoogleSignIn().isSignedIn();
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Home(),
        ));
    // if(BookDetails.myBookList==ConnectionState.waiting){
    //   return Center(child: CircularProgressIndicator(strokeWidth: 2,));
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
           Text(
            "BOOK HUB",
           
             style: GoogleFonts.quantico(
                textStyle: Theme.of(context).textTheme.displayMedium,color:Colors.blue,fontSize: 48,fontWeight: FontWeight.bold
             ),
            // TextStyle(
            //     color: Colors.blue,
            //     fontSize: 30,
            //     fontWeight: FontWeight.bold,
            //     fontStyle: FontStyle.normal),
          ),
          const SizedBox(height: 100,),
          Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  decoration:  const BoxDecoration(
                    // boxShadow: [ BoxShadow(blurRadius: 30,color:Colors.blue)
                    // ],
                    image: DecorationImage(
                        image: AssetImage("asset/images/ebook.png",)),
                  
                  ),
                  height: 270,
                  width: 170,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Container(height: 40,width: 35,
              decoration:const BoxDecoration(
                boxShadow:  [BoxShadow(blurRadius: 30,color: Colors.blue)]
                  ),
              child:
                  Image(image: AssetImage("asset/images/Google_Icons.webp"),width: 2,)),
          TextButton(
              onPressed: () {
                signInWithGoogle();
              },
              child:const Text("Sign in with Google  ",
              
                // style: GoogleFonts.aBeeZee(
                //   textStyle: Theme.of(context).textTheme.displayMedium,color: Colors.blue,
                //   fontSize: 12

                // ),
              )),
          // InkWell(
          //   onTap: () => signInWithGoogle(),

          //   child: const Image(
          //     image:  AssetImage("asset/images/Google_Icons.webp"),
          //     height: 40,
          //     width: 40,
          //   ),
          // )
        ],
      )),
    );
  }
}
