import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:provider/provider.dart';

import 'Utill/colorList.dart';
import 'bartender_service.dart';

void main() {
  runApp(bartenderPage());
}

class bartenderPage extends StatefulWidget {
  const bartenderPage({Key? key, this.index}) : super(key: key);

  @override
  State<bartenderPage> createState() => _bartenderPage();
  final index;
}

class _bartenderPage extends State<bartenderPage> {
  TextEditingController contentController = TextEditingController();
  double rating = 0; // 초기 별점 값 설정
  bool CommentCompleted = false; // 작성 완료 상태 여부
  final FocusNode textFocusNode = FocusNode(); // FocusNode 생성
  List<Review> reviews = []; // 리뷰 리스트 선언

  @override
  void dispose() {
    textFocusNode.dispose(); // 메모리 누수를 방지하기 위해 FocusNode 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    BartenderService bartenderService = context.read<BartenderService>();
    Bartender bartenderPage = bartenderService.btList[widget.index];
    String Name = bartenderPage.btName;
    String Age = bartenderPage.btAge;
    String Mbti = bartenderPage.btMbti;
    String Advantage = bartenderPage.btAdvantage;
    String Blog = bartenderPage.btBlog;
    String Colstyle = bartenderPage.btStyle;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GestureDetector(
        onTap: () {
          textFocusNode.unfocus();
        },
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              }, // 현재 화면을 닫고 이전 화면으로 돌아감
              icon: Icon(Icons.arrow_back),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  width: double.infinity,
                  height: 300,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              Colors.black,
                            ],
                            stops: [0.8, 1.0], //하단 그라데이션범위지정
                          ).createShader(bounds);
                        },
                        blendMode: BlendMode.srcATop,
                        child: ShaderMask(
                          shaderCallback: (Rect bounds) {
                            return LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.transparent,
                                Colors.black,
                              ],
                              stops: [0.8, 1.0], //상단 그라데이션 범위지정
                            ).createShader(bounds);
                          },
                          blendMode: BlendMode.srcATop,
                          child: Image.network(
                            'https://i.pinimg.com/564x/83/02/3a/83023a439b482e862d1c3e22c8bc7711.jpg',
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ), //그라데이션 끝
                      Positioned(
                        //시작
                        top: 2.0,
                        left: 10.0,
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'WHO',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 60,
                                    fontWeight: FontWeight.w900),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                '                     MADE',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                              Text(
                                '                THIS',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 40,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'COCKTAIL?',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 197, 32, 32)
                                        .withOpacity(0.5),
                                    fontSize: 50,
                                    fontWeight: FontWeight.w900),
                              ),
                            ],
                          ),
                        ),
                      ), //끝
                      Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          margin: EdgeInsets.all(20.0), // 원하는 margin 값을 설정합니다.
                          width: 100,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            border: Border.all(
                              color:
                                  Colors.white, // Set the desired border color
                              width: 2.0, // Set the desired border width
                            ),
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the border radius as desired
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.network(
                              "https://softychoo.github.io/assets/img/blog/cocktails8.png",
                              fit: BoxFit.fitHeight,
                              height: MediaQuery.of(context).size.height * 0.15,
                            ),
                          ),
                        ),
                      ) //칵테일이미지박스
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.black,
                  height: 200,
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: SizedBox(
                          child: Text(
                            '- INTRODUCTION -',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'NAME : ',
                                style: TextStyle(
                                  fontFamily: "name",
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // 이름 올라올 부분
                              child: Text(
                                Name,
                                style: TextStyle(
                                    fontFamily: "abar",
                                    color: ColorList().gold,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'MBTI : ',
                                style: TextStyle(
                                  fontFamily: "name",
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // mbti 올라올 부분
                              child: Text(
                                Mbti,
                                style: TextStyle(
                                    fontFamily: "abar",
                                    color: ColorList().gold,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'AGE : ',
                                style: TextStyle(
                                  fontFamily: "name",
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // age 올라올 부분
                              child: Text(
                                Age,
                                style: TextStyle(
                                    fontFamily: "abar",
                                    color: ColorList().gold,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'GITHUB/BLOG : ',
                                style: TextStyle(
                                  fontFamily: "name",
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // github 올라올 부분
                              child: Text(
                                Blog,
                                style: TextStyle(
                                    fontFamily: "abar",
                                    color: ColorList().gold,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Advantage : ',
                                style: TextStyle(
                                  fontFamily: "name",
                                  color: Colors.grey,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // blog 올라올 부분
                              child: Text(
                                Advantage,
                                style: TextStyle(
                                    fontFamily: "abar",
                                    color: ColorList().gold,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 150,
                            height: 30,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                'Collaboration Style : ',
                                style: TextStyle(
                                  fontFamily: "name",
                                  color: Colors.grey,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              // blog 올라올 부분
                              child: Text(
                                Colstyle,
                                style: TextStyle(
                                    fontFamily: "abar",
                                    color: ColorList().gold,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  color: Colors.black,
                  child: SingleChildScrollView(
                    child: Container(
                      height: MediaQuery.of(context).size.height *
                          0.4, //comment의 위치
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView.builder(
                              itemCount: reviews.length,
                              itemBuilder: (context, index) {
                                final review = reviews[index];
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      border: Border.all(
                                        color: Colors
                                            .white, // Set the desired border color
                                        width:
                                            2.0, // Set the desired border width
                                      ),
                                      borderRadius: BorderRadius.circular(
                                          10.0), // Adjust the border radius as desired
                                    ),
                                    child: ListTile(
                                      title: Row(
                                        children: [
                                          Text(
                                            '별점: ${review.rating}',
                                            style:
                                                TextStyle(color: Colors.white),
                                          ),
                                        ],
                                      ),
                                      subtitle: Text(
                                        '댓글: ${review.comment}',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      trailing: IconButton(
                                        icon: Icon(
                                          Icons.delete,
                                          color: Colors.amber[500],
                                        ),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: Text('삭제하시겠습니까?'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        reviews.removeAt(index);
                                                      });
                                                      Navigator.of(context)
                                                          .pop(); // Close the dialog
                                                    },
                                                    child: Text(
                                                      '삭제',
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    ),
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop(); // Close the dialog
                                                    },
                                                    child: Text('취소'),
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          RatingBar.builder(
                            initialRating: rating,
                            minRating: 0,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemSize: 30.0,
                            itemBuilder: (context, _) => Icon(
                              Icons.wine_bar,
                              color: Colors.amber[500],
                            ),
                            unratedColor: Colors.grey,
                            onRatingUpdate: (newRating) {
                              setState(() {
                                rating = newRating;
                              });
                              print(rating);
                            },
                          ),
                          TextField(
                            controller: contentController,
                            style: TextStyle(color: Colors.white),
                            focusNode: textFocusNode,
                            scrollPhysics: NeverScrollableScrollPhysics(),
                            maxLines: 3,
                            maxLength: 100, //글자 수 제한
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromARGB(255, 46, 45, 45),
                              hintText: '평가를 남겨주세요',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w500,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              counterStyle: TextStyle(
                                  color: Colors.grey), // 글자 수 색상을 변경합니다.
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(
                                () {
                                  if (contentController.text.isEmpty) {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('빈칸이 존재합니다!'),
                                          content: Text('평가를 남겨주세요!'),
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
                                    CommentCompleted = true;
                                    final newReview = Review(
                                      rating: rating,
                                      comment: contentController.text,
                                    );
                                    reviews.add(newReview);
                                    contentController.clear();
                                  }
                                },
                              );
                              textFocusNode.unfocus();
                            },
                            style: ElevatedButton.styleFrom(
                              primary: Colors.amber,
                            ),
                            child: Text(
                              'Check',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Review {
  final double rating;
  final String comment;

  Review({
    required this.rating,
    required this.comment,
  });
}
