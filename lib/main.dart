import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'home.dart';
//get 설치
void main() async {
  //앱 시작 부분
  runApp(const MyApp());
}
//시작 클래스
/*
화면을 그리는 모든 디자인 요소 : 위젯
material.dart 패키지 -> material 디자인 위젯 포함

 */
/*
my app : statelesswidget 을 상속받은,  stless클래스의 서브 클래스 : 상태를 가지지 않음 ( 한번 그려진 후
다시 그려지지 않음. 변화 x)

build method : stless 위젯 클래스 내에 있는 메소드
build 를 통해서 실제로 화면에 그릴 위젯을 반환해줌 .
 */
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /*
  getmaterial app -> title, theme, home
  title: 제목
  theme : 테마를지정 ( 기본적인 색지정 )
  파랑 계열의 색상 테마가 기본 설정
  home: 그려지는 위젯 구성
   */
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}