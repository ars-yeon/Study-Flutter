import 'package:a_bar/bartender_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class syPage extends StatelessWidget {
  final TextEditingController NameController = TextEditingController();
  final TextEditingController AgeController = TextEditingController();
  final TextEditingController MBTIController = TextEditingController();
  final TextEditingController ADController = TextEditingController();
  final TextEditingController BlogController = TextEditingController();
  final TextEditingController Controller = TextEditingController();
  final TextEditingController StyleController = TextEditingController();

  syPage(
      {super.key,
      required this.index,
      required this.isCreat}); // : super(key: key); // 수정된 부분
  final int index;
  final bool isCreat;
  @override
  Widget build(BuildContext context) {
    BartenderService bartenderService = context.read<BartenderService>();
    Bartender bartenderProfile = bartenderService.btList[index];
    NameController.text = bartenderProfile.btName;
    AgeController.text = bartenderProfile.btAge;
    MBTIController.text = bartenderProfile.btMbti;
    ADController.text = bartenderProfile.btAdvantage;
    BlogController.text = bartenderProfile.btBlog;
    StyleController.text = bartenderProfile.btStyle;
    final FocusNode textFocusNode = FocusNode(); // FocusNode 생성

    final String changeText;
    isCreat ? changeText = 'Add Profile' : changeText = 'Update Profile';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black,
        title: Text(
          changeText,
          style: TextStyle(
            fontFamily: 'abar',
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        leading: IconButton(
            onPressed: () {
              if (isCreat == true) {
                bartenderService.removeItem(index: index);
                Navigator.of(context).pop();
              } else {
                Navigator.of(context).pop();
              }
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              children: [
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'abar',
                  ),
                  controller: NameController,
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next, // Keyboard Enter키 속성
                  maxLines: null,
                  decoration: InputDecoration(
                    label: Text(
                      'Name',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'abar',
                      ),
                    ),
                    hintText: 'Enter Your Name',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'abar',
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.white // Text Field 언더바색상
                              ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber, // Text Field 포커스 잡혔을때 테두리 색상
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10), // 위아래 텍스트 필드 겹침 방지
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'abar',
                  ),
                  controller: AgeController,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly
                  ], // 입력 제한 - 숫자만 입력 가능
                  keyboardType: TextInputType.number, // 키패드 - 숫자만 뜨게 설정
                  textInputAction: TextInputAction.next,
                  maxLines: null,
                  decoration: InputDecoration(
                    label: Text(
                      'Age',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'abar',
                      ),
                    ),
                    hintText: 'Enter Your Age',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'abar',
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.white // Text Field 언더바색상
                              ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber, // Text Field 포커스 잡혔을때 테두리 색상
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10), // 위아래 텍스트 필드 겹침 방지
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'abar',
                  ),
                  controller: MBTIController,
                  inputFormatters: [
                    FilteringTextInputFormatter(RegExp('[A-Z]'), allow: true),
                  ],
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  maxLines: null,
                  decoration: InputDecoration(
                    label: Text(
                      'MBTI',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'abar',
                      ),
                    ),
                    hintText: 'Enter Your MBTI (ex. ESTJ)',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'abar',
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.white // Text Field 언더바색상
                              ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber, // Text Field 포커스 잡혔을때 테두리 색상
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10), // 위아래 텍스트 필드 겹침 방지
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'abar',
                  ),
                  controller: BlogController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  maxLines: null,
                  decoration: InputDecoration(
                    label: Text(
                      'Git/Blog',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'abar',
                      ),
                    ),
                    hintText: 'Enter Your Git/Blog',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'abar',
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.white // Text Field 언더바색상
                              ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber, // Text Field 포커스 잡혔을때 테두리 색상
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10), // 위아래 텍스트 필드 겹침 방지
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'abar',
                  ),
                  controller: ADController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  maxLines: null,
                  decoration: InputDecoration(
                    label: Text(
                      'Advantage',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'abar',
                      ),
                    ),
                    hintText: 'Enter Your Advantage',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'abar',
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.white // Text Field 언더바색상
                              ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber, // Text Field 포커스 잡혔을때 테두리 색상
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10), // 위아래 텍스트 필드 겹침 방지
                TextField(
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'abar',
                  ),
                  controller: StyleController,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  maxLines: null,
                  decoration: InputDecoration(
                    label: Text(
                      'Collaboration Style',
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'abar',
                      ),
                    ),
                    hintText: 'Enter Your Collaboration Style',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontFamily: 'abar',
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.white // Text Field 언더바색상
                              ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.amber, // Text Field 포커스 잡혔을때 테두리 색상
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    //final formKeyState = formKey.currentState!;
                    if (NameController.text.isEmpty ||
                        AgeController.text.isEmpty ||
                        MBTIController.text.isEmpty ||
                        ADController.text.isEmpty ||
                        BlogController.text.isEmpty ||
                        StyleController.text.isEmpty) {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('빈칸이 존재합니다!'),
                            content: Text('빈칸을 채워주세요!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      bartenderService.updateItem(
                          index: index,
                          btName: NameController.text,
                          btMbti: MBTIController.text,
                          btAge: AgeController.text,
                          btAdvantage: ADController.text,
                          btBlog: BlogController.text,
                          btStyle: StyleController.text);
                      Navigator.of(context).pop();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                  ),
                  child: const Text(
                    'Submit',
                    style: TextStyle(
                      fontFamily: 'abar',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
