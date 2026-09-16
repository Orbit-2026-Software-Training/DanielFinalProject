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

  final File file = File(r"DanielFinalProject\log");

  Read(String fileToRead) {
    file.writeAsStringSync('constructor called\n', mode: FileMode.append);

    text = File(fileToRead).readAsStringSync();
    file.writeAsStringSync('file found\n', mode: FileMode.append);

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
    num highestNum(String fileToRead) {
        file.writeAsStringSync('highest Num called \n', mode: FileMode.append);
        num biggestTemp = 0;

        file.writeAsStringSync('for loop inside highest Num called \n', mode: FileMode.append);
        for(int y = 0; y < tempes.length; y++) {
            if(tempes.elementAt(y) > biggestTemp) {
                biggestTemp = tempes.elementAt(y);
            }
        }
        file.writeAsStringSync('highest Num returnd \n', mode: FileMode.append);
        return biggestTemp;
    }
    num lowestNum(String fileToRead) {
        file.writeAsStringSync('highest Num called \n', mode: FileMode.append);
        double lowestTemp = 10000.0;

        file.writeAsStringSync('for loop inside lowest Num called \n', mode: FileMode.append);
        for(int y = 0; y < tempes.length; y++) {
            if(tempes.elementAt(y) < lowestTemp) {
                lowestTemp = tempes.elementAt(y);
            }
        }
        file.writeAsStringSync('lowest Num returnd \n', mode: FileMode.append);
        return(lowestTemp);
    }
    num avrege(String fileToRead) {
      file.writeAsStringSync('avrege called \n', mode: FileMode.append);
        double overall = 0;
        double average = 0;

        file.writeAsStringSync('for loop in avrege called \n', mode: FileMode.append);
        for(int u = 0; u < tempes.length; u++) {
            overall += tempes.elementAt(u);
        }
        average = overall / tempes.length;
        file.writeAsStringSync('avrege returnd \n', mode: FileMode.append);
        return average;
    }
    num engineWork(String fileToRead) {
        file.writeAsStringSync('engine called \n', mode: FileMode.append);
        int engineWorkedWell = 0;

        file.writeAsStringSync('for loop insidee engine called \n', mode: FileMode.append);
        for(int u = 0; u < tempes.length; u++) {
            if(tempes.elementAt(u) > 25.0) {
              engineWorkedWell++;
            }
        }
        print("result:");
        file.writeAsStringSync('engine returnd \n', mode: FileMode.append);
        return engineWorkedWell;

    }

    List sort(String fileToRead) {
        tempes.sort();
        return tempes;
    }

    (num, num) precentErrorTempes() {
      file.writeAsStringSync('precentErorTempes called \n', mode: FileMode.append);
      num max = highestNum(r"DanielFinalProject\data.json");
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

      file.writeAsStringSync('precentErorTempes returned \n', mode: FileMode.append);
      return (TdiffM, TdiffN);
    }
    
    Future<void> precentErrorjokes() async {
      await file.writeAsString('precentErorjokes called \n', mode: FileMode.append);
      
      await joke.jokeAPI("https://v2.jokeapi.dev/joke/Miscellaneous,Pun");
      await file.writeAsString("jokeAPI called \n", mode: FileMode.append);
      diffM = joke.longestJoke - joke.avregeJoke;
      diffN = joke.shortesdtJoke - joke.avregeJoke;
 
      await file.writeAsString("precentErorjokes starting if's \n", mode: FileMode.append);
      if(diffM < 0) {
        diffM = diffM / (0 - 1);
      }
      diffM = diffM / joke.avregeJoke * 100;
 
      if(diffN < 0) {
        diffN = diffN / (0 - 1);
      }
      diffN = diffN / joke.avregeJoke * 100;
 
      print("$diffN $diffM");
      await file.writeAsString("precentErorjokes returnd \n", mode: FileMode.append);
    }
 
    biggestdiff() async {
      await file.writeAsString("biggestdiff called \n", mode: FileMode.append);
      await precentErrorjokes();
      await precentErrorTempes();
 
      String who = "";
      num biggestdiff = 0;
 
      await file.writeAsString("biggestdiff if's starting \n", mode: FileMode.append);
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
      await file.writeAsString("biggestdiff returnd \n", mode: FileMode.append);
    }
    void cleanLogFile() {
      file.writeAsStringSync('');
    }
}