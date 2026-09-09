import 'dart:convert';
import 'dart:io';
class Read{
    String read_json() {
        String text = File('DanielFinalProject/data.json').readAsStringSync();

        //List<Map<String, dynamic>> data = jsonDecode(text);
        List<dynamic> OGdata = jsonDecode(text);
        List<Map<String, dynamic>> data = OGdata.cast<Map<String, dynamic>>();
        double bigestTemp = 0;

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
            if(tempesI.elementAt(y) > bigestTemp) {
                bigestTemp = tempesI.elementAt(y).toDouble(); 
            }
        }
        for(int y = 0; y < tempesD.length; y++) {
            if(tempesD.elementAt(y) > bigestTemp) {
                bigestTemp = tempesD.elementAt(y);
            }
        }
        print(bigestTemp);
        int indexOfBiggestTemp = tempes.indexOf(bigestTemp);
        String bigestTempTime = times.elementAt(indexOfBiggestTemp);
        return(bigestTempTime);
    }
}