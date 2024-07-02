import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart'; // DateFormat을 사용하기 위한 import

class JoinPage extends StatelessWidget {
  JoinPage({super.key});
  final TextEditingController _dateController =
      TextEditingController(); // _dateController 정의

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(width * 0.08),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'CapInNet',
                    style: TextStyle(
                        fontFamily: 'Kalam',
                        fontSize: width * 0.075,
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 53, 68, 80)),
                  ),
                  Text(
                    '회원가입을 환영합니다!',
                    style: TextStyle(
                        fontFamily: 'Kalam',
                        fontSize: width * 0.035,
                        fontWeight: FontWeight.bold,
                        color: Colors.black.withOpacity(0.5)),
                  ),
                  SizedBox(height: height * 0.05),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '이름',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(height: height * 0.05),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: SizedBox(
                              height: height * 0.08, // 텍스트 입력 필드의 높이 조정

                              child: const TextField(
                                decoration: InputDecoration(
                                  hintText: "닉네임",
                                  border: OutlineInputBorder(),
                                  contentPadding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  hintStyle: TextStyle(color: Colors.grey),
                                ),
                                maxLength: 20,
                                maxLines: 1, // 단일 라인 입력으로 변경
                              ),
                            ),
                          ),
                          SizedBox(width: width * 0.02),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.black,
                              padding: EdgeInsets.symmetric(
                                  horizontal: width * 0.03),
                            ),
                            child: const Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  '중복확인',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: height * 0.03),
                  TextFormField(
                    decoration: const InputDecoration(
                      labelText: '이메일',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: '비밀번호',
                      hintText: '영문,숫자,특수문자 조합으로 10자 이상',
                      border: OutlineInputBorder(),
                    ),
                    maxLength: 20,
                    minLines: 1,
                  ),
                  SizedBox(height: height * 0.02),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: '비밀번호 확인',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  _buildDateOfBirthField(context), // BuildContext 전달
                  SizedBox(height: height * 0.02),
                  _buildPhoneNumberField(),
                  SizedBox(height: height * 0.02),
                  SizedBox(
                    width: width * 0.8,
                    height: height * 0.06,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black, // 배경색 검은색
                      ),
                      onPressed: () {},
                      child: const Text(
                        '가입하기',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDateOfBirthField(BuildContext context) {
    return InkWell(
      onTap: () {
        _selectDate(context);
      },
      child: const InputDecorator(
        decoration: InputDecoration(
          labelText: '생년월일',
          border: OutlineInputBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('YYYY-MM-DD'),
            Icon(Icons.calendar_today),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      final formattedDate = DateFormat('yyyy-MM-dd').format(picked);
      _dateController.text = formattedDate;
    }
  }

  Widget _buildPhoneNumberField() {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: '연락처',
        border: OutlineInputBorder(),
        hintText: '010-1234-5678',
      ),
      keyboardType: TextInputType.phone,
    );
  }
}
