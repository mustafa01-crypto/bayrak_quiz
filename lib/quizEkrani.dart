import 'dart:collection';
import 'dart:ui';

import 'package:bayrak_quiz/Bayraklar.dart';
import 'package:bayrak_quiz/BayraklarDao.dart';
import 'package:bayrak_quiz/Sonuc.dart';
import 'package:flutter/material.dart';

class QuizEkrani extends StatefulWidget {


  @override
  _QuizEkraniState createState() => _QuizEkraniState();
}



class _QuizEkraniState extends State<QuizEkrani> {

  var sorular = List<Bayraklar>();
  var yanlisSecenekler= List<Bayraklar>();
  Bayraklar dogruSoru;
  var tumSecenekler =HashSet<Bayraklar>();

  int soruSayac =0;
  int dogruSayac =0;
  int yanlisSayac =0;

  String bayrakResimAdi = "placeholder.png";
  String  buttonA = "";
  String  buttonB = "";
  String  buttonC = "";
  String  buttonD = "";

  @override
  void initState() {
    super.initState();
    bayrakAl();
  }
  Future<void> bayrakAl() async{
    sorular = await BayraklarDao().bayrakGetir();
    yukle();
  }

  Future<void> yukle() async{

    dogruSoru = sorular[soruSayac];
    bayrakResimAdi = dogruSoru.bayrak_resim;

    yanlisSecenekler =await BayraklarDao().yanlis3Getir(dogruSoru.bayrak_id);

    tumSecenekler.clear();
    tumSecenekler.add(dogruSoru);
    tumSecenekler.add(yanlisSecenekler[0]);
    tumSecenekler.add(yanlisSecenekler[1]);
    tumSecenekler.add(yanlisSecenekler[2]);

    buttonA = tumSecenekler.elementAt(0).bayrak_ad;
    buttonB = tumSecenekler.elementAt(1).bayrak_ad;
    buttonC = tumSecenekler.elementAt(2).bayrak_ad;
    buttonD = tumSecenekler.elementAt(3).bayrak_ad;

    setState(() {
    });
  }

  void sayacKontrol() {

    soruSayac = soruSayac +1;
    if(soruSayac !=5){
      yukle();
    }else{

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Sonuc(dogru: dogruSayac,)));

    }
  }

  void dogruKontrol(String butonYazi) {
    if(dogruSoru.bayrak_ad == butonYazi){
      dogruSayac = dogruSayac +1;
    }else{
      yanlisSayac = yanlisSayac +1;
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz Ekranı"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Doğru : $dogruSayac",style: TextStyle(fontSize: 18),),
                Text("Yanlış : $yanlisSayac",style: TextStyle(fontSize: 18),),

              ],
            ),
            soruSayac !=5 ? Text("${soruSayac+1}. Soru:",style: TextStyle(fontSize: 30),) :
            Text("5. Soru:",style: TextStyle(fontSize: 30),),
            Image.asset("resimler/$bayrakResimAdi"),
            SizedBox(width: 250, height: 50,
              child: RaisedButton(
                child: Text(buttonA),
                onPressed: (){
                  dogruKontrol(buttonA);
                  sayacKontrol();
                },
              ),
            ),

            SizedBox(width: 250, height: 50,
              child: RaisedButton(
                child: Text(buttonB),
                onPressed: (){
                  dogruKontrol(buttonB);
                  sayacKontrol();
                },
              ),
            ),
            SizedBox(width: 250, height: 50,
              child: RaisedButton(
                child: Text(buttonC),
                onPressed: (){
                  dogruKontrol(buttonC);
                  sayacKontrol();
                },
              ),
            ),
            SizedBox(width: 250, height: 50,
              child: RaisedButton(
                child: Text(buttonD),
                onPressed: (){
                  dogruKontrol(buttonD);
                  sayacKontrol();
                },
              ),
            ),




          ],
        ),
      ),

    );
  }
}
