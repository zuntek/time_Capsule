import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:time_capsule/controller/PostController.dart';

class AddPostPage extends StatelessWidget {
  AddPostPage({super.key});
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
                  '게시글 작성',
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
                    height: height * 0.05,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03, vertical: height * 0.005),
                    child: SizedBox(
                      height: height * 0.25,
                      child: ListView(
                        //좀더 자연스럽게 구현
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Row(
                            children: [
                              Container(
                                width: height * 0.25,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black, // 원하는 테두리 색상
                                    width: 2.0, // 테두리 두께
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_a_photo),
                                    Text('사진 추가하기') //추가하는 부분... ㅈㄴ 어렵더라...
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: height * 0.25,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.black, // 원하는 테두리 색상
                                    width: 2.0, // 테두리 두께
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.add_a_photo),
                                    Text('사진 추가하기') //추가하는 부분... ㅈㄴ 어렵더라...
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: width * 0.01,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                width: height * 0.25,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
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
                        ],
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
                    maxLines: 1,
                    minLines: 1, // 이거 textField 기본 height 값 늘리는 방법
                    decoration: const InputDecoration(
                      labelText: '위치 입력',
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
                    maxLines: 8,
                    minLines: 8, // 이거 textField 기본 height 값 늘리는 방법
                    decoration: const InputDecoration(
                      labelText: '글 입력',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: '글을 입력하세요.',
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
