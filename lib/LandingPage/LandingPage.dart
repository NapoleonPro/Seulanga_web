import 'package:flutter/material.dart';

class LandingPage extends StatelessWidget {
  List<Widget> pageChildren(double width, bool isDesktop) {
    double logoWidth = isDesktop ? width - 100 : width - 50;
    double logoScale = isDesktop ? 0.6 : 0.8;
    double spaceAboveLogo =
        isDesktop ? 0 : 50; // Jarak tambahan di atas logo untuk tampilan mobile
    double spaceBetweenLogoAndText = isDesktop ? 0 : 150;

    return <Widget>[
      SizedBox(
          height:
              spaceAboveLogo), // Menambahkan jarak di atas logo pada tampilan mobile
      Transform.scale(
        scale: logoScale,
        child: Image.asset(
          "assets/images/ini_logo.png",
          width: logoWidth,
        ),
      ),
      SizedBox(height: spaceBetweenLogoAndText),
      Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Seulanga",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: isDesktop ? 40 : 30,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                "Seulanga merupakan Komunitas Teknik Komputer dibawah pengawasan Himpunan Mahasiswa Teknik Komputer (HIMATEKKOM) Universitas Syiah Kuala. Seulanga mewadahi mahasiswa-mahasiswa Teknik Komputer yang ingin berkompetisi dengan membawa nama Universitas Syiah Kuala dan HIMATEKKOM.",
                style: TextStyle(
                  fontSize: isDesktop ? 16 : 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 800;

        if (isDesktop) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: pageChildren(constraints.biggest.width / 2, isDesktop),
          );
        } else {
          return Column(
            children: pageChildren(constraints.biggest.width, isDesktop),
          );
        }
      },
    );
  }
}
