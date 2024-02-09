import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      home: QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Question> questions = [
    Question(
      text: '1.Minecraft เป็นเกมแนวอะไร',
      options: [
        'MMORPG',
        'Sport',
        'OpenWorld',
        'Fantasy',],
      answer: 'OpenWorld',),
    Question(
      text: '2.ในเกม Minecraft แร่อะไรหาขุดได้ง่ายที่สุด',
      options: [
        'Coal',
        'Copper',
        'Iron',
        'Diamond',],
      answer: 'Copper',),
    Question(
      text: '3.ในเกม Minecraft แร่อะไรหาขุดได้ยากที่สุด',
      options: [
        'Gold',
        'Diamond',
        'Netherite',
        'Emerald',],
      answer: 'Emerald',),
    Question(
      text: '4.Mob อะไรใน Minecraft ที่กลัวแมว',
      options: [
        'Zombie',
        'Creeper',
        'Skeleton',
        'Enderman',],
      answer: 'Creeper',),
    Question(
      text: '5.Mob อะไรใน Minecraft ที่กลัวหมา',
      options: [
        'Skeleton',
        'Wither Skeleton',
        'Sheep',
        'ทุกตัวที่กล่าว',],
      answer: 'ทุกตัวที่กล่าว',),
    Question(
      text: '6.Mob อะไรใน Minecraft ที่เลือดเยอะที่สุด',
      options: [
        'Warden',
        'Iron Golem',
        'Wither',
        'Ender Dragon',],
      answer: 'Warden',),
    Question(
      text: '7.ใน Minecraft บล็อก Obsidian ใช้เวลาขุดนานเท่าไหร่ (โดยใช้ Diamond Pickaxe)',
      options: [
        '9.4',
        '8.35',
        '10.1',
        '7.5',],
      answer: '9.4',),
    Question(
      text: '8.ใน Minecraft ในนี้มีอะไรต่างจากพวก',
      options: [
        'Bee',
        'Phantom',
        'Vex',
        'Ender Dragon',],
      answer: 'Bee',),
    Question(
      text: '9.ใน Minecraft จะมีการ Enchant แล้ว Enchant อะไรที่มีประโยชน์ที่สุด และใช้ได้ทุกอุปกรณ์',
      options: [
        'Infinity',
        'Sharpness',
        'Unbreaking',
        'Mending',],
      answer: 'Mending',),
    Question(
      text: '10.Villager ใน Minecraft ชอบพูดว่าอะไร',
      options: [
        'ห๊ออออ',
        'หื้ออออ',
        'ห้ออออ',
        'ถูกทุกข้อ!',],
      answer: 'ถูกทุกข้อ!',),
  ];

  int currentQuestionIndex = 0;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz App'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(questions[currentQuestionIndex].text),
            ...questions[currentQuestionIndex].options.map((answer) {
              return ListTile(
                title: Text(answer),
                onTap: () {
                  if (answer == questions[currentQuestionIndex].answer) {
                    score++;
                  }
                  setState(() {
                    if (currentQuestionIndex < questions.length - 1) {
                      currentQuestionIndex++;
                    } else {
                      // แสดงผลลัพธ์
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('ผลลัพธ์'),
                          content: Text('คุณได้คะแนน $score จาก ${questions.length} คะแนน'),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('ปิด'),
                            ),
                          ],
                        ),
                      );
                    }
                  });
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final String answer;

  Question({
    required this.text,
    required this.options,
    required this.answer,
  });
}