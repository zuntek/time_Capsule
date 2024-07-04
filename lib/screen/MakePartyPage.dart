import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:time_capsule/controller/PostController.dart';

class MakePartyPage extends StatelessWidget {
  MakePartyPage({super.key});
  PostController postController = Get.find<PostController>();

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
                  '파티 만들기',
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
              padding: const EdgeInsets.only(top: 8, left: 13, right: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03, vertical: height * 0.005),
                    child: SizedBox(
                      child: Container(
                        width: width * 0.7,
                        height: height * 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.black, // 테두리 색상 설정
                            width: 1, // 테두리 두께 설정
                          ),
                        ),
                        child: const Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.add_a_photo),
                              Text('파티 대표화면 삽입하기'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  const TextField(
                    maxLines: 1,
                    minLines: 1, // 이거 textField 기본 height 값 늘리는 방법
                    decoration: InputDecoration(
                      labelText: '파티 이름',
                      hintText: '15자 이하로 작성해주세요.',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(10),
                          right: Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(10),
                          right: Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black, // 클릭했을 때 테두리 색상
                          width: 2.0, // 테두리 두께 (원하는 경우 조정 가능)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  TextField(
                    onChanged: (val) {
                      postController.postText.value = val;
                    },
                    maxLines: 3,
                    minLines: 3,
                    decoration: const InputDecoration(
                      labelText: '소개글 입력',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: '파티를 소개하는 글을 입력하세요.',
                      labelStyle: TextStyle(color: Colors.black),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(10),
                          right: Radius.circular(10),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(10),
                          right: Radius.circular(10),
                        ),
                        borderSide: BorderSide(
                          color: Colors.black, // 클릭했을 때 테두리 색상
                          width: 2.0, // 테두리 두께 (원하는 경우 조정 가능)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 22, right: 10),
                    child: SizedBox(
                      width: width * 0.9,
                      height: height * 0.05,
                      child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Colors.black,
                              foregroundColor: Colors.white,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(40),
                                right: Radius.circular(40),
                              ))),
                          onPressed: () {
                            postController.sendData();
                            Get.back();
                          },
                          child: Text(
                            '완료',
                            style: TextStyle(
                                fontSize: width * 0.0353,
                                fontWeight: FontWeight.w500),
                          )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
