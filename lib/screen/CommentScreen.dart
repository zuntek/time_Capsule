import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_capsule/controller/PhotoController.dart';
import 'package:time_capsule/controller/PostController.dart';

class CommentScreen extends StatelessWidget {
  CommentScreen({super.key});
  PostController postController = Get.find<PostController>();
  PhotoController photoController = Get.put(PhotoController());

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
                '댓글',
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
              Container(
                width: width * 1,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(children: [
                  SizedBox(
                    height: height * 0.005,
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
                                image: AssetImage('images/profile.png'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: width * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'zuntek',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: width * 0.8,
                            child: const Text(
                              '니 한골도 못넣kdsahfasdkljfhadsjfksdhflksdhfsjkadfhsdkjlfhdkfjlhdsfklsdbfdskjlbvdslk,hdjsklfdshfkladsfhakjlfhdkljfas었잖아;;',
                              style: TextStyle(
                                fontSize: 20,
                              ),
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
              const Text(
                '총 댓글: n개',
                style: TextStyle(
                  color: Colors.black45,
                ),
              )
            ],
          ),
        ),
      ))),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(width * 0.05),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: height * 0.06, // 텍스트 입력 필드의 높이 조정
                    child: const Align(
                      alignment: Alignment.centerLeft, // TextField를 왼쪽으로 정렬
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "댓글 입력하기...",
                          border: InputBorder.none,
                          contentPadding:
                              EdgeInsets.symmetric(horizontal: 10.0),
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                        maxLength: 200,
                        maxLines: 2, // 단일 라인 입력으로 변경
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.02),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: IconButton(
                    onPressed: () {
                      // 댓글 전송 기능 구현
                    },
                    icon: const Icon(
                      Icons.send,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
