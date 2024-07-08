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
                  IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        CupertinoIcons.xmark,
                        size: width * 0.075,
                        color: Colors.black,
                      )),
                  Text(
                    '파티 멤버:5',
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
                  SizedBox(width: width * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'zzunktekk',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '파티장',
                            style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: width * 0.05),
                  Icon(
                    CupertinoIcons.person_solid,
                    color: Colors.yellow,
                    size: width * 0.05,
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
                            '/Users/zzuntekk/time_Capsule-main/images/basketball.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: width * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'handue',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '파티원',
                            style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: width * 0.05),
                  Icon(
                    CupertinoIcons.person_2,
                    color: Colors.black,
                    size: width * 0.05,
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
                  SizedBox(width: width * 0.05),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'insu_1004',
                        style: TextStyle(
                          fontSize: width * 0.05,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '파티원',
                            style: TextStyle(
                              fontSize: width * 0.04,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: width * 0.05),
                  Icon(
                    CupertinoIcons.person_2,
                    color: Colors.black,
                    size: width * 0.05,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
