import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../mail.dart';
import '../sendMail_modal.dart';
import '../../util/size.dart';
import 'mail_list.dart';

/*
* 여기서 짚고 넘어갈 점 하나, statefulWidget과 statlessWidget의 차이는
* '초기에 그린 해당 화면을 다시 그려주느냐, 혹은 한 번 그리면 화면변화가 없이 유지시키느냐'다.
 */

class MailScreen extends StatefulWidget {
  MailScreen(this.title, {Key? key}) : super(key: key);
  //생ㅇ성자 : key, title super - 부모클래스의 생성자에 key 전달
  String? title;
  //여기안에 대입

  //stful 한번만 실행되는 메서드 : createStet() - 메서드를 재정의
  @override
  State<MailScreen> createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
  //실제로 화면에 그려질 코드 작성
  User? loggedUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold( //앱바, 바디
      appBar: AppBar(  //stful에 접근 하기 위해서는 widget.title 사용해야 데이터를 전달할 수 있음.
        title: Text(widget.title.toString(),
            style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w600),),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,//전체 컬러 바꾸는것
        iconTheme: IconThemeData(
          color: Colors.black,//색변경
          size: 15,
        ),

      ),
      body: Container(
          child: Column(
            children: [
            ],
          )
      ),
      bottomNavigationBar:BottomAppBar(
        child: Row(
          children: [
            IconButton(onPressed: (){

            }, icon: Icon(CupertinoIcons.equal_circle, color: Colors.blueAccent,)),
            Spacer(),//공간만들어줌
            IconButton(onPressed: (){

            }, icon: Icon(CupertinoIcons.pencil_outline, color: Colors.blueAccent,)),
          ],
        ),
      ) ,
    );
  }
}