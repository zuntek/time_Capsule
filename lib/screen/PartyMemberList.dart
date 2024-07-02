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
      padding:
          EdgeInsets.symmetric(vertical: height * 0.1, horizontal: width * 0.1),
      child: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min, // 다이얼로그의 크기를 최소화하여 컨텐츠에 맞게 조절
            children: [
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
                          fontSize: width * 0.05,
                          color: Colors.black,
                        ),
                      ),
                    ],
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
