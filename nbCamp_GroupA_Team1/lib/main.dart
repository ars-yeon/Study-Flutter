import 'package:a_bar/gjPage.dart';
import 'package:a_bar/jhPage.dart';
import 'package:a_bar/jjPage.dart';
import 'package:a_bar/msPage.dart';
import 'package:a_bar/syPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(), // 홈페이지 보여주기
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 음식 사진 데이터
    List<Map<String, dynamic>> dataList = [
      {
        "name": "추민수",
        "imgUrl":
            "https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_1280.jpg",
        "age": "24"
      },
      {
        "name": "송규진",
        "imgUrl":
            "https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_1280.jpg",
        "age": "2살"
      },
      {
        "name": "이소연",
        "imgUrl":
            "https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_1280.jpg",
        "age": "2살"
      },
      {
        "name": "안주환",
        "imgUrl":
            "https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_1280.jpg",
        "age": "2살"
      },
      {
        "name": "황진주",
        "imgUrl":
            "https://cdn.pixabay.com/photo/2014/04/13/20/49/cat-323262_1280.jpg",
        "age": "2살"
      },
    ];

    // 화면에 보이는 영역
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network('https://ifh.cc/g/gSmpQo.png'),
            ),
            SizedBox(height: 5),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return RadialGradient(
                  center: Alignment.center,
                  radius: 1.0,
                  colors: [
                    Colors.yellow,
                    Colors.orange,
                  ], // Adjust the gradient colors as desired
                  tileMode: TileMode.mirror,
                ).createShader(bounds);
              },
              child: Text(
                "'A' BAR",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Text(
                  //   "소개",
                  //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  // ),
                  // Container(
                  //   width: double.infinity,
                  //   height: 180,
                  //   decoration: BoxDecoration(
                  //     color: Colors.grey,
                  //     borderRadius: BorderRadius.circular(
                  //         10.0), // Adjust the value to control the roundness
                  //   ),
                  // ),
                  Column(
                    children: [
                      Text("소개"),
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 120,
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          Text(
                            "저희 ‘A’ BAR은 각자의 특별한 기술로 고객들에게 \n즐거움을 선사하는 바텐더들의 이야기를 담고 있습니다.",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //가로로 두 개의 Gridview를 보여줌
                    childAspectRatio: 4 / 5, //gridView의 높이 조절
                  ),
                  itemCount: dataList.length,
                  itemBuilder: (context, index) {
                    var blog = dataList[index];
                    String imgUrl = blog['imgUrl']!; // datalist의 url
                    String name = blog['name']!; //datalist의 name
                    String age = blog['age']!;

                    return Container(
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            blurRadius: 3,
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            imgUrl,
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.width *
                                0.5 *
                                5 /
                                3 *
                                0.55,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      //이름
                                      name,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(age),
                                  ],
                                ),
                                Spacer(),
                                IconButton(
                                    onPressed: () {
                                      if (name == "추민수") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => MsPage()),
                                        );
                                      } else if (name == "송규진") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => gjPage()),
                                        );
                                      } else if (name == "이소연") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => syPage()),
                                        );
                                      } else if (name == "안주환") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => jhPage()),
                                        );
                                      } else if (name == "황진주") {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (_) => jjPage()),
                                        );
                                      }
                                    },
                                    icon: Icon(Icons.arrow_forward_ios)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
