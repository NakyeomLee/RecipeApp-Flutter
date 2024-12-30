import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 스크롤이 가능해야하면 List 활용

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // 전체 앱을 위한 것
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // 실행창에 뜨는 디버그 표시 지우기
      home: RecipePage(),
      theme: ThemeData(
          textTheme: GoogleFonts.patuaOneTextTheme()), // 폰트를 어플에 전체 적용
    );
  }
}

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  // 페이지를 위한 것
  @override
  Widget build(BuildContext context) {
    // AppBar를 쓸 수 있는 이유
    return Scaffold(
      appBar: _appBar(), // _appBar 메서드
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        // 스크롤 가능하려면 ListView / ListView의 기본 정렬은 start (이 경우 Recipes 글자가 왼쪽 정렬돼있음)
        child: ListView(
          children: [
            Title(),
            Menu(),
            RecipeItem("coffee"),
            RecipeItem("pizza"),
            RecipeItem("burger"),
          ],
        ),
      ),
    );
  }

  // _appBar 메서드
  AppBar _appBar() {
    return AppBar(
      actions: [
        Icon(Icons.search),
        SizedBox(width: 16), // dart에서의 margin은 SizeBox, Padding은 Padding
        Icon(CupertinoIcons.heart, color: Colors.redAccent),
        SizedBox(width: 16)
      ],
    );
  }
}

// RecipeItem 메서드
class RecipeItem extends StatelessWidget {
  final text;

  RecipeItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      // 컬럼은 자동으로 중앙 정렬이니까 cross 이용해서 왼쪽 정렬(start)로 바꿈
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 30),
        AspectRatio(
          aspectRatio: 2 / 1,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              "assets/${text}.jpeg",
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(height: 10),
        Text("Made ${text}", style: TextStyle(fontSize: 20)),
        Text(
            "Have you ever made your own ${text}? Once you've tried a homemade ${text}, you'll never go back.",
            style: TextStyle(color: Colors.grey, fontSize: 12)),
      ],
    );
  }
}

// Menu 메서드
class Menu extends StatelessWidget {
  const Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // MenuItem 메서드
        MenuItem(mIcon: Icons.food_bank, mText: "ALL"),
        SizedBox(width: 25),
        MenuItem(mIcon: Icons.emoji_food_beverage, mText: "Coffee"),
        SizedBox(width: 25),
        MenuItem(mIcon: Icons.fastfood, mText: "Burger"),
        SizedBox(width: 25),
        MenuItem(mIcon: Icons.local_pizza, mText: "Pizza"),
      ],
    );
  }
}

// Title 메서드
class Title extends StatelessWidget {
  const Title({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Text(
        "Recipes",
        style: GoogleFonts.patuaOne(
            // 구글 폰트 중 patuaOne 폰트 적용 (라이브러리 새로 넣었기 때문에 앱 재실행)
            textStyle: TextStyle(fontSize: 30)),
      ),
    );
  }
}

// MenuItem 메서드
class MenuItem extends StatelessWidget {
  final mIcon;
  final mText;

  MenuItem(
      {required this.mIcon,
      required this.mText}); // 선택적 매개변수 활용 / reqired : 키워드가 있으면서 반드시 key값으로 받을 수 있도록 함

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        // 테두리 상하좌우 적용 / 테두리 색 지정
        borderRadius: BorderRadius.circular(30), // 테두리 둥글게
      ),
      // child는 하나만 된다는 의미지만 여러개를 두기 위해 Column 활용
      child: Column(
        // 요소를 해당 공간의 중앙에 정렬
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(mIcon, color: Colors.redAccent),
          SizedBox(height: 3),
          Text("${mText}", style: TextStyle(color: Colors.black87))
        ],
      ),
    );
  }
}
