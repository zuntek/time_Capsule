import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:time_capsule/controller/BottomButtonController.dart';
import 'package:time_capsule/controller/PostController.dart';

class Notificationpage extends StatelessWidget {
  Notificationpage({super.key});
  BottomButtonController bottomButtonController =
      Get.find<BottomButtonController>();
  PostController postController = Get.find<PostController>();
  final ValueNotifier<bool> showFirstScreen = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
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
              leading: Row(children: [
                SizedBox(width: width * 0.03),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                        onPressed: () {
                          Get.back();
                        },
                        icon: Icon(
                          CupertinoIcons.back,
                          size: width * 0.075,
                          color: Colors.black,
                        )),
                    Text(
                      '알림',
                      style: TextStyle(
                        fontSize: width * 0.05,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ]),
            ),
            SliverPadding(
              padding: EdgeInsets.all(width * 0.02),
              sliver: SliverToBoxAdapter(
                  child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        TextButton(
                          onPressed: () {
                            showFirstScreen.value = true;
                          },
                          child: const Text(
                            '파티 초대',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.05,
                          child: const Center(
                            child: Text(
                              '/',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            showFirstScreen.value = false;
                          },
                          child: const Text(
                            '파티 신청',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    ValueListenableBuilder<bool>(
                      valueListenable: showFirstScreen,
                      builder: (context, value, child) {
                        return value
                            ? const FirstScreen()
                            : const SecondScreen();
                      },
                    ),
                    SizedBox(
                      height: height * 0.01,
                    ),
                  ],
                ),
              )),
            ),
          ],
        ),
      ),
    );
  }
}

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              const Text(
                '용인팟',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Card(
                      shadowColor: Colors.white,
                      elevation: 5,
                      clipBehavior: Clip.antiAlias,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // 원하는 둥글기
                          side:
                              const BorderSide(width: 1, color: Colors.black)),
                      child: SizedBox(
                        width: width * 0.15,
                        height: width * 0.15,
                        child: const Image(
                          image: AssetImage('images/profile.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    SizedBox(
                      width: width * 0.6,
                      child: const Text(
                        '홍준택을 사랑하는 모임에서 파티초대를 보냈습니다.',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // 버튼 배경색상
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // 버튼 모서리를 둥글게 만듦
                      ),
                    ),
                    child: SizedBox(
                      width: width * 0.35,
                      height: height * 0.02,
                      child: const Center(
                        child: Text(
                          '수락',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // 버튼 배경색상
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // 버튼 모서리를 둥글게 만듦
                      ),
                    ),
                    child: SizedBox(
                      width: width * 0.35,
                      height: height * 0.02,
                      child: const Center(
                        child: Text(
                          '거절',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Column(
            children: [
              SizedBox(height: height * 0.02),
              const Text(
                '풋살은 즐거워',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Row(
                  children: [
                    Card(
                      shadowColor: Colors.white,
                      elevation: 5,
                      clipBehavior: Clip.antiAlias,
                      shape: ContinuousRectangleBorder(
                          borderRadius: BorderRadius.circular(50), // 원하는 둥글기
                          side:
                              const BorderSide(width: 1, color: Colors.black)),
                      child: SizedBox(
                        width: width * 0.15,
                        height: width * 0.15,
                        child: const Image(
                          image: AssetImage(
                              '/Users/zzuntekk/time_Capsule-main/images/foot.png'),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: width * 0.05,
                    ),
                    SizedBox(
                      width: width * 0.6,
                      child: const Text(
                        '풋살은 즐거워에서 파티초대를 보냈습니다.',
                        style: TextStyle(
                          fontSize: 20,
                        ),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      width: width * 0.02,
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // 버튼 배경색상
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // 버튼 모서리를 둥글게 만듦
                      ),
                    ),
                    child: SizedBox(
                      width: width * 0.35,
                      height: height * 0.02,
                      child: const Center(
                        child: Text(
                          '수락',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black, // 버튼 배경색상
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(10.0), // 버튼 모서리를 둥글게 만듦
                      ),
                    ),
                    child: SizedBox(
                      width: width * 0.35,
                      height: height * 0.02,
                      child: const Center(
                        child: Text(
                          '거절',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

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
