import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:time_capsule/controller/BottomButtonController.dart';
import 'package:time_capsule/controller/PostController.dart';
import 'package:time_capsule/screen/NotificationPage.dart';
import 'package:time_capsule/screen/PartyMemberList.dart';
import 'package:time_capsule/screen/PartyRequestPage.dart';
import 'package:time_capsule/widget/WidgetTools.dart';

class GroupPage extends StatelessWidget {
  GroupPage({super.key});
  BottomButtonController bottomButtonController =
      Get.find<BottomButtonController>();
  PostController postController = Get.find<PostController>();
  final PageController _pageController = PageController();
  final Stream<int> _autoScrollStream = (() {
    StreamController<int> controller = StreamController<int>();
    Timer.periodic(const Duration(seconds: 5), (timer) {
      controller.add(timer.tick);
    });
    return controller.stream;
  })();
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);
  final int _widgetCount = 3;

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
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                // SliverFillRemaining 나중에 이거 함 써봐도 좋을듯
                automaticallyImplyLeading: false,
                // expandedHeight: 200,
                toolbarHeight: height * 0.08,
                leadingWidth: width * 0.5,
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
                  children: [
                    SizedBox(width: width * 0.03),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        PopupMenuButton<String>(
                          color: Colors.white,
                          onSelected: (String result) {
                            // 선택한 항목에 대해 수행할 작업을 여기에 추가
                            print('선택된 항목: $result');
                          },
                          itemBuilder: (BuildContext context) =>
                              <PopupMenuEntry<String>>[
                            const PopupMenuItem<String>(
                              value: 'item1',
                              child: Text('중태기와 칭구들'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'item2',
                              child: Text('용인팟'),
                            ),
                            const PopupMenuItem<String>(
                              value: 'item3',
                              child: Text('용인대학교'),
                            ),
                          ],
                          child: Row(
                            children: [
                              Icon(
                                Icons.list_sharp,
                                size: width * 0.05,
                                color: Colors.black,
                              ),
                              Text(
                                '용인팟',
                                style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.04,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                actions: [
                  TextButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('그룹 멤버 추가'),
                            content: const TextField(
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                hintText: "닉네임 입력",
                                border: InputBorder.none,
                                hintStyle: TextStyle(color: Colors.grey),
                              ),
                              maxLength: 16,
                              maxLines: 1,
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('추가'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text('닫기'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: const Icon(
                      Icons.group_add,
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(Notificationpage());
                    },
                    child: const Icon(
                      Icons.notifications_none,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(),
                sliver: SliverToBoxAdapter(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          // 배경 이미지 설정
                          ClipRRect(
                            child: Image.asset(
                              '/Users/zzuntekk/time_Capsule-main/images/foot.png', // 이미지 경로 수정
                              fit: BoxFit.cover,
                              width: width,
                              height: height * 0.8,
                            ),
                          ),
                          Positioned(
                            child: Column(
                              children: [
                                Container(
                                  decoration: const BoxDecoration(
                                      color: Colors.black26),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              IconButton(
                                                icon: const Icon(
                                                    Icons.arrow_back,
                                                    color: Colors.white),
                                                onPressed: () {
                                                  int previousPage =
                                                      _pageController.page!
                                                              .toInt() -
                                                          1;
                                                  if (previousPage >= 0) {
                                                    _pageController
                                                        .animateToPage(
                                                      previousPage,
                                                      duration: const Duration(
                                                          milliseconds: 500),
                                                      curve: Curves.easeIn,
                                                    );
                                                  }
                                                },
                                              ),
                                              SizedBox(
                                                height: height * 0.1,
                                                width: width *
                                                    0.76, // PageView의 높이를 화면 높이의 30%로 설정
                                                child: StreamBuilder<int>(
                                                  stream: _autoScrollStream,
                                                  builder: (context, snapshot) {
                                                    if (snapshot.hasData &&
                                                        _pageController
                                                            .hasClients) {
                                                      int nextPage = snapshot
                                                              .data! %
                                                          3; // assuming 3 images
                                                      _pageController
                                                          .animateToPage(
                                                        nextPage,
                                                        duration:
                                                            const Duration(
                                                                milliseconds:
                                                                    300),
                                                        curve: Curves.easeIn,
                                                      );
                                                    }
                                                    return PageView(
                                                      controller:
                                                          _pageController,
                                                      children: <Widget>[
                                                        Stack(
                                                          children: [
                                                            Container(
                                                              width:
                                                                  width * 0.76,
                                                              height:
                                                                  height * 0.3,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20), // 원하는 둥글기 정도로 설정
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.5),
                                                                    spreadRadius:
                                                                        2,
                                                                    blurRadius:
                                                                        5,
                                                                    offset:
                                                                        const Offset(
                                                                            0,
                                                                            3),
                                                                  ),
                                                                ],
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20), // 같은 둥글기 정도로 설정
                                                                child:
                                                                    Image.asset(
                                                                  '/Users/zzuntekk/time_Capsule-main/images/basketball.png',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width: width *
                                                                      0.76,
                                                                  height:
                                                                      height *
                                                                          0.3,
                                                                ),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              bottom: 10,
                                                              right: 10,
                                                              child: Container(
                                                                color: Colors
                                                                    .black54,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(8),
                                                                child:
                                                                    const Text(
                                                                  '베스킷볼 프렌즈',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                        Stack(
                                                          children: [
                                                            Container(
                                                              width:
                                                                  width * 0.76,
                                                              height:
                                                                  height * 0.3,
                                                              decoration:
                                                                  BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20), // 원하는 둥글기 정도로 설정
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    color: Colors
                                                                        .grey
                                                                        .withOpacity(
                                                                            0.5),
                                                                    spreadRadius:
                                                                        2,
                                                                    blurRadius:
                                                                        5,
                                                                    offset:
                                                                        const Offset(
                                                                            0,
                                                                            3),
                                                                  ),
                                                                ],
                                                              ),
                                                              child: ClipRRect(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            20), // 같은 둥글기 정도로 설정
                                                                child:
                                                                    Image.asset(
                                                                  '/Users/zzuntekk/time_Capsule-main/images/foot.png',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  width: width *
                                                                      0.76,
                                                                  height:
                                                                      height *
                                                                          0.3,
                                                                ),
                                                              ),
                                                            ),
                                                            Positioned(
                                                              bottom: 10,
                                                              right: 10,
                                                              child: Container(
                                                                color: Colors
                                                                    .black54,
                                                                padding:
                                                                    const EdgeInsets
                                                                        .all(8),
                                                                child:
                                                                    const Text(
                                                                  '풋살은 즐거워',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    );
                                                  },
                                                ),
                                              ),
                                              IconButton(
                                                icon: const Icon(
                                                  Icons.arrow_forward,
                                                  color: Colors.white,
                                                ),
                                                onPressed: () {
                                                  int nextPage = _pageController
                                                          .page!
                                                          .toInt() +
                                                      1;
                                                  if (nextPage < 3) {
                                                    // assuming 3 images
                                                    _pageController
                                                        .animateToPage(
                                                      nextPage,
                                                      duration: const Duration(
                                                          milliseconds: 300),
                                                      curve: Curves.easeIn,
                                                    );
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: height * 0.02,
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  decoration:
                                      const BoxDecoration(color: Colors.black),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '베스킷볼 프렌즈',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        '#123456',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                      Text(
                                        '농구 잘하는 사람들만 들어와라.',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          Get.to(Partyrequestpage());
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.black, // 버튼 배경색 설정
                                          shape: const RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.horizontal(
                                              left: Radius.circular(10),
                                              right: Radius.circular(10),
                                            ),
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: width * 0.3,
                                          height: height * 0.04,
                                          child: const Center(
                                            child: Text(
                                              '파티 신청 현황',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: ElevatedButton(
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    vertical: height * 0.01,
                                                    horizontal: width * 0.01,
                                                  ), // 원하는 패딩 값으로 조정
                                                  child: PartyMemberList(),
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              Colors.black, // 버튼 배경색 설정
                                          shape: const RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.horizontal(
                                              left: Radius.circular(10),
                                              right: Radius.circular(10),
                                            ),
                                          ),
                                        ),
                                        child: SizedBox(
                                          width: width * 0.3,
                                          height: height * 0.04,
                                          child: const Center(
                                            child: Text(
                                              '파티 멤버 보기',
                                              style: TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // 겹치는 컨텐츠를 위한 Container
                          Positioned.fill(
                            top: height * 0.7,
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  const Text(
                                    '파티의 최신글',
                                    style: TextStyle(
                                      fontSize: 28, // 폰트 크기를 약간 더 키웠습니다.
                                      fontWeight:
                                          FontWeight.w600, // 폰트 굵기를 조정했습니다.
                                      color: Colors.black,
                                      decoration:
                                          TextDecoration.underline, // 밑줄 추가
                                      decorationColor:
                                          Colors.black, // 밑줄 색상을 회색으로 설정
                                      decorationThickness: 2.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: width * 0.02),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                postWidget(
                                  imagePath:
                                      '/Users/zzuntekk/time_Capsule-main/images/basketball.png',
                                  nickname: 'insu_1004',
                                  location: '경기도 용인시',
                                  date: '2024.05.11',
                                  onCommentPressed: () {
                                    // 댓글 버튼 클릭 시 동작 정의
                                  },
                                  content: 'dfsfsf',
                                ),
                                SizedBox(
                                  height: height * 0.02,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(width: 0.5, color: Colors.grey),
          ),
        ),
        child: Obx(
          () {
            return BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              iconSize: width * 0.07, // 아이콘 크기 증가
              unselectedItemColor: Colors.grey,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              selectedItemColor: Colors.black,
              currentIndex: bottomButtonController.selectedIndex.value,
              selectedLabelStyle: TextStyle(
                color: Colors.black,
                fontSize: width * 0.035,
                fontWeight: FontWeight.bold,
              ),
              unselectedLabelStyle: TextStyle(
                color: Colors.grey,
                fontSize: width * 0.03,
                fontWeight: FontWeight.w500,
              ),
              items: const [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
                BottomNavigationBarItem(icon: Icon(Icons.group), label: '파티'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.location_on_outlined), label: '맵'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.profile_circled), label: '마이'),
              ],
              onTap: (index) {
                bottomButtonController.onTap(index);
              },
            );
          },
        ),
      ),
    );
  }
}
