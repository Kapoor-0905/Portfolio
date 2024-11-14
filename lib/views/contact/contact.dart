import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kapoor_0905/extensions/widgetExtensions.dart';
import 'package:kapoor_0905/utils/assets.dart';
import 'package:kapoor_0905/utils/functions.dart';
import 'package:kapoor_0905/utils/styles.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> with TickerProviderStateMixin {
  late AnimationController closeController;
  late Animation<double> closeAnimation;
  final Styles nunito = Styles.nunito();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    closeController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    closeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: closeController,
        curve: Curves.easeInOut,
      ),
    );
  }

  void onHover(bool isHovered) {
    if (isHovered) {
      closeController.forward();
    } else {
      closeController.reverse();
    }
  }

  @override
  void dispose() {
    closeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;
    return Material(
      color: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: width * 0.33, vertical: height * 0.25),
        decoration: BoxDecoration(
          color: const Color(0xFF282828),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: height * 0.005),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      MouseRegion(
                          cursor: SystemMouseCursors.click,
                          onEnter: (_) => onHover(true),
                          onExit: (_) => onHover(false),
                          child: AnimatedBuilder(
                            animation: closeAnimation,
                            builder: (context, child) {
                              return Container(
                                margin:
                                    const EdgeInsets.only(right: 5, left: 10),
                                width: 12,
                                height: 12,
                                decoration: const BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.red,
                                ),
                                child: AnimatedOpacity(
                                  duration: const Duration(milliseconds: 300),
                                  opacity: closeAnimation.value,
                                  child: const Icon(
                                    Icons.close,
                                    size: 10,
                                  ),
                                ),
                              ).onTap(onTap: () {
                                Navigator.pop(context);
                              });
                            },
                          )),
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[400]!,
                        ),
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.grey[400],
                        ),
                      ),
                    ],
                  ),
                  Text(
                    "Contact",
                    style: nunito.mediumText(fontSize: 13),
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 5, left: 10),
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                        ),
                      ),
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Column(
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      Assets.me,
                      width: width * 0.1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Ashutosh Kapoor",
                          style: nunito.boldText(fontSize: 22),
                        ),
                        Text(
                          "Flutter Developer",
                          style: nunito.regularText(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: const Icon(
                            CupertinoIcons.phone_fill,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          "Call",
                          style: nunito.mediumText(fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(width: width * 0.024),
                    Tooltip(
                      message: "Copy mail",
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(7),
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue,
                            ),
                            child: const Column(
                              children: [
                                Icon(
                                  CupertinoIcons.mail_solid,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: height * 0.01),
                          Text(
                            "Mail",
                            style: nunito.mediumText(fontSize: 14),
                          )
                        ],
                      ).onTap(onTap: () {
                        copyToClipboard("ashutoshkapoor.official@outlook.com");
                        Fluttertoast.showToast(
                          msg: "Mail copied to clipboard",
                          webPosition: "center",
                          webBgColor: "grey",
                        );
                      }),
                    ),
                    SizedBox(width: width * 0.02),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(7),
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.blue,
                          ),
                          child: SvgPicture.asset(
                            Assets.gitHub,
                            color: Colors.white,
                            width: 25,
                          ),
                        ),
                        SizedBox(height: height * 0.01),
                        Text(
                          "GitHub",
                          style: nunito.mediumText(fontSize: 14),
                        )
                      ],
                    ).onTap(onTap: () {
                      openLink("https://www.github.com/Kapoor-0905");
                    }),
                  ],
                ),
                SizedBox(height: height * 0.04),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Phone:\t\t",
                        style: nunito.mediumText(fontSize: 14),
                        children: [
                          TextSpan(
                            text: "+91 7088206475",
                            style: nunito.regularText(fontSize: 12),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                  child: Divider(indent: width * 0.05, endIndent: width * 0.05),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Mail:\t\t",
                        style: nunito.mediumText(fontSize: 14),
                        children: [
                          TextSpan(
                            text: "ashutoshkapoor.official@outlook.com",
                            style: nunito.mediumText(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.03,
                  child: Divider(indent: width * 0.05, endIndent: width * 0.05),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "GitHub:\t\t",
                        style: nunito.mediumText(fontSize: 14),
                        children: [
                          TextSpan(
                            text: "Kapoor-0905",
                            style: nunito.mediumText(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ).horizontalPadding(padding: width * 0.02),
          ],
        ),
      ),
    );
  }
}
