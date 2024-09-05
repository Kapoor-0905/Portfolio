import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kapoor_0905/extensions/widgetExtensions.dart';
import 'package:kapoor_0905/utils/assets.dart';
import 'package:kapoor_0905/utils/functions.dart';
import 'package:kapoor_0905/utils/styles.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({super.key});

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  final Styles nunito = Styles.nunito();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 245, 245, 245), // Status bar color
    ));
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Future.delayed(const Duration(milliseconds: 200), () {
                      SystemChrome.setSystemUIOverlayStyle(
                          const SystemUiOverlayStyle(
                              statusBarColor: Colors.black));
                    });

                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    CupertinoIcons.back,
                    size: 25,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
            const CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage(Assets.ashutosh),
            ),
            const SizedBox(height: 10),
            Text(
              'Ashutosh Kapoor',
              style: nunito.semiBoldText(fontSize: 18, color: Colors.black),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        CupertinoIcons.phone_fill,
                        size: 25,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'call',
                        style: nunito.regularText(
                            fontSize: 16, color: Colors.blue),
                      ),
                    ],
                  ),
                ).onTap(onTap: () {
                  copyToClipboard("+917088206475");
                  makingPhoneCall();
                }),
                const SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      const Icon(
                        CupertinoIcons.mail_solid,
                        size: 25,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        'mail',
                        style: nunito.regularText(
                            fontSize: 16, color: Colors.blue),
                      ),
                    ],
                  ),
                ).onTap(onTap: () {
                  copyToClipboard("ashutoshkapoor8965@gmail.com");
                }),
                const SizedBox(width: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 1,
                        blurRadius: 10,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      SvgPicture.asset(Assets.whatsapp, width: 26),
                      const SizedBox(width: 10),
                      Text(
                        'message',
                        style: nunito.regularText(
                            fontSize: 16, color: Colors.blue),
                      ),
                    ],
                  ),
                ).onTap(onTap: () {
                  openLink(
                      "https://wa.me/+917088206475?text=Hello, Happy to connect with you!!");
                }),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "email",
                    style: nunito.semiBoldText(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "ashutoshkapoor8965@gmail.com",
                    style: nunito.regularText(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                  const Divider(
                    indent: 5,
                    endIndent: 5,
                    thickness: 0.5,
                  ).verticalMargin(7),
                  Text(
                    "home",
                    style: nunito.semiBoldText(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "Dehradun, Uttarakhand, India",
                    style: nunito.regularText(
                      fontSize: 14,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 10),
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "birthday",
                    style: nunito.semiBoldText(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "May 9",
                    style: nunito.regularText(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
