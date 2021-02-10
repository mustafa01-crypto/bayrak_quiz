import 'package:bayrak_quiz/Bayraklar.dart';
import 'package:bayrak_quiz/VeritabaniYardimcisi.dart';

class BayraklarDao {

  Future<List<Bayraklar>> bayrakGetir() async {

    var db = await VeritabaniYardimcisi.veritabaniErisim();
    
    List<Map<String,dynamic>> maps =await db.rawQuery("SELECT * FROM bayraklar ORDER BY RANDOM() LIMIT 5");
    
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      
      return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);
      
    });
  }


  Future<List<Bayraklar>> yanlis3Getir(int bayrak_id) async {

    var db = await VeritabaniYardimcisi.veritabaniErisim();

    List<Map<String,dynamic>> maps =await db.rawQuery("SELECT * FROM bayraklar where bayrak_id !=$bayrak_id ORDER BY RANDOM() LIMIT 5");

    return List.generate(maps.length, (i) {
      var satir = maps[i];

      return Bayraklar(satir["bayrak_id"], satir["bayrak_ad"], satir["bayrak_resim"]);

    });
  }
}