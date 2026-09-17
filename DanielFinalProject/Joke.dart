import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
class Joke {
    late num longestJoke;
    late num shortesdtJoke;
    late num avregeJoke;
    late int overallJokes;

    final File file = File(r"DanielFinalProject\log");

    jokeAPI(String url) async {
        await file.writeAsString("jokeAPI called \n", mode: FileMode.append);
        longestJoke = 0;
        shortesdtJoke = 1000000000000000000;
        avregeJoke = 0;
        overallJokes = 0;
        final int wantedAmount = 10;

        for(int y = 0; y < wantedAmount; y++) {
          await file.writeAsString("for loop in jokeAPI \n", mode: FileMode.append);
          var URL = Uri.parse(url);
          var response = await http.get(URL);

          Map<String, dynamic> ApiResponse = jsonDecode(response.body);
          List<String> Keys = ApiResponse.keys.toList();  
          List<dynamic> values = ApiResponse.values.toList();  
          String joke = "";

          for(int b = 0; b < Keys.length; b++) {
            await file.writeAsString("for loop in jokeAPI \n", mode: FileMode.append);
            if(Keys[b] == "joke") {
              joke = values[b];
              break;
            }
          }

          if(joke.length > longestJoke) {
            longestJoke = joke.length;
          } else if(joke.length < shortesdtJoke) {
            shortesdtJoke = joke.length;
          }
          overallJokes += joke.length;
        }

        avregeJoke = (overallJokes / 10);
        /*print(avregeJoke);
        print(longestJoke);
        print(shortestJoke);*/

    }
  }