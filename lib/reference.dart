import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipePage(),
      theme: ThemeData(
        textTheme: GoogleFonts.patuaOneTextTheme(),
      ),
    );
  }
}

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appbar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
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

  AppBar _appbar() {
    return AppBar(
      actions: [
        Icon(Icons.search),
        SizedBox(width: 16),
        Icon(CupertinoIcons.heart, color: Colors.redAccent),
        SizedBox(width: 16),
      ],
    );
  }
}

class RecipeItem extends StatelessWidget {
  final text;

  RecipeItem(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          style: TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}

class Menu extends StatelessWidget {
  const Menu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MenuItem(mIcon: Icons.food_bank, mText: "ALL"),
        SizedBox(width: 25),
        MenuItem(mIcon: Icons.emoji_food_beverage, mText: "Coffe"),
        SizedBox(width: 25),
        MenuItem(mIcon: Icons.fastfood, mText: "Burger"),
        SizedBox(width: 25),
        MenuItem(mIcon: Icons.local_pizza, mText: "Pizza"),
      ],
    );
  }
}

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
        style: TextStyle(fontSize: 30),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final mIcon;
  final mText;

  MenuItem({required this.mIcon, required this.mText});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 80,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(mIcon, color: Colors.redAccent, size: 30),
          SizedBox(height: 3),
          Text("${mText}", style: TextStyle(color: Colors.black87))
        ],
      ),
    );
  }
}
