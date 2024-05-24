import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:time_capsule/controller/PostController.dart';
import 'package:time_capsule/controller/BottomButtonController.dart';

class CommentPage extends StatelessWidget {
  CommentPage({super.key});
  BottomButtonController bottomButtonController =
      Get.find<BottomButtonController>();
  PostController postController = Get.find<PostController>();

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              // SliverFillRemaining 나중에 이거 함 써봐도 좋을듯
              automaticallyImplyLeading: false,
              // expandedHeight: 200,
              toolbarHeight: height * 0.055,
              leadingWidth: width * 0.2,
              floating: false,
              // 스크롤 다시 올리면 appbar 보이게 하는거
              snap: false,
              // floating이 활성화 된 순간에 스크롤 멈추는 순간 appbar의 전부를 불러오도록 함.
              pinned: true,
              // 항상 appBar 표시. 기본값은 false인데 이 경우엔 스크롤 올릴떄만 가능.
              //surfaceTintColor:
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: Colors.white,
                  // color: const Color.fromARGB(255, 231, 228, 228),
                ),
              ),
              // flexibleSpace 이거 사용하면 스크롤 다시 올릴 때 appbar색 이상하지 않고 계속 하얀색임. 뭐 동적으로 움직일 때나, 가장 위로 스크롤 했을 때 스크롤 바 색 바꿔주려고
              //  사용한다는데, 일단은 flexibleSpace 안 썻을 때, 스크롤 색이 일반 배경 색이랑 안 맞고 약간 분홍색이라 색 지정하려고 해줬음.
              shape: const Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.5)),
              leading: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '댓글',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.w300,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ],
              ),
              actions: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      CupertinoIcons.back,
                      size: width * 0.075,
                      color: Colors.black54,
                    )),
              ],
            ),
            /*SliverPadding(
              padding: EdgeInsets.only(top: height * 0.03),
              sliver: SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 20.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset:
                            const Offset(0, 3), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '댓글',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.w300,
                          color: Colors.black.withOpacity(0.8),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: Icon(
                            CupertinoIcons.back,
                            size: width * 0.075,
                            color: Colors.black54,
                          )),
                    ],
                  ),
                ),
              ),
            ),*/
            SliverPadding(
              padding: EdgeInsets.all(width * 0.05),
              sliver: SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Card(
                              shadowColor:
                                  const Color.fromARGB(255, 147, 167, 242),
                              elevation: 3,
                              clipBehavior: Clip.antiAlias,
                              shape: const CircleBorder(
                                  side: BorderSide(
                                width: 1,
                              )),
                              child: SizedBox(
                                width: width * 0.08,
                                height: height * 0.05,
                                child: const Image(
                                  image: AssetImage('images/profile.png'),
                                ),
                              ),
                            ),
                            Text(
                              'zzuntekk',
                              style: TextStyle(
                                fontSize: width * 0.02,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '와ㅣ와ㅣ러ㅏㄴ아ㅣㄴㅇㅁ롸ㅓㄴㅇㄹㅇ나ㅣ라ㅣㄴㅇ론아ㅣㅓ로어린ㄴㅇㄹㄴㅇㄴㅇㄹㄹㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㄹ',
                                style: TextStyle(
                                  fontSize: width * 0.02,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Text(
                                '2024.05.12',
                                style: TextStyle(
                                  fontSize: width * 0.02,
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
                                color: Colors.black,
                                CupertinoIcons.heart,
                                size: width * 0.045,
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
              )),
            ),
            SliverPadding(
              padding: EdgeInsets.all(width * 0.05),
              sliver: SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      children: [
                        Column(
                          children: [
                            Card(
                              shadowColor:
                                  const Color.fromARGB(255, 147, 167, 242),
                              elevation: 3,
                              clipBehavior: Clip.antiAlias,
                              shape: const CircleBorder(
                                  side: BorderSide(
                                width: 1,
                              )),
                              child: SizedBox(
                                width: width * 0.08,
                                height: height * 0.05,
                                child: const Image(
                                  image: AssetImage('images/travel.png'),
                                ),
                              ),
                            ),
                            Text(
                              'zunah',
                              style: TextStyle(
                                fontSize: width * 0.02,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '와ㅣ와ㅣ러ㅏㄴ아ㅣㄴㅇㅁ롸ㅓㄴㅇㄹㅇ나ㅣ라ㅣㄴㅇ론아ㅣㅓ로어린ㄴㅇㄹㄴㅇㄴㅇㄹㄹㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㄹ',
                                style: TextStyle(
                                  fontSize: width * 0.02,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                              ),
                              Text(
                                '2024.05.12',
                                style: TextStyle(
                                  fontSize: width * 0.02,
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
                                size: width * 0.045,
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
              )),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(width * 0.02),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 3), // changes position of shadow
              ),
            ],
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.02),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: height * 0.06, // 텍스트 입력 필드의 높이 조정

                    child: const TextField(
                      decoration: InputDecoration(
                        hintText: "댓글 입력하기...",
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      maxLength: 20,
                      maxLines: 1, // 단일 라인 입력으로 변경
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
