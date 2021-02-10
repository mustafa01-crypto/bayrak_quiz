import 'package:bayrak_quiz/quizEkrani.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {


  @override
  _AnaSayfaState createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anasayfa"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("QUİZE HOŞGELDİNİZ",style: TextStyle(fontSize: 30),),

            SizedBox(width: 250, height: 50,
              child: RaisedButton(
                child: Text("BAŞLA"),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=> QuizEkrani()));
                },
              ),
            ),


          ],
        ),
      ),

    );
  }
}
