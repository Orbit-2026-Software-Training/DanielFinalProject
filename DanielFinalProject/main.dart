
import 'Read.dart';
Future<void> main() async {
Read read = new Read(r"DanielFinalProject\data.json");
    print(read.lowestNum(r"DanielFinalProject\data.json"));
    //read.cleanLogFile();
}