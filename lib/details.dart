import 'package:assistive_touch/assistive_touch.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sample/home.dart';
import 'package:sample/provider.dart';
import 'package:sample/staticclass.dart';

class Details extends StatefulWidget {
  Details({
    super.key,
    required this.data,
  });
  int data;
  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
      
      backgroundColor: ColorSelection.Bgcolor(context),
        // backgroundColor: Color.fromARGB(231, 221, 221, 195),
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text(
            BookDetails.myBookList[widget.data]['volumeInfo']['title'],
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          actions: [
          // IconButton(
          //     onPressed: () {
          //       print("Home button tapped");
          //       Navigator.pushReplacement(context,
          //           MaterialPageRoute(builder: (context) {
          //         return const Home();
          //       }));
          //     },
          // icon: const Icon(
          //   Icons.home,
          //   color: Colors.black,
          // )),
          IconButton(
            onPressed: () {
              setState(() {
                Provider.of<Darkmode>(context, listen: false)
                    .brightnessmode();
                Provider.of<Darkmode>(context, listen: false)
                    .brightnessicon();
              });
            },
            icon: Icon(Provider.of<Darkmode>(context).Bmode == Brightness.dark
                ? Icons.dark_mode_outlined
                : Icons.wb_sunny_sharp),
            color: Colors.orange,
          )
          ],
        ),
        body: GestureDetector(
          onPanUpdate: (details) {
            if (details.delta.dx < 0) {
              print('right');
              print(BookDetails.myBookList.length);
              print(widget.data);
              if ((BookDetails.myBookList.length - 1) == widget.data) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Details(data: 0);
                }));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(data: widget.data + 1),
                    ));
              }
            }

            if (details.delta.dx > 0) {
              print('left');
              print(BookDetails.myBookList.length);
              print(widget.data);
              if (widget.data == 0) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) {
                  return Details(
                      data: BookDetails.myBookList[widget.data].length);
                }));
              } else {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(data: widget.data - 1),
                    ));
              }
            }
          },
          child: SingleChildScrollView(
            child: Column(children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Container(
                    decoration: BoxDecoration(boxShadow: const [
                      BoxShadow(
                          color: Color.fromARGB(234, 4, 19, 55),
                          blurRadius: 50)
                    ], border: Border.all(style: BorderStyle.solid)),
                    child: Image(
                        fit: BoxFit.fitHeight,
                        image: NetworkImage(BookDetails.myBookList[widget.data]
                            ['volumeInfo']['imageLinks']['thumbnail'])),
                  ),
                ),
              ),
              Container(
                child: Column(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                          BookDetails.myBookList[widget.data]['volumeInfo']
                              ['title'],
                          style: GoogleFonts.yatraOne(
                              textStyle:
                                  Theme.of(context).textTheme.displayMedium,
                              // color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)
                          //
                          //
                          // TextStyle(
                          //     color: Colors.black,
                          //     fontWeight: FontWeight.bold,
                          //     fontSize: 20),
                          ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      // decoration: BoxDecoration(boxShadow: [BoxShadow(blurRadius: 10,color: Colors.blue)]),
                      child: Text(
                          BookDetails.myBookList[widget.data]['volumeInfo']
                              ['authors'][0],
                          style: GoogleFonts.poiretOne(
                              textStyle:
                                  Theme.of(context).textTheme.displayMedium,
                              color: Color.fromARGB(227, 199, 127, 10),
                              fontSize: 38,
                              fontWeight: FontWeight.bold)
                          //const TextStyle(
                          //     fontSize: 23,
                          //     fontWeight: FontWeight.bold,
                          //     color: Color.fromARGB(255, 0, 0, 0)),
                          ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10),
                  //   child: Row(children: [
                  //     Text(
                  //       BookDetails.myBookList[widget.data]['saleInfo']
                  //           ['saleability'],
                  //       style: TextStyle(
                  //           fontSize: 17,
                  //           fontWeight: FontWeight.bold,
                  //           color: Colors.black),
                  //     ),
                  //   ]),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10),
                  //   child: Row(
                  //     children: [
                  //       Text(
                  //         BookDetails.myBookList[widget.data]['volumeInfo']
                  //             ['maturityRating'],
                  //         style: TextStyle(fontSize: 13, color: Colors.black),
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  Container(
                      decoration: BoxDecoration(

                           border: Border.all(width: 2, color: Colors.black38)
                          ),
                      child: Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: Text(
                          BookDetails.myBookList[widget.data]['volumeInfo']
                              ['description'],
                          style: const TextStyle(
                              wordSpacing: 3,
                              fontSize: 17,
                              fontStyle: FontStyle.normal,
                            
                              ),
                        ),
                      )),
                 const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "PUBLISHED",
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),

                  
                  Text(
                    BookDetails.myBookList[widget.data]['volumeInfo']
                            ['publisher'] ??
                        'publisher not found  ',
                    style:const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 184, 131, 58),
                        fontSize: 20),
                  ),

                  Text(
                    BookDetails.myBookList[widget.data]['volumeInfo']
                            ['publishedDate'] ??
                        'published date not found',
                    style:const  TextStyle(color: Color.fromARGB(255, 132, 119, 61)),
                  ),
                ]),
              ),
              
              Text(
                BookDetails.myBookList[widget.data]['volumeInfo']
                    ['maturityRating'],
                style: TextStyle(fontSize: 13, color: Color.fromARGB(255, 143, 114, 34)),
              ),
              Text(
                BookDetails.myBookList[widget.data]['saleInfo']['saleability'],
                style:const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 255, 0, 0)),
              ),
             const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration:const BoxDecoration(),
                        child: const Text(
                          "Download",
                          style: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
                        )),
                  ),
                  InkWell(
                    onTap: () {
                      print("Download request from user");
                    },
                    child: Icon(BookDetails.myBookList[widget.data]
                                ['accessInfo']['pdf']['isAvailable'] ==
                            true
                        ? Icons.download
                        : Icons.file_download_off_sharp),
                  ),
                ],
              ),
            ]),
          ),
        ),
     )] );
    
      // AssistiveTouch(
        
      //   child: FloatingActionButton(
      //     backgroundColor: Colors.white,
      //     onPressed: () {
      //      setState(() {
      //           Provider.of<Darkmode>(context, listen: false)
      //               .brightnessmode();
      //           Provider.of<Darkmode>(context,listen: false)
      //               .brightnessicon();
      //         });
             
     

      //     },
      //     child:  Icon(Provider.of<Darkmode>(context,listen: false).Bmode == Brightness.dark
      //           ? Icons.dark_mode_outlined
      //           : Icons.wb_sunny_sharp),
                

    //   )),
    // ]);
    
  }
}
