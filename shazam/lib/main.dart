import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shazam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Builder(builder: (context) {
        DefaultTabController.of(context).addListener(() {
          setState(() {});
        });

        return Scaffold(
          body: Stack(
            children: [
              TabBarView(
                children: [
                  FirstTab(),
                  SecondTab(),
                  ThirdTab(),
                ],
              ),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        child: TabPageSelector(
                          color: DefaultTabController.of(context).index == 1
                              ? Colors.blue[300]
                              : Colors.grey[400],
                          selectedColor:
                              DefaultTabController.of(context).index == 1
                                  ? Colors.white
                                  : Colors.blue,
                          indicatorSize: 8,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

// 첫번째 페이지
class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const songs = [
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
      {
        'imageUrl': 'https://i.ytimg.com/vi/jAO0KXRdz_4/hqdefault.jpg',
        'title': '가을밤에 든 생각',
        'artist': '잔나비',
      },
    ];

    return SafeArea(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Icon(Icons.settings),
              ),
              Text(
                "라이브러리",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(null),
            ],
          ),
          //Shazam
          SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                ImageIcon(
                  NetworkImage("https://i.ibb.co/hxNbZ8p/shazam.png"),
                  size: 18,
                ),
                SizedBox(width: 12),
                Text(
                  "Shazam",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          // 아티스트
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Icon(
                  Icons.person,
                  size: 18,
                ),
                SizedBox(width: 12),
                Text(
                  "아티스트",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          // 회원님을 위한 재생목록
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Row(
              children: [
                Icon(
                  Icons.music_note,
                  size: 18,
                ),
                SizedBox(width: 12),
                Text(
                  "회원님을 위한 재생목록",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 16),
          Text(
            "최근 Shazam",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 16),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 5,
              ),
              itemCount: songs.length,
              itemBuilder: (context, index) {
                var song = songs[index];
                String title = song['title']!;
                String artist = song['artist']!;
                String imageUrl = song['imageUrl']!;

                return Container(
                  margin: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        blurRadius: 1,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        child: Image.network(
                          imageUrl,
                          fit: BoxFit.cover,
                          height: MediaQuery.of(context).size.width *
                              0.5 *
                              5 /
                              3 *
                              0.55,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: SizedBox(
                            width: double.infinity,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  artist,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                Spacer(),
                                Image.network(
                                  "https://i.ibb.co/KG9m5QS/applemusic.png",
                                  width: 60,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}

// 두번째 페이지
class SecondTab extends StatelessWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Colors.blue[300]!, Colors.blue[900]!],
        ),
      ),
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      DefaultTabController.of(context).animateTo(0);
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        Text(
                          "라이브러리",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () {
                      DefaultTabController.of(context).animateTo(2);
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.show_chart,
                          color: Colors.white,
                        ),
                        Text(
                          "차트",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Text(
              "shazam하려면 탭하세요.",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Container(
              alignment: Alignment.center,
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blue[300],
                shape: BoxShape.circle,
              ),
              child: Image.network(
                "https://i.ibb.co/hxNbZ8p/shazam.png",
                color: Colors.white,
                width: 130,
                height: 130,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.12),
            Container(
              alignment: Alignment.center,
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.blue[300],
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.search,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// 세번째 페이지
class ThirdTab extends StatelessWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const chartData = {
      'korea': [
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
      ],
      'global': [
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
      ],
      'newyork': [
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
        {
          'imageUrl': 'https://i.ibb.co/xf2HpfG/dynamite.jpg',
          'name': 'Dynamite',
          'artist': 'BTS',
        },
      ],
    };

    return SafeArea(
      child: Column(
        children: [
          Text(
            "차트",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView(
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      color: Colors.purple[900],
                      height: 180,
                      width: double.infinity,
                    ),
                    Column(
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                            child: Text(
                              "국가 및 도시별 차트",
                              style: TextStyle(
                                  color: Colors.purple[900],
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "전세계",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                // 대한민국 차트
                Container(
                  width: double.infinity,
                  height: 8,
                  color: Colors.grey[400],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "대한민국 차트",
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      Text(
                        "모두보기",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: chartData['korea']!.map((element) {
                    String imageUrl = element['imageUrl']!;
                    String name = element['name']!;
                    String artist = element['artist']!;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            imageUrl,
                            width: MediaQuery.of(context).size.width * 0.29,
                          ),
                          Text(
                            name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(artist),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                // 글로벌 차트
                Container(
                  width: double.infinity,
                  height: 8,
                  color: Colors.grey[400],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "글로벌 차트",
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      Text(
                        "모두보기",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: chartData['global']!.map((element) {
                    String imageUrl = element['imageUrl']!;
                    String name = element['name']!;
                    String artist = element['artist']!;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            imageUrl,
                            width: MediaQuery.of(context).size.width * 0.29,
                          ),
                          Text(
                            name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(artist),
                        ],
                      ),
                    );
                  }).toList(),
                ),
                // 뉴욕 차트
                Container(
                  width: double.infinity,
                  height: 8,
                  color: Colors.grey[400],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        "뉴욕 차트",
                        style: TextStyle(fontSize: 16),
                      ),
                      Spacer(),
                      Text(
                        "모두보기",
                        style: TextStyle(color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: chartData['newyork']!.map((element) {
                    String imageUrl = element['imageUrl']!;
                    String name = element['name']!;
                    String artist = element['artist']!;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.network(
                            imageUrl,
                            width: MediaQuery.of(context).size.width * 0.29,
                          ),
                          Text(
                            name,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(artist),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
