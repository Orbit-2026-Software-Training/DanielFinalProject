import 'Read.dart';
void main(){
Read read = new Read();
    print(read.engineWork('DanielFinalProject/data.json'));
    print(read.jokeAPI('https://v2.jokeapi.dev/joke/Dark?type=single&amount=20'));
}