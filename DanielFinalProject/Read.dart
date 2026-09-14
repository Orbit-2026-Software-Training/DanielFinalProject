import 'Joke.dart';
import 'dart:convert';
import 'dart:io';
class Read{
  Joke joke = new Joke();
  num TdiffN = 0;
  num TdiffM = 0;
  num diffN = 0;
  num diffM = 0;

  String text = "";
  List<dynamic> OGdata = [];
  List<Map<String, dynamic>> data = [];
  List<dynamic> values = [];
  List<dynamic> tempes = [];

  List<String> keys = [];

  Read(String fileToRead) {
    text = File(fileToRead).readAsStringSync();
    
    OGdata = jsonDecode(text);
    data = OGdata.cast<Map<String, dynamic>>();

    keys = data.expand((map) => map.keys).toList(); //sorting the Map to 2 Lists of Keys & Values
    values = data.expand((map) => map.values).toList();

    for(int i = 0; i < keys.length; i++) {
      if(keys.elementAt(i) != "time") {
        tempes.add(values.elementAt(i));
      }
    }
  }
    num highstNum(String fileToRead) {
        num biggestTemp = 0;  

        for(int y = 0; y < tempes.length; y++) {
            if(tempes.elementAt(y) > biggestTemp) {
                biggestTemp = tempes.elementAt(y);
            }
        }
        return biggestTemp;
    }
    num lowestNum(String fileToRead) {
        double lowestTemp = 10000.0;

        for(int y = 0; y < tempes.length; y++) {
            if(tempes.elementAt(y) < lowestTemp) {
                lowestTemp = tempes.elementAt(y);
            }
        }
        return(lowestTemp);
    }
    num avrege(String fileToRead){
        double overall = 0;
        double average = 0;

        for(int u = 0; u < tempes.length; u++) {
            overall += tempes.elementAt(u);
        }
        average = overall / tempes.length;
        return average;
    }
    num engineWork(String fileToRead) {
        int engineWorkedWell = 0;

        for(int u = 0; u < tempes.length; u++) {
            if(tempes.elementAt(u) > 25.0) {
              engineWorkedWell++;
            }
        }
        print("result:");
        return engineWorkedWell;

    }

    List sort(String fileToRead) {
        tempes.sort();
        return tempes;
    }

    (num, num) precentErorTempes() {
      num max = highstNum(r"DanielFinalProject\data.json");
      num min = lowestNum(r"DanielFinalProject\data.json");
      num avrg = avrege(r"DanielFinalProject\data.json");

      TdiffM = max - avrg;
      TdiffN = min - avrg;

      if(TdiffM < 0) {
        TdiffM = TdiffM / (0 - 1);
      }
      TdiffM = TdiffM / avrg * 100;

      if(TdiffM < 0) {
        TdiffN = TdiffN / (0 - 1);
      }
      TdiffN = TdiffN / avrg * 100;

      return (TdiffM, TdiffN);
    }
    
    Future<void> precentErorjokes() async {
      
      await joke.jokeAPI("https://v2.jokeapi.dev/joke/Miscellaneous,Pun");
      diffM = joke.longestJoke - joke.avregeJoke;
      diffN = joke.shortesdtJoke - joke.avregeJoke;

      if(diffM < 0) {
        diffM = diffM / (0 - 1);
      }
      diffM = diffM / joke.avregeJoke * 100;

      if(diffN < 0) {
        diffN = diffN / (0 - 1);
      }
      diffN = diffN / joke.avregeJoke * 100;

      print("$diffN $diffM");
    }

    biggestdiff() async {
      await precentErorjokes();
      await precentErorTempes();

      String who = "";
      num biggestdiff = 0;

      if(TdiffM > 0) {
        biggestdiff = TdiffM;
        who = "maxTemp";
      }

      if(TdiffN > 0) {
        biggestdiff = TdiffN;
        who = "minTemp";
      }

      if(diffN > 0) {
        biggestdiff = diffN;
        who = "minJoke";
      }

      if(diffM > 0) {
        biggestdiff = diffM;
        who = "maxJoke";
      }

      print(biggestdiff);
      print(who);
    }
}