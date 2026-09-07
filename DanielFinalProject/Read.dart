
// TEST 123
import 'dart:convert';
import 'dart:io';
class Read{
    String highstNum(String fileToRead) {
        String text = File(fileToRead).readAsStringSync();

        List<dynamic> OGdata = jsonDecode(text);
        List<Map<String, dynamic>> data = OGdata.cast<Map<String, dynamic>>();
        double biggestTemp = 0;  

        List<String> keys = data.expand((map) => map.keys).toList(); //sorting the Map to 2 Lists of Keys & Values
        List<dynamic> values = data.expand((map) => map.values).toList();
        List<dynamic> tempes = []; 
        List<dynamic> tempesI = []; 
        List<dynamic> tempesD = [];
        List<String> times = [];

        for(int i = 0; i < keys.length; i++) {// a for loop to sort each key/value to his place in the Lists above
            if(keys.elementAt(i) == "time") {
                times.add(values.elementAt(i));
            } else {
                tempes.add(values.elementAt(i));
                if(values.elementAt(i) % 1 == 0) {
                    tempesI.add(values.elementAt(i));
                } else {
                    tempesD.add(values.elementAt(i));
                }
            }
        }
        

        for(int y = 0; y < tempesI.length; y++) {
            if(tempesI.elementAt(y) > biggestTemp) {
                biggestTemp = tempesI.elementAt(y).toDouble(); // here i turn it into Double, this might be painful
            }
        }
        for(int y = 0; y < tempesD.length; y++) {
            if(tempesD.elementAt(y) > biggestTemp) {
                biggestTemp = tempesD.elementAt(y);
            }
        }
        print(biggestTemp);
        int indexOfBiggestTemp = tempes.indexOf(biggestTemp);
        String biggestTempTime = times.elementAt(indexOfBiggestTemp);
        return(biggestTempTime);
    }
    String lowestNum(String fileToRead) {
        String text = File(fileToRead).readAsStringSync();

        List<dynamic> OGdata = jsonDecode(text);
        List<Map<String, dynamic>> data = OGdata.cast<Map<String, dynamic>>();
        double lowestTemp = 10000; 

        List<String> keys = data.expand((map) => map.keys).toList(); 
        List<dynamic> values = data.expand((map) => map.values).toList();
        List<dynamic> tempes = []; 
        List<dynamic> tempesI = []; 
        List<dynamic> tempesD = [];
        List<String> times = [];
        for(int i = 0; i < keys.length; i++) {
            if(keys.elementAt(i) == "time") {
                times.add(values.elementAt(i));
            } else {
                tempes.add(values.elementAt(i));
                if(values.elementAt(i) % 1 == 0) {
                    tempesI.add(values.elementAt(i));
                } else {
                    tempesD.add(values.elementAt(i));
                }
            }
        }
        

        for(int y = 0; y < tempesI.length; y++) {
            if(tempesI.elementAt(y) < lowestTemp) {
                lowestTemp = tempesI.elementAt(y).toDouble(); // here i turn it into Double, this might be painful
            }
        }
        for(int y = 0; y < tempesD.length; y++) {
            if(tempesD.elementAt(y) < lowestTemp) {
                lowestTemp = tempesD.elementAt(y);
            }
        }
        print(lowestTemp);
        int indexOfBiggestTemp = tempes.indexOf(lowestTemp);
        String bigestTempTime = times.elementAt(indexOfBiggestTemp);
        return(bigestTempTime);
    }
    double avrege(String fileToRead){
        String text = File(fileToRead).readAsStringSync();

        List<dynamic> OGdata = jsonDecode(text);
        List<Map<String, dynamic>> data = OGdata.cast<Map<String, dynamic>>();
        double overall = 0;

        List<String> keys = data.expand((map) => map.keys).toList(); 
        List<dynamic> values = data.expand((map) => map.values).toList();
        List<dynamic> tempes = []; 
        List<dynamic> tempesI = [];
        List<dynamic> tempesD = [];
        List<String> times = [];
        double average = 0;

        for(int i = 0; i < keys.length; i++) {
            if(keys.elementAt(i) == "time") {
                times.add(values.elementAt(i));
            } else {
                tempes.add(values.elementAt(i));
                if(values.elementAt(i) % 1 == 0) {
                    tempesI.add(values.elementAt(i));
                } else {
                    tempesD.add(values.elementAt(i));
                }
            }
        }
        for(int u = 0; u < tempesI.length; u++) {
            overall += tempesI.elementAt(u).toDouble();
        }
        for(int u = 0; u < tempesD.length; u++) {
            overall += tempesD.elementAt(u);
        }
        average = overall / tempes.length;
        return average;
    }
    int engineWork(String fileToRead) {
      String text = File(fileToRead).readAsStringSync();

        List<dynamic> OGdata = jsonDecode(text);
        List<Map<String, dynamic>> data = OGdata.cast<Map<String, dynamic>>();

        List<String> keys = data.expand((map) => map.keys).toList(); 
        List<dynamic> values = data.expand((map) => map.values).toList();
        List<dynamic> tempes = []; 
        List<dynamic> tempesI = [];
        List<dynamic> tempesD = [];
        List<String> times = [];
        int engineWorkedWell = 0;

        for(int i = 0; i < keys.length; i++) {
            if(keys.elementAt(i) == "time") {
                times.add(values.elementAt(i));
            } else {
                tempes.add(values.elementAt(i));
                if(values.elementAt(i) % 1 == 0) {
                    tempesI.add(values.elementAt(i));
                } else {
                    tempesD.add(values.elementAt(i));
                }
            }
        }
        for(int u = 0; u < tempesI.length; u++) {
            if(tempesI.elementAt(u).toDouble() > 25) {
              engineWorkedWell++;
            }
        }
        for(int u = 0; u < tempesD.length; u++) {
            if(tempesD.elementAt(u).toDouble() > 25) {
              engineWorkedWell++;
            }
        }
        print("result:");
        return engineWorkedWell;
    
    }
}