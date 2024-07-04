import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_capsule/controller/PostController.dart';

class PartyMemberList extends StatelessWidget {
  PartyMemberList({super.key});
  PostController postController = Get.find<PostController>();

  // cid, pid 받아서 작동하는 부분 작성

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return Padding(
      padding: const EdgeInsets.symmetric(),
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            // 다이얼로그의 크기를 최소화하여 컨텐츠에 맞게 조절
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: width * 0.03),
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
                    '파티 신청 현황',
                    style: TextStyle(
                      fontSize: width * 0.05,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Card(
                    shadowColor: const Color.fromARGB(255, 147, 167, 242),
                    elevation: 3,
                    clipBehavior: Clip.antiAlias,
                    shape: const CircleBorder(
                      side: BorderSide(
                        width: 1,
                      ),
                    ),
                    child: SizedBox(
                      width: width * 0.08,
                      height: height * 0.08,
                      child: const Image(
                        image: AssetImage('images/profile.png'),
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'zzuntekk',
                        style: TextStyle(
                          fontSize: width * 0.03,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '홍준택',
                        style: TextStyle(
                          fontSize: width * 0.02,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  const Icon(
                    CupertinoIcons.person_solid,
                    color: Colors.yellow,
                  )
                ],
              ),
              Row(
                children: [
                  Card(
                    shadowColor: Colors.white,
                    elevation: 5,
                    clipBehavior: Clip.antiAlias,
                    shape: ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(50), // 원하는 둥글기
                        side: const BorderSide(width: 1, color: Colors.black)),
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
                  SizedBox(width: width * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'zzuntekk',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '홍준택',
                        style: TextStyle(
                          fontSize: width * 0.03,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Card(
                        shadowColor: Colors.white,
                        elevation: 5,
                        clipBehavior: Clip.antiAlias,
                        shape: ContinuousRectangleBorder(
                            borderRadius: BorderRadius.circular(50), // 원하는 둥글기
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
                      const Text(
                        'zuntek', // 예시 텍스트
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: width * 0.02),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.group,
                        color: Colors.amber,
                        size: width * 0.18,
                      ),
                      Text(
                        '파티장',
                        style: TextStyle(
                          fontSize: width * 0.06,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
