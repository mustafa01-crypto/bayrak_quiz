import 'package:flutter/material.dart';

class Sonuc extends StatefulWidget {
  int dogru;


  Sonuc({this.dogru});

  @override
  _SonucState createState() => _SonucState();
}

class _SonucState extends State<Sonuc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sonuç"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("${widget.dogru} DOĞRU, ${5-widget.dogru} YANLIŞ",style: TextStyle(fontSize: 18),),
            Text("%${(widget.dogru*100/5).toInt()} BAŞARI",style: TextStyle(fontSize: 18,color: Colors.pink)),
            SizedBox(width: 250, height: 50,
              child: RaisedButton(
                child: Text("TEKRAR DENE"),
                onPressed: (){
                  Navigator.pop(context);

                },
              ),
            ),


          ],
        ),
      ),

    );
  }
}
