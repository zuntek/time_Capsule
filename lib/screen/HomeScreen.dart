import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:time_capsule/controller/LocationController.dart';
import 'package:time_capsule/controller/PostController.dart';
import 'package:time_capsule/Model/PostModel.dart';
import 'package:time_capsule/controller/BottomButtonController.dart';
import 'package:time_capsule/controller/PhotoController.dart';
import 'package:time_capsule/screen/MakePartyPage.dart';
import 'package:time_capsule/widget/Expandable_fab.dart';
import 'package:time_capsule/widget/SearchBar.dart';
import 'package:time_capsule/widget/dropDownWidget.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  LocationController locationController = Get.put(LocationController());
  PostController postController = Get.find<PostController>();
  BottomButtonController bottomButtonController =
      Get.find<BottomButtonController>();
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
  AutoScrollWidget() {
    Timer.periodic(const Duration(seconds: 3), (timer) {
      _currentIndexNotifier.value =
          (_currentIndexNotifier.value + 1) % _widgetCount;
    });
  }

  // initialBinding이 전체 전역에서 사용되는 controller 선언할 때 좋다고 하는데, 아직은 뭔 소린지 모르겠음.

  // 이거 동작 구동을 어떻게 하게 하지, 그냥 모든게 다 승인됐을 때 return map 클래스를 하고 거기서 Geolocator.getCurrentPosition() 을 할까?
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    int likeCount = 0;
    // 검색어를 저장할 변수

    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: ExpandableFab(
        distance: 80.0,
      ),
      body: SafeArea(
        child: Stack(children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
          ),
          CustomScrollView(slivers: <Widget>[
            SliverAppBar(
              automaticallyImplyLeading: false,
              title: Text(
                'CapInNet',
                style: TextStyle(
                    fontFamily: 'Kalam',
                    fontSize: width * 0.075,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromARGB(255, 53, 68, 80)),
              ),
              // SliverFillRemaining 나중에 이거 함 써봐도 좋을듯
              toolbarHeight: height * 0.08,
              leadingWidth: width * 0.2,
              floating: true,
              // 스크롤 다시 올리면 appbar 보이게 하는거
              snap: true,
              // floating이 활성화 된 순간에 스크롤 멈추는 순간 appbar의 전부를 불러오도록 함.
              pinned: false,
              // 항상 appBar 표시. 기본값은 false인데 이 경우엔 스크롤 올릴떄만 가능.
              //surfaceTintColor:
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              // flexibleSpace 이거 사용하면 스크롤 다시 올릴 때 appbar색 이상하지 않고 계속 하얀색임. 뭐 동적으로 움직일 때나, 가장 위로 스크롤 했을 때 스크롤 바 색 바꿔주려고
              // 사용한다는데, 일단은 flexibleSpace 안 썻을 때, 스크롤 색이 일반 배경 색이랑 안 맞고 약간 분홍색이라 색 지정하려고 해줬음.
              shape: const Border(
                  bottom: BorderSide(color: Colors.grey, width: 0.5)),
              // leading: Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: Container(
              //     child: const FittedBox(child: Icon(Icons.airport_shuttle)),
              //   ),
              // ),
              actions: [
                IconButton(
                  onPressed: () {
                    Get.to(GetSearchBar(
                      isSearchExpanded: false,
                      onSearchIconPressed: () {
                        // 검색 아이콘 클릭 시 실행될 동작
                      },
                      onSearchFieldTapped: () {
                        Text1();
                      },
                    ));
                  },
                  icon: Icon(
                    Icons.search,
                    size: width * 0.083,
                    color: Colors.black,
                  ),
                ),
                const Padding(padding: EdgeInsets.only(right: 8)),

                PopupMenuButton(
                  icon: Icon(
                    Icons.menu,
                    size: width * 0.09,
                    color: Colors.black,
                  ),
                  offset: Offset(width, height * 0.055),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  color: Colors.black,
                  elevation: 50,
                  itemBuilder: (context) {
                    return [
                      dropDownWidget.buildPopupMenuItemWidget(
                          "설정", Icons.settings, Options.setting.index),
                      dropDownWidget.buildPopupMenuItemWidget(
                          "로그아웃", Icons.logout, Options.logout.index),
                    ];
                  },
                ),

                // Icon(Icons.menu, size: width * 0.09),
                // const Padding(padding: EdgeInsets.only(right: 10)),
              ],
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(),
              sliver: SliverToBoxAdapter(
                child: Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        // 아래쪽 테두리
                        color: Colors.grey, // 테두리 색상
                        width: 1.0, // 테두리 두께
                      ),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: height * 0.01),
                        child: SizedBox(
                          height: height * 0.12,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white24,
                            ),
                            child: ListView(
                              scrollDirection: Axis.horizontal,
                              children: <Widget>[
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                TextButton(
                                  onPressed: () {
                                    Get.to(MakePartyPage());
                                  },
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.zero,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    // Column의 크기를 최소화하여 아이콘과 텍스트를 세로로 배열
                                    children: [
                                      Icon(Icons.add_box,
                                          size: width * 0.13,
                                          color: Colors.black), // 아이콘 추가
                                      const Text(
                                        '파티 만들기',
                                        style: TextStyle(
                                            color: Colors
                                                .black), // 텍스트 색상을 흰색으로 설정
                                      ), // 텍스트 추가
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.02,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.03),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Card(
                                        shadowColor: Colors.white,
                                        elevation: 5,
                                        clipBehavior: Clip.antiAlias,
                                        shape: ContinuousRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                50), // 원하는 둥글기
                                            side: const BorderSide(
                                                width: 1, color: Colors.black)),
                                        child: SizedBox(
                                          width: width * 0.18,
                                          height: width * 0.18,
                                          child: const Image(
                                            image: AssetImage(
                                                '/Users/zzuntekk/time_Capsule-main/images/travel.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.15,
                                        child: const Text(
                                          '용인의 친구들', // 예시 텍스트
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // 텍스트가 길 경우 '...'으로 표시
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.03),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Card(
                                        shadowColor: Colors.white,
                                        elevation: 5,
                                        clipBehavior: Clip.antiAlias,
                                        shape: ContinuousRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                50), // 원하는 둥글기
                                            side: const BorderSide(
                                                width: 1, color: Colors.black)),
                                        child: SizedBox(
                                          width: width * 0.18,
                                          height: width * 0.18,
                                          child: const Image(
                                            image: AssetImage(
                                                '/Users/zzuntekk/time_Capsule-main/images/foot.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.15,
                                        child: const Text(
                                          '풋살은 즐거워', // 예시 텍스트
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // 텍스트가 길 경우 '...'으로 표시
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {},
                                  style: TextButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: width * 0.03),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Card(
                                        shadowColor: Colors.white,
                                        elevation: 5,
                                        clipBehavior: Clip.antiAlias,
                                        shape: ContinuousRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                50), // 원하는 둥글기
                                            side: const BorderSide(
                                                width: 1, color: Colors.black)),
                                        child: SizedBox(
                                          width: width * 0.18,
                                          height: width * 0.18,
                                          child: const Image(
                                            image: AssetImage(
                                                'images/profile.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.15,
                                        child: const Text(
                                          '홍준택을 사랑하는 모임', // 예시 텍스트
                                          style: TextStyle(
                                            color: Colors.black,
                                          ),
                                          overflow: TextOverflow
                                              .ellipsis, // 텍스트가 길 경우 '...'으로 표시
                                          maxLines: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Obx(() {
              if (postController.postList.isEmpty) {
                return SliverToBoxAdapter(
                  child: Column(
                    children: [
                      SizedBox(height: height * 0.368),
                      const Center(
                        child: CircularProgressIndicator(
                          // 여기서 원래 일반 위젯 circularprogressIndicator 바로 반환했는데, CustomScrollView에서는 반환을 sliver타입으로 해야함. 그래서 일반 위젯을 sliver타입으로 바꿔주는 slivertoboxadapter사용.
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return SliverGrid(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Padding(
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
                                    children: [
                                      SizedBox(
                                        width: width * 0.02,
                                      ),
                                      const Text(
                                        '풋살은 즐거워의 최신글',
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        border: Border.all(
                                                          color: Colors.black,
                                                          width: 0.5,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          20,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topRight: Radius
                                                                  .circular(20),
                                                              topLeft: Radius
                                                                  .circular(20),
                                                            ),
                                                            child: Image.asset(
                                                              '/Users/zzuntekk/time_Capsule-main/images/foot.png',
                                                              fit: BoxFit.cover,
                                                              width:
                                                                  width * 0.9,
                                                              height:
                                                                  height * 0.3,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                height * 0.01,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  SizedBox(
                                                                    width:
                                                                        width *
                                                                            0.02,
                                                                  ),
                                                                  const Text(
                                                                    'insu_1004',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            25,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              ),
                                                              const Column(
                                                                children: [
                                                                  Text(
                                                                    '경기도 용인시',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            10,
                                                                        color: Colors
                                                                            .black54),
                                                                  ),
                                                                  Text(
                                                                    '2024.05.11',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            10,
                                                                        color: Colors
                                                                            .black54),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            20),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            20),
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                child: Row(
                                                                  children: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {},
                                                                      style: TextButton
                                                                          .styleFrom(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                3),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Icon(
                                                                            color:
                                                                                Colors.white,
                                                                            CupertinoIcons.chat_bubble,
                                                                            size:
                                                                                width * 0.062,
                                                                          ),
                                                                          const Text(
                                                                            '13',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {},
                                                                      style: TextButton
                                                                          .styleFrom(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                5),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Icon(
                                                                            color:
                                                                                Colors.white,
                                                                            CupertinoIcons.share,
                                                                            size:
                                                                                width * 0.062,
                                                                          ),
                                                                          const Text(
                                                                            '13',
                                                                            style:
                                                                                TextStyle(
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
                                                        ],
                                                      )),
                                                  Container(
                                                      width: width * 0.9,
                                                      height: height * 0.35,
                                                      decoration: BoxDecoration(
                                                        border: Border.all(
                                                          color: Colors.black,
                                                          width: 0.5,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          20,
                                                        ),
                                                      ),
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topRight: Radius
                                                                  .circular(20),
                                                              topLeft: Radius
                                                                  .circular(20),
                                                            ),
                                                            child: Image.asset(
                                                              '/Users/zzuntekk/time_Capsule-main/images/eye.png',
                                                              fit: BoxFit.cover,
                                                              width:
                                                                  width * 0.9,
                                                              height:
                                                                  height * 0.3,
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height:
                                                                height * 0.01,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .end,
                                                                children: [
                                                                  SizedBox(
                                                                    width:
                                                                        width *
                                                                            0.02,
                                                                  ),
                                                                  const Text(
                                                                    'zzuntekk',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            25,
                                                                        color: Colors
                                                                            .black),
                                                                  ),
                                                                ],
                                                              ),
                                                              const Column(
                                                                children: [
                                                                  Text(
                                                                    '서울시 강서구',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            10,
                                                                        color: Colors
                                                                            .black54),
                                                                  ),
                                                                  Text(
                                                                    '2024.06.11',
                                                                    style: TextStyle(
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .bold,
                                                                        fontSize:
                                                                            10,
                                                                        color: Colors
                                                                            .black54),
                                                                  ),
                                                                ],
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    const BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            20),
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            20),
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                child: Row(
                                                                  children: [
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {},
                                                                      style: TextButton
                                                                          .styleFrom(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                3),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Icon(
                                                                            color:
                                                                                Colors.white,
                                                                            CupertinoIcons.chat_bubble,
                                                                            size:
                                                                                width * 0.062,
                                                                          ),
                                                                          const Text(
                                                                            '13',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.white,
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    TextButton(
                                                                      onPressed:
                                                                          () {},
                                                                      style: TextButton
                                                                          .styleFrom(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                                5),
                                                                      ),
                                                                      child:
                                                                          Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.min,
                                                                        children: [
                                                                          Icon(
                                                                            color:
                                                                                Colors.white,
                                                                            CupertinoIcons.share,
                                                                            size:
                                                                                width * 0.062,
                                                                          ),
                                                                          const Text(
                                                                            '13',
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black,
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
                            ],
                          ),
                        ),
                      );
                    },
                    childCount: 3,
                  ),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: height * 0.5,
                    mainAxisExtent: width * 1.1,
                  ),
                );
              }
            }),
          ]),
        ]),
      ),
      // }
      // },
      // ),
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
                color: Colors.blueAccent,
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

  bool isSearching = false;
  String searchQuery = '';
  Widget buildSearchBar() {
    return isSearching
        ? TextField(
            decoration: const InputDecoration(hintText: '검색어를 입력하세요'),
            onChanged: (value) {
              // 검색어가 변경될 때마다 저장
              searchQuery = value;
            },
          )
        : Container();
  }
}
