# Mail Clone coding

step1 : main, home, mailscreen

STEP 1 : 기본 UI 구성하기
학습목표 : 기본 UI를 만들면서 dart 언어의 기본 개념을 이해하고 사용법을 습득한다.
작성할 파일 : main.dart, home.dart, mail_screen.dart

main.dart 앱 빌드를 위한 기기기초 작업.

   import 'package:flutter/material.dart';
   import 'package:get/get_navigation/src/root/get_material_app.dart';
   import 'home.dart';

   void main() async {
        runApp(const MyApp());
   }

   class MyApp extends StatelessWidget {
     const MyApp({super.key});

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
home.dart (홈 화면 UI 제작)



위와 같이 구성하기 위해 우선 stle(stateless)로 class 하나 생성하고, Scaffold로 리턴합니다.

   class HomePage extends StatelessWidget {
     HomePage({Key? key}) : super(key: key);


     @override
     Widget build(BuildContext context) {
       return Scaffold(
         backgroundColor: Color(0xFFF2F2F6),
         body: Container(),
       );
     }
   }
그러고 나서 body 부분에서 Container() 대신에 다음 코드를 넣습니다.

SafeArea(
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(onPressed: (){

                    }, icon: Icon(CupertinoIcons.square_arrow_left ,size:20, color: Colors.blueAccent,)),
                    Text(
                      "편집",
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 15,

                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "메일상자",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    color: Colors.white,
                    child: Column(
                      children: [
                        _mainButton(CupertinoIcons.tray , "받은 편지함"),
                        Divider(indent: 50,color:Colors.grey),
                        _mainButton(CupertinoIcons.star, "VIP"),
                        Divider(indent: 50,color:Colors.grey),
                        _mainButton(CupertinoIcons.flag, "깃발 표시됨"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Gmail",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    color: Colors.white,
                    child: Column(
                      children: [
                        _mainButton(CupertinoIcons.doc, "임시 저장"),
                        Divider(indent: 50,color:Colors.grey),
                        _mainButton(CupertinoIcons.paperplane, "보낸 편지함"),
                        Divider(indent: 50,color:Colors.grey),
                        _mainButton(CupertinoIcons.bin_xmark, "정크"),
                        Divider(indent: 50,color:Colors.grey),
                        _mainButton(CupertinoIcons.delete, "휴지통"),
                        Divider(indent: 50,color:Colors.grey),
                        _mainButton(CupertinoIcons.archivebox, "모든 메일"),
                        Divider(indent: 50,color:Colors.grey),
                        _mainButton(CupertinoIcons.folder, "별표 편지함",)
                      ],
                    ),
                  ),
                ),
                // Text(
                //   "${snapshot.data.displayName}님 환영합니다.",
                //   style: TextStyle(fontSize: 20),
                // )
              ],
            ),
          ),
        ],
      ),
    ),
그러고 나면 아직 만들지 않아서 빨간 밑줄이 그인 _mainButton을 만듭니다. 아래 코드를 class 안에 추가해주세요. _mainButton처럼 반복해서 사용되는 버튼을 위젯화하게 되면, 코드를 더욱 간결하게 작성할 수 있습니다. :)

Widget _mainButton(IconData icon, String title) {
  return GestureDetector(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 0),
      child: Stack(alignment: AlignmentDirectional.centerStart, children: [
        Row(
          children: [
            Icon(
              icon,
              size: 20,
              color: Colors.blueAccent,
            ),
            SizedBox(
              width: 15,
            ),
            Text(
              title,
              style: TextStyle(fontSize: 15),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Icon(CupertinoIcons.chevron_right, size:15, color: Colors.grey,),
          ],
        ),
      ]),
    ),
    onTap: (){
      Get.to(MailScreen(title));
    },
  );
}
mail_screen.dart (메일 리스트를 보여주는 화면 제작)



위와 같은 간단한 화면 제작을 위해 다음 코드를 작성합니다. 이번엔 stful(stateful)을 사용하여 class를 하나 생성하고 이 역시 scaffold로 구조를 잡아줍니다.(scaffold 구조 설명)
** 여기서 짚고 넘어갈 점 하나, statefulWidget과 statlessWidget의 차이는 '초기에 그린 해당 화면을 다시 그려주느냐, 혹은 한 번 그리면 화면변화가 없이 유지시키느냐'다.






<img src="https://user-images.githubusercontent.com/82192923/177172499-5112cfd0-d1e0-4729-a9d6-1f0e27c7fdf7.png" width="20%"/>
아이폰 기본 어플인 Mail을 따라 만든 프로젝트입니다.<br><br>
        
### 기술 스택<br>
<img src="https://img.shields.io/badge/Android-3DDC84?style=flat-square&logo=Android&logoColor=white"/></a> 
<img src="https://img.shields.io/badge/Flutter-02569B?style=flat-square&logo=Flutter&logoColor=white"/></a>
<img src="https://img.shields.io/badge/Dart-0175C2?style=flat-square&logo=Dart&logoColor=white"/></a> 
<img src="https://img.shields.io/badge/Firebase-FFCA28?style=flat-square&logo=Firebase&logoColor=white"/></a> 

<br>

### 주요 구현점

- 기본 UI
- 구글 로그인, 로그아웃
- 파이어베이스 연동
- 메일 작성
- 메일 리스트
- 메일 상세보기
- 임시저장된 메일 수정
- 메일 삭제          
<br>

### 프로젝트 상세 설명 
[Notion](https://www.notion.so/Mail-2cae9f231f55447991a8263d4bbbde10?v=968be85eb5784818bb86bcb49a3df0ce)
<br>
<br>

### 프로젝트 기간

2022.06.28 ~ 2022.07.04
<br>
<br>

### 개발자    
이신원 : 22000539@handong.ac.kr    
서예경 : seeker0503@handong.ac.kr

궁금한 점이나 문의사항이 있으시면 위 메일로 연락 주세요. :)
(If there is any question or opinion, contact us through email.)
