import 'package:flutter/material.dart';
import 'package:open_sooq/utils/shared_widgets/custom_text.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowUsView extends StatelessWidget {
  const FollowUsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 16),
      child: Container(
        height: 75,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            children: [
              const CustomText(
                title: "Follow us",
                fontSize: 20,
                fontColor: Colors.black,
                fontWeight: FontWeight.bold,
              ),
              Expanded(child: Container()),
              _socialMediaIcon(
                  imageName: "linkedin", url: "https://jo.linkedin.com/"),
              _socialMediaIcon(
                  imageName: "youtube", url: "https://www.youtube.com/?gl=JO"),
              _socialMediaIcon(
                  imageName: "facebook", url: "https://ar-ar.facebook.com/")
            ],
          ),
        ),
      ),
    );
  }

  Widget _socialMediaIcon({required String imageName, required String url}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: InkWell(
        onTap: () async {
          if (!await launchUrl(Uri.parse(url))) throw 'Could not launch $url';
        },
        child: SizedBox(
          width: 40,
          height: 40,
          child: Image.asset("assets/images/$imageName.jpeg"),
        ),
      ),
    );
  }
}
