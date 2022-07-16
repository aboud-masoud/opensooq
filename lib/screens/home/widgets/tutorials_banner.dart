import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';

class TutorialsBannerHomePage extends StatelessWidget {
  const TutorialsBannerHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BannerCarousel(
      customizedBanners: [
        bannerBox(
            "https://wise.com/imaginary/renting-process-in-brazil-guide.jpg"),
        bannerBox(
            "https://www.expats.cz/images/publishing/articles/2004/05/1280_650/renting-czech-property-gif-uxrvr.gif"),
        bannerBox(
            "https://www.incimages.com/uploaded_files/image/1920x1080/getty_649362670_395940.jpg")
      ],
      activeColor: const Color(0xff034061),
    );
  }

  Widget bannerBox(String url) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.25),
            spreadRadius: 0,
            blurRadius: 4,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Image.network(
        url,
        fit: BoxFit.fill,
      ),
    );
  }
}
