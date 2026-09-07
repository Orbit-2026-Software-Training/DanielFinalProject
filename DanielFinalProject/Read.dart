
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
        List<String> times = [];

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
        int indexOfBiggestTemp = tempes.indexOf(biggestTemp);
        String biggestTempTime = times.elementAt(indexOfBiggestTemp);
        return(biggestTempTime);
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
}