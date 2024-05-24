import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:time_capsule/controller/PostController.dart';
import 'package:time_capsule/controller/BottomButtonController.dart';

class chatScreen extends StatelessWidget {
  chatScreen({super.key});
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
                  SizedBox(width: width * 0.03),
                  Text(
                    '홍준택님 +4명의 파티 채팅방',
                    style: TextStyle(
                        fontSize: width * 0.03,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 53, 68, 80)),
                  ),
                ],
              ),
              actions: [
                Icon(Icons.menu, size: width * 0.09),
                const Padding(padding: EdgeInsets.only(right: 10)),
              ],
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                right: width * 0.5,
                left: width * 0.02,
                top: height * 0.02,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'zzuntekk',
                          style: TextStyle(
                            fontSize: width * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
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
                                width: width * 0.1,
                                height: height * 0.1,
                                child: const Image(
                                  image: AssetImage('images/profile.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(width * 0.02),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 189, 201, 247),
                                  border: Border.all(
                                      width: 0.0, color: Colors.white),
                                ),
                                child: Text(
                                  '너는나를 존중해야한다 나는 더보기',
                                  style: TextStyle(
                                    fontSize: width * 0.02,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '14:12',
                              style: TextStyle(
                                fontSize: width * 0.02,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                right: width * 0.5,
                left: width * 0.02,
                top: height * 0.02,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'zzuntekk',
                          style: TextStyle(
                            fontSize: width * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
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
                                width: width * 0.1,
                                height: height * 0.1,
                                child: const Image(
                                  image: AssetImage('images/profile.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(width * 0.02),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 189, 201, 247),
                                  border: Border.all(
                                      width: 0.0, color: Colors.white),
                                ),
                                child: Text(
                                  '너는나를 존중해야한다 나는 더보기',
                                  style: TextStyle(
                                    fontSize: width * 0.02,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '14:12',
                              style: TextStyle(
                                fontSize: width * 0.02,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(
                right: width * 0.5,
                left: width * 0.02,
                top: height * 0.02,
              ),
              sliver: SliverToBoxAdapter(
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'zzuntekk',
                          style: TextStyle(
                            fontSize: width * 0.02,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
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
                                width: width * 0.1,
                                height: height * 0.1,
                                child: const Image(
                                  image: AssetImage('images/profile.png'),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(width * 0.02),
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      const Color.fromARGB(255, 189, 201, 247),
                                  border: Border.all(
                                      width: 0.0, color: Colors.white),
                                ),
                                child: Text(
                                  '너는나를 존중해야한다 나는 더보기',
                                  style: TextStyle(
                                    fontSize: width * 0.02,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '14:12',
                              style: TextStyle(
                                fontSize: width * 0.02,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.all(width * 0.03),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(width: 0.0, color: Colors.black),
            borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(20), right: Radius.circular(20)),
          ),
          child: Padding(
            padding: EdgeInsets.all(width * 0.05),
            child: const TextField(
              decoration: InputDecoration(border: InputBorder.none),
              maxLength: 300,
              maxLines: 1,
            ),
          ),
        ),
        /*TextButton(
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
                      fontSize: width * 0.0353, fontWeight: FontWeight.w500),
                )),*/
      ),
    );
  }
}
