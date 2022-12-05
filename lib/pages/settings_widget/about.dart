

import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:url_launcher/url_launcher.dart';

class AboutDialogWidget extends StatefulWidget {
  const AboutDialogWidget({super.key});

  @override
  State<AboutDialogWidget> createState() => _AboutDialogWidgetState();
}

class _AboutDialogWidgetState extends State<AboutDialogWidget>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 270,
       
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TabBar(
                indicatorColor: Colors.black,
                controller: tabController,
                tabs:const [
                  Tab(
                    child: Text(
                      'Info',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  Tab(
                    child: Text(
                      'Contact',
                      style: TextStyle(color: Colors.black),
                    ),
                  )
                ]),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: const[
                           CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage(
                                'assets/images/Types-of-financial-managers.jpg'),
                          ),
                          SizedBox(),
                          Text(
                            'MONEY POUCH',
                            style: TextStyle(),
                          ),
                          SizedBox(),
                          Text(
                            '',
                            style: TextStyle(),
                          ),
                        ],
                      ),
                      const Text(
                        'This is an app where you can add your daily transactions according to the category which it belongs to.',
                        style: TextStyle(),
                      ),
                      Row(
                        children:const [
                          Text(
                            'DEVELOPED BY',
                            style: TextStyle(),
                          ),
                          SizedBox(),
                          Text(
                            'AKHIL BABU',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'CONTACT ME',
                        style: TextStyle(),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () async {
                                launchUr(Uri.parse(
                                    'https://www.instagram.com/?i=1i6y6dolyiko0&amp;utm_content=omt4u47'));
                              },
                              icon: const Icon(FontAwesomeIcons.instagram)),
                          IconButton(
                              onPressed: () async {
                                launchUr(Uri.parse(
                                    'https://www.linkedin.com/in/akhil-babu-666639212'));
                              },
                              icon: const Icon(FontAwesomeIcons.linkedin)),
                          IconButton(
                              onPressed: () async {
                                launchUr(Uri.parse(
                                    'https://github.com/akhilbabu759'));
                              },
                              icon: const Icon(FontAwesomeIcons.github)),
                        ],
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> launchUr(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch ';
    }
  }
}
