import 'Joke.dart';
import 'dart:convert';
import 'dart:io';
class Read{
  Joke joke = new Joke();
  num TdiffN = 0;
  num TdiffM = 0;
  num diffN = 0;
  num diffM = 0;

    num highstNum(String fileToRead) {
        String text = File(fileToRead).readAsStringSync();

        List<dynamic> OGdata = jsonDecode(text);
        List<Map<String, dynamic>> data = OGdata.cast<Map<String, dynamic>>();
        num biggestTemp = 0;  

        List<String> keys = data.expand((map) => map.keys).toList(); //sorting the Map to 2 Lists of Keys & Values
        List<dynamic> values = data.expand((map) => map.values).toList();
        List<dynamic> tempes = []; 

        for(int i = 0; i < keys.length; i++) {
            if(keys.elementAt(i) != "time") {
                    tempes.add(values.elementAt(i));
            }
        }


        for(int y = 0; y < tempes.length; y++) {
            if(tempes.elementAt(y) > biggestTemp) {
                biggestTemp = tempes.elementAt(y);
            }
        }
        print(biggestTemp);
        return biggestTemp;
    }
    num lowestNum(String fileToRead) {
        String text = File(fileToRead).readAsStringSync();

        List<dynamic> OGdata = jsonDecode(text);
        List<Map<String, dynamic>> data = OGdata.cast<Map<String, dynamic>>();
        double lowestTemp = 10000.0; 

        List<String> keys = data.expand((map) => map.keys).toList(); 
        List<dynamic> values = data.expand((map) => map.values).toList();
        List<dynamic> tempes = []; 
        for(int i = 0; i < keys.length; i++) {
            if(keys.elementAt(i) != "time") {
               if(values.elementAt(i) % 1 == 0) {
                    tempes.add(values.elementAt(i));
                } else {
                  tempes.add(values.elementAt(i));
                }
            }
        }


        for(int y = 0; y < tempes.length; y++) {
            if(tempes.elementAt(y) < lowestTemp) {
                lowestTemp = tempes.elementAt(y);
            }
        }

        return(lowestTemp);
    }
    num avrege(String fileToRead){
        String text = File(fileToRead).readAsStringSync();

        List<dynamic> OGdata = jsonDecode(text);
        List<Map<String, dynamic>> data = OGdata.cast<Map<String, dynamic>>();
        double overall = 0;

        List<String> keys = data.expand((map) => map.keys).toList(); 
        List<dynamic> values = data.expand((map) => map.values).toList();
        List<dynamic> tempes = []; 
        double average = 0;

        for(int i = 0; i < keys.length; i++) {
            if(keys.elementAt(i) != "time") {
                    tempes.add(values.elementAt(i));
            }
        }

        for(int u = 0; u < tempes.length; u++) {
            overall += tempes.elementAt(u);
        }
        average = overall / tempes.length;
        return average;
    }
    num engineWork(String fileToRead) {
      String text = File(fileToRead).readAsStringSync();

        List<dynamic> OGdata = jsonDecode(text);
        List<Map<String, dynamic>> data = OGdata.cast<Map<String, dynamic>>();

        List<String> keys = data.expand((map) => map.keys).toList(); 
        List<dynamic> values = data.expand((map) => map.values).toList();
        List<dynamic> tempes = []; 
        int engineWorkedWell = 0;

        for(int i = 0; i < keys.length; i++) {
            if(keys.elementAt(i) != "time") {
              tempes.add(values.elementAt(i));
            }
        }

        for(int u = 0; u < tempes.length; u++) {
            if(tempes.elementAt(u) > 25.0) {
              engineWorkedWell++;
            }
        }
        print("result:");
        return engineWorkedWell;


    }

    List sort(String fileToRead) {
      final String text = File(fileToRead).readAsStringSync();

        final List<dynamic> OGdata = jsonDecode(text);
        final List<Map<String, dynamic>> data = OGdata.cast<Map<String, dynamic>>();

        final List<String> keys = data.expand((map) => map.keys).toList(); 
        final List<dynamic> values = data.expand((map) => map.values).toList();
        List<dynamic> tempes = []; 

        for(int i = 0; i < keys.length; i++) {
            if(keys.elementAt(i) != "time") {
                    tempes.add(values.elementAt(i));
            }
        }
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
      diffN = joke.shortestJoke - joke.avregeJoke;

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