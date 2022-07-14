import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
// import 'package:mail/util/size.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'login.dart';
import 'mail/mail_list/mail_screen.dart';
import 'mail/sendMail_modal.dart';

/*
my app : statelesswidget 을 상속받은,  stless클래스의 서브 클래스 : 상태를 가지지 않음 ( 한번 그려진 후
다시 그려지지 않음. 변화 x)

build method : stless 위젯 클래스 내에 있는 메소드
build 를 통해서 실제로 화면에 그릴 위젯을 반환해줌 .
 */

//하나  : child, 여러개 : children
//https://velog.io/@sharveka_11/ClipRRect
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F6),
      body: SafeArea( // 휴대폰 크기마다 화면에 보여지는게 다른데 , 어떤건 작아서 글씨가 잘려서 보일수도 있음.
        //safearea 사용해주면  -ui가 안전하게 다 보여지도록 알아서 설정
        child: ListView( // 스크롤 가능 //
          children: [
            Padding( //위아래 옆 밑 다 패딩 전체에
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    // axis: 중심선 -> 어디서 부터 시작?
                    children: [
                      IconButton(
                          onPressed: () {

                          },
                          icon: Icon(
                            CupertinoIcons.square_arrow_left,
                            size: 20,
                            color: Colors.blueAccent,
                          ),),

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
                  ClipRRect( // 테두리가 있는 만들어주고싶은데, 끝이 둥글게 , circular -둥근
                    borderRadius: BorderRadius.circular(10),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      //EdgeInsets.symmetric(vertical: 8.0)
                      // symmetric은 대칭적인 이라는 의미로
                      // 수평(horizontal), 수직(vertical)을 기준으로 여백지정이 가능
                      //
                      // 수직(vertical) = 위,아래에 공통으로 여
                      //
                      // 수평(horizo백tal) = 왼쪽,오른쪽
                      color: Colors.white,
                      child: Column(
                        /*
    그러고 나면 아직 만들지 않아서 빨간 밑줄이 그인 _mainButton을 만듭니다.
    아래 코드를 class 안에 추가해주세요. _mainButton처럼 반복해서 사용되는 버튼을 위젯화하게 되면,
     코드를 더욱 간결하게 작성할 수 있습니다. :)
     */
                        children: [
                          _mainButton(CupertinoIcons.tray, "받은 편지함"),
                          Divider(indent: 50, color: Colors.grey),
                          _mainButton(CupertinoIcons.star, "VIP"),
                          Divider(indent: 50, color: Colors.grey),
                          _mainButton(CupertinoIcons.flag, "깃발 표시됨"),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    //끝에서 부터 시작 ( row - end )
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
                  ClipRRect( //윤곽을 동그랗게 보이도록 만듦
                    borderRadius: BorderRadius.circular(10), // 동글 정도
                    child: Container( //그 안에 다시 컨테이너로 감싸고
                      padding: EdgeInsets.symmetric(vertical: 8),
                      color: Colors.white,
                      child: Column(
                        children: [
                          _mainButton(CupertinoIcons.doc, "임시 저장"),
                          Divider(indent: 50, color: Colors.grey),
                          // indent 글자시작할떄 디바이더가 보이도록
                          _mainButton(
                              CupertinoIcons.paperplane, "보낸 편지함"),
                          Divider(indent: 50, color: Colors.grey),
                          _mainButton(CupertinoIcons.bin_xmark, "정크"),
                          Divider(indent: 50, color: Colors.grey),
                          _mainButton(CupertinoIcons.delete, "휴지통"),
                          Divider(indent: 50, color: Colors.grey),
                          _mainButton(
                              CupertinoIcons.archivebox, "모든 메일"),
                          Divider(indent: 50, color: Colors.grey),
                          _mainButton(
                            CupertinoIcons.folder,
                            "별표 편지함",
                          )
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
    );
  }

  Widget _mainButton(IconData icon, String title) {
    return GestureDetector( // 버튼 누르는것 감지 옵션 엔터
      child: Padding( //패딩값 다르게 넣어주기 위해서
        padding: const EdgeInsets.fromLTRB(15.0, 2.0, 15.0, 0),
        child: Stack(alignment: AlignmentDirectional.centerStart,
        children: [
          Row(//stack: 쌓은 순서대로
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
          Row(//끝 정렬
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(
                CupertinoIcons.chevron_right,
                size: 15,
                color: Colors.grey,
              ),
            ],
          ),
        ]),
      ),
      onTap: () { //gesture detector
        Get.to(MailScreen(title));//get - to 어디로 이동하겠ㄷ . 페이지 이름  .
      },
    );
  }
}

//사용자가 맘대로 위젯만들수 있음 .아이콘 등