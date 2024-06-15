import 'package:flutter/material.dart';
import 'package:web_seulanga/LandingPage/LandingPage.dart';
import 'package:web_seulanga/LandingPage/LandingPage2.dart'; // Import file landing_page_2.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Seulanga',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: "Poppins"),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              Color.fromRGBO(0, 100, 0, 1),
              Color.fromRGBO(130, 128, 128, 1),
            ],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LandingPage(), // Konten utama dari LandingPage
                      SizedBox(
                          height:
                              500), // Jarak antara konten utama dan konten tambahan
                      Center(
                        child: Container(
                          width: constraints
                              .maxWidth, // Menggunakan lebar maksimum dari LayoutBuilder
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment
                                .center, // Menengahkan konten secara horizontal
                            children: [
                              LandingPage2(), // Konten tambahan dari LandingPage2
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
