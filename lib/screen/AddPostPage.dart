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
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(
                CupertinoIcons.xmark,
                size: width * 0.075,
                color: Colors.black54,
              )),
          actions: [
            Transform.translate(
              offset: Offset(0, height * 0.0016),
              child: Icon(
                CupertinoIcons.photo,
                size: width * 0.09,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 22, right: 10),
              child: SizedBox(
                width: width * 0.135,
                height: height * 0.038,
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
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(top: 8, left: 13, right: 13),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '게시글 수정',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, fontSize: width * 0.05),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: width * 0.03, vertical: height * 0.005),
                    child: SizedBox(
                      height: width * 0.4,
                      child: ListView(
                        //좀더 자연스럽게 구현
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            width: width * 0.4,
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
                          Container(
                            width: width * 0.4,
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
                          Container(
                            width: width * 0.4,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage("images/background.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            width: width * 0.4,
                            decoration: BoxDecoration(
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
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
