import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_capsule/controller/PostController.dart';

class Capsule extends StatelessWidget {
  Capsule({super.key});
  PostController postController = Get.find<PostController>();

  // cid, pid 받아서 작동하는 부분 작성

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: height * 0.13, horizontal: width * 0.07),
      child: Container(
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: width * 0.02,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'zzuntekk님의 게시글',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: width * 0.05),
                    ),
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          CupertinoIcons.back,
                          size: width * 0.075,
                          color: Colors.black,
                        )),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.01,
                    vertical: height * 0.01,
                  ),
                  child: SizedBox(
                    height: height * 0.3,
                    width: width * 0.9,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Container(
                          width: width * 0.6, // 이미지의 너비를 화면 너비의 절반으로 설정
                          height: height * 0.15, // 이미지의 높이를 화면 높이의 40%로 설정
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/background.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        Container(
                          width: width * 0.5, // 이미지의 너비를 화면 너비의 절반으로 설정
                          height: height * 0.15, // 이미지의 높이를 화면 높이의 40%로 설정
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/background.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                        Container(
                          width: width * 0.5, // 이미지의 너비를 화면 너비의 절반으로 설정
                          height: height * 0.15, // 이미지의 높이를 화면 높이의 40%로 설정
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/background.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.01,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        // 버튼이 눌렸을 때 실행되는 코드 작성
                      },
                      child: Text(
                        'zzuntekk',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: width * 0.05),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        // 버튼이 눌렸을 때 실행되는 코드 작성
                      },
                      child: Column(
                        children: [
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            '용인팟',
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: width * 0.035,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                    ),
                    TextButton(
                      onPressed: () {
                        // 버튼이 눌렸을 때 실행되는 코드 작성
                      },
                      child: Text(
                        '서울시 강서구에서.', //위치값 받기
                        style: TextStyle(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: width * 0.03),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.005),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz', //글 내용
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                            color: Colors.black,
                            CupertinoIcons.heart,
                            size: width * 0.065,
                          ),
                          const Text(
                            '',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.only(left: 3),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            color: Colors.black,
                            CupertinoIcons.chat_bubble,
                            size: width * 0.062,
                          ),
                          const Text(
                            '13',
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
