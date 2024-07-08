import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:time_capsule/controller/BottomButtonController.dart';
import 'package:time_capsule/controller/PostController.dart';
import 'package:time_capsule/screen/AddPostPage.dart';
import 'package:time_capsule/screen/Capsule.dart';
import 'package:time_capsule/screen/FixProfile.dart';
import 'package:time_capsule/screen/JoinPage.dart';
import 'package:time_capsule/screen/LoginPage.dart';
import 'package:time_capsule/screen/OnPost.dart';
import 'package:time_capsule/widget/dropDownWidget.dart';

class MyPage extends StatelessWidget {
  MyPage({super.key});
  final ValueNotifier<bool> _isListVisible = ValueNotifier(false);
  BottomButtonController bottomButtonController =
      Get.find<BottomButtonController>();
  PostController postController = Get.find<PostController>();
  final PageController _pageController = PageController();
  final Stream<int> _autoScrollStream = (() {
    StreamController<int> controller = StreamController<int>();
    Timer.periodic(const Duration(), (timer) {
      controller.add(timer.tick);
    });
    return controller.stream;
  })();

  final ValueNotifier<int> _currentPageNotifier = ValueNotifier<int>(0);
  final int _pageCount = 3;
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _listKey = GlobalKey();
  final ValueNotifier<int> _currentIndexNotifier = ValueNotifier<int>(0);
  final int _widgetCount = 3;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.white,
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.light,
    ));
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    var textWidth = width * 0.05;
    bool isListExpanded = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
          ),
          child: CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                // SliverFillRemaining 나중에 이거 함 써봐도 좋을듯
                automaticallyImplyLeading: false,
                // expandedHeight: 200,
                toolbarHeight: height * 0.08,
                leadingWidth: width * 0.8,
                floating: true,
                // 스크롤 다시 올리면 appbar 보이게 하는거
                snap: true,
                // floating이 활성화 된 순간에 스크롤 멈추는 순간 appbar의 전부를 불러오도록 함.
                pinned: false,
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
                    Text(
                      'zzuntekk',
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
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
                            title: const Text('로그아웃'),
                            content: Text(
                              '정말 로그아웃 하시겠습니까?',
                              style: TextStyle(
                                fontSize: width * 0.04,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {},
                                child: const Text('로그아웃'),
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
                      Icons.logout_outlined,
                      color: Colors.black,
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(right: 10)),
                  SizedBox(
                    height: height * 0.02,
                  )
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.01,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: width * 0.4,
                                  height: height * 0.215,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Card(
                                        elevation: 5,
                                        clipBehavior: Clip.antiAlias,
                                        shape: ContinuousRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                                50), // 원하는 둥글기
                                            side: const BorderSide(
                                                width: 1, color: Colors.black)),
                                        child: SizedBox(
                                          width: width * 0.3,
                                          height: width * 0.3,
                                          child: const Image(
                                            image: AssetImage(
                                                'images/profile.png'),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.01,
                                      ),
                                      Text(
                                        '홍준택',
                                        style: TextStyle(
                                          fontSize: width * 0.05,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      SizedBox(
                                        height: height * 0.02,
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.05,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: width * 0.4,
                                      height: height * 0.1,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '3',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.08,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '캡슐 수',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.05,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: height * 0.015,
                                    ),
                                    Container(
                                      width: width * 0.4,
                                      height: height * 0.1,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              '2024.06.24',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.06,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Text(
                                              '가입일자',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.05,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.05),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Get.to(FixProfile());
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black, // 버튼 배경색 설정
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.horizontal(
                                  left: Radius.circular(10),
                                  right: Radius.circular(10),
                                ),
                              ),
                            ),
                            child: SizedBox(
                              width: width * 0.8,
                              height: height * 0.04,
                              child: const Center(
                                child: Text(
                                  '프로필 수정',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      )
                    ],
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '홍준택님의 소중한 추억들',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '옆으로 스와이프하여 보기',
                        style: TextStyle(
                            fontSize: width * 0.04,
                            fontWeight: FontWeight.bold,
                            color: Colors.black38),
                      ),
                      /* Column(
                        children: <Widget>[
                          Container(
                            height: height * 0.3, // 높이를 화면 높이의 30%로 설정
                            width: double.infinity,
                            color: Colors.blue,
                            child: Center(
                              child: ElevatedButton(
                                onPressed: () {
                                  Scrollable.ensureVisible(
                                    _listKey.currentContext!,
                                    duration: const Duration(seconds: 1),
                                    curve: Curves.easeInOut,
                                  );
                                },
                                child: const Text('Show Friends List'),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'Some content here...',
                            style: TextStyle(fontSize: 24),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            key: _listKey,
                            height: height * 0.6,
                            width: double.infinity,
                            color: Colors.green,
                            child: Center(
                              child: Column(
                                children: [
                                  const Text(
                                    'Friends List',
                                    style: TextStyle(
                                        fontSize: 24, color: Colors.white),
                                  ),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: 29,
                                    itemBuilder: (context, index) {
                                      return ListTile(
                                        title: Text('Friend ${index + 1}'),
                                      );
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),*/
                    ],
                  ),
                ),
              ),
              /*  SliverToBoxAdapter(
                child: SizedBox(
                  height: height * 0.8,
                  child: Stack(
                    children: [
                      Container(
                        height: height * 0.1,
                        color: Colors.white,
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              _isListVisible.value = !_isListVisible.value;
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            child: ValueListenableBuilder(
                              valueListenable: _isListVisible,
                              builder: (context, value, child) {
                                return Text(value
                                    ? 'Hide Friends List'
                                    : 'Show Friends List');
                              },
                            ),
                          ),
                        ),
                      ),
                      Visibility(
                        visible: _isListVisible.value,
                        child: Container(
                          height: height * 0.6,
                          color: Colors.white,
                          child: ListView.builder(
                            itemCount: 5,
                            itemBuilder: (context, index) {
                              return ListTile(
                                title: Container(
                                  decoration: const BoxDecoration(
                                    color: Colors.green,
                                  ),
                                  child: Text('Friend ${index + 1}'),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),*/

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
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Column(
                          children: <Widget>[
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    height: height * 0.35,
                                    width: width *
                                        0.9, // PageView의 높이를 화면 높이의 30%로 설정
                                    child: StreamBuilder<int>(
                                      stream: _autoScrollStream,
                                      builder: (context, snapshot) {
                                        return PageView(
                                          controller: _pageController,
                                          children: <Widget>[
                                            Stack(
                                              children: [
                                                Container(
                                                  width: width * 0.9,
                                                  height: height * 0.35,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20), // 원하는 둥글기 정도로 설정
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20), // 같은 둥글기 정도로 설정
                                                    child: Image.asset(
                                                      '/Users/zzuntekk/time_Capsule-main/images/bridge.jpeg',
                                                      fit: BoxFit.cover,
                                                      width: width * 0.9,
                                                      height: height * 0.3,
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(8),
                                                        child: Column(
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Stack(
                                                              children: <Widget>[
                                                                // Outline text
                                                                Text(
                                                                  '한강다리 내다리',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        30,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    foreground:
                                                                        Paint()
                                                                          ..style =
                                                                              PaintingStyle.stroke
                                                                          ..strokeWidth =
                                                                              1
                                                                          ..color =
                                                                              Colors.black,
                                                                  ),
                                                                ),
                                                                // Solid text
                                                                const Text(
                                                                  '한강다리 내다리',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        30,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                            const Text(
                                                              '양화대교',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                            const Text(
                                                              '2024년 6월 5일의 추억',
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: height * 0.18,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .end,
                                                        children: [
                                                          Container(
                                                            decoration:
                                                                const BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        20),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        20),
                                                              ), // 원하는 둥글기 정도로 설정

                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  spreadRadius:
                                                                      2,
                                                                  blurRadius: 5,
                                                                  offset:
                                                                      Offset(
                                                                          3, 0),
                                                                ),
                                                              ],
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
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Icon(
                                                                        color: Colors
                                                                            .black,
                                                                        CupertinoIcons
                                                                            .chat_bubble,
                                                                        size: width *
                                                                            0.062,
                                                                      ),
                                                                      const Text(
                                                                        '13',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
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
                                                                  child: Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .min,
                                                                    children: [
                                                                      Icon(
                                                                        color: Colors
                                                                            .black,
                                                                        CupertinoIcons
                                                                            .heart,
                                                                        size: width *
                                                                            0.062,
                                                                      ),
                                                                      const Text(
                                                                        '13',
                                                                        style:
                                                                            TextStyle(
                                                                          color:
                                                                              Colors.black,
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
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                                  ),
                                ]),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Get.to(OnPost());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black, // 버튼 배경색 설정
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.horizontal(
                                left: Radius.circular(10),
                                right: Radius.circular(10),
                              ),
                            ),
                          ),
                          child: SizedBox(
                            width: width * 0.8,
                            height: height * 0.04,
                            child: const Center(
                              child: Text(
                                '게시글 작성',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              /*   SliverGrid(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: width * 0.03,
                                vertical: height * 0.03),
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Capsule();
                                  },
                                );
                                // 이미지가 클릭되었을 때 수행할 작업을 여기에 추가
                              },
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: width * 0.6,
                                    height: height * 0.1,
                                    child: Container(
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "images/background.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '위치 정보',
                                    style: TextStyle(
                                      fontSize: width * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  childCount: postController.postList.length,
                ),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  mainAxisExtent: 200,
                ),
              )*/
            ],
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        // height: height * 0.075,
        // decoration: const BoxDecoration(
        //   border: Border(
        //     top: BorderSide(width: 0.5, color: Colors.grey),
        //   ),
        // ),
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
}
