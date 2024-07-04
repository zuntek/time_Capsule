import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_capsule/controller/PhotoController.dart';
import 'package:time_capsule/controller/PostController.dart';

class OnPost extends StatelessWidget {
  OnPost({super.key});
  PostController postController = Get.find<PostController>();
  PhotoController photoController = Get.put(PhotoController());
  final Stream<int> _autoScrollStream = (() {
    StreamController<int> controller = StreamController<int>();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      controller.add(timer.tick);
    });
    return controller.stream;
  })();
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);
  final int _widgetCount = 3;
  final PageController _pageController = PageController();
  // cid, pid 받아서 작동하는 부분 작성
  AutoScrollWidget() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      _currentIndexNotifier.value =
          (_currentIndexNotifier.value + 1) % _widgetCount;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            toolbarHeight: height * 0.065,
            leadingWidth: width * 0.8,
            backgroundColor: Colors.white,
            leading: Row(
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      CupertinoIcons.back,
                      size: width * 0.075,
                      color: Colors.black54,
                    )),
                Text(
                  'zzuntekk님의 게시글',
                  style: TextStyle(
                    fontSize: width * 0.05,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            actions: const []),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Padding(
          padding: const EdgeInsets.symmetric(),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                width: 0.5,
              ),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width * 0.02,
                        ),
                        const Text(
                          '풋살은 즐거워',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black),
                        ),
                        SizedBox(
                          width: width * 0.02,
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: height * 0.4,
                            width: width * 0.9,
                            child: StreamBuilder<int>(
                              stream: _autoScrollStream,
                              builder: (context, snapshot) {
                                return PageView(
                                  children: <Widget>[
                                    Container(
                                        width: width * 0.9,
                                        height: height * 0.35,
                                        decoration: const BoxDecoration(
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          children: [
                                            ClipRRect(
                                              child: Image.asset(
                                                '/Users/zzuntekk/time_Capsule-main/images/foot.png',
                                                fit: BoxFit.cover,
                                                width: width * 0.9,
                                                height: height * 0.38,
                                              ),
                                            ),
                                          ],
                                        )),
                                  ],
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: width * 0.02,
                        ),
                        const Text(
                          'zzuntekk',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(
                          '경기도 용인시',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.black54),
                        ),
                        Text(
                          '2024.05.11',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                              color: Colors.black54),
                        ),
                      ],
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                        ),
                        color: Colors.black,
                      ),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(left: 3),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  color: Colors.white,
                                  CupertinoIcons.chat_bubble,
                                  size: width * 0.062,
                                ),
                                const Text(
                                  '13',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.only(left: 5),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  color: Colors.white,
                                  CupertinoIcons.heart,
                                  size: width * 0.062,
                                ),
                                const Text(
                                  '13',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),
                      const Text(
                        '개레전드 경기... 오늘만 벌써 3골을 넣었다... 하지만 졌다... 다음번엔 꼭이긴다...',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: width * 1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(
                      color: Colors.black,
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(
                      20,
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(
                      height: height * 0.02,
                    ),
                    const Text(
                      '최신댓글 보기',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAlias,
                              shape: const CircleBorder(
                                side: BorderSide(
                                  width: 1,
                                ),
                              ),
                              child: SizedBox(
                                width: width * 0.1,
                                height: height * 0.1,
                                child: const Image(
                                  image: AssetImage('images/profile.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: width * 0.02),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'handue',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '니 한골도 못넣었잖아;;',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              clipBehavior: Clip.antiAlias,
                              shape: const CircleBorder(
                                side: BorderSide(
                                  width: 1,
                                ),
                              ),
                              child: SizedBox(
                                width: width * 0.1,
                                height: height * 0.1,
                                child: const Image(
                                  image: AssetImage('images/bear.png'),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(width: width * 0.02),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'insu_1004',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'ㅇㅈㅇㅈ',
                              style: TextStyle(
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ))));
  }
}
