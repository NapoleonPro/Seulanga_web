import 'package:flutter/material.dart';

class LandingPage2 extends StatelessWidget {
  const LandingPage2({super.key});

  List<Widget> achievementChildren(double width, bool isDesktop) {
    double imageWidth = isDesktop ? (width / 2) - 40 : width - 40;

    Widget achievementContainer(String imagePath, String description,
        {bool isGreenBackground = false}) {
      return Container(
        width: isDesktop ? 400 : imageWidth,
        padding: isDesktop ? const EdgeInsets.all(10) : const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color:
              isGreenBackground ? const Color.fromARGB(255, 4, 101, 7) : null,
          border: Border.all(
            color: isDesktop ? Colors.black : Colors.black.withOpacity(0.5),
            width: isDesktop ? 1.5 : 1,
          ),
          borderRadius: BorderRadius.circular(8),
          gradient: isGreenBackground
              ? null
              : LinearGradient(
                  colors: [Colors.white, Colors.green.shade100],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
        ),
        child: Column(
          children: [
            Image.asset(
              imagePath,
              width: isDesktop ? 400 : imageWidth,
              height: isDesktop ? 380 : null,
              fit: BoxFit.contain,
            ),
            const SizedBox(height: 10),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: isGreenBackground ? Colors.white : Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    if (isDesktop) {
      return <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            achievementContainer(
              "assets/images/prestasi1.png",
              "Juara 1 pada Lomba Inovasi Mahasiswa Tingkat Nasional dalam Kategori Energi dan Rekayasa Keteknikan yang diselenggarakan oleh Universitas Tidar.\n",
              isGreenBackground: true,
            ),
            achievementContainer(
              "assets/images/prestasi2.png",
              "\nGold Medalist pada ajang 2nd Indonesia Internasional IOT Olympiad (I30) 2023.\n\n",
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            achievementContainer(
              "assets/images/prestasi3.png",
              "\nJuara pada ajang 2nd Indonesia Internasional IOT Olympiad (I30) 2023.\n\n",
            ),
            achievementContainer(
              "assets/images/prestasi4.png",
              "\nGold Medalist pada ajang 2nd Indonesia Internasional IOT Olympiad (I30) 2023.\n\n",
              isGreenBackground: true,
            ),
          ],
        ),
      ];
    } else {
      return <Widget>[
        achievementContainer(
          "assets/images/prestasi1.png",
          "Juara 1 pada Lomba Inovasi Mahasiswa Tingkat Nasional dalam Kategori Energi dan Rekayasa Keteknikan yang diselenggarakan oleh Universitas Tidar.\n",
          isGreenBackground: true,
        ),
        const SizedBox(height: 20),
        achievementContainer(
          "assets/images/prestasi2.png",
          "\nGold Medalist pada ajang 2nd Indonesia Internasional IOT Olympiad (I30) 2023.\n\n",
        ),
        const SizedBox(height: 20),
        achievementContainer(
          "assets/images/prestasi3.png",
          "\nJuara pada ajang 2nd Indonesia Internasional IOT Olympiad (I30) 2023.\n\n",
          isGreenBackground: true,
        ),
        const SizedBox(height: 20),
        achievementContainer(
          "assets/images/prestasi4.png",
          "\nGold Medalist pada ajang 2nd Indonesia Internasional IOT Olympiad (I30) 2023.\n\n",
        ),
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    // Mendapatkan lebar layar
    double screenWidth = MediaQuery.of(context).size.width;
    // Menyesuaikan ukuran teks berdasarkan lebar layar
    double titleFontSize = screenWidth > 800 ? 40 : 30;
    double subtitleFontSize = screenWidth > 800 ? 16 : 14;

    return LayoutBuilder(
      builder: (context, constraints) {
        bool isDesktop = constraints.maxWidth > 800;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 100), // Jarak di atas judul
              Text(
                "Achievements",
                style: TextStyle(
                  fontSize: titleFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 130), // Jarak antara judul dan konten
              Column(
                mainAxisAlignment:
                    MainAxisAlignment.center, // Menengahkan konten vertikalnya
                children:
                    achievementChildren(constraints.biggest.width, isDesktop),
              ),
            ],
          ),
        );
      },
    );
  }
}
