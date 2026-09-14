import 'package:http/http.dart' as http;
import 'dart:convert';
class Joke {
    late num longestJoke;
    late num shortesdtJoke;
    late num avregeJoke;
    late int overallJokes;

    jokeAPI(String url) async {
        
          longestJoke = 0;
          shortesdtJoke = 1000000000000000000;
          avregeJoke = 0;
          overallJokes = 0;

        for(int y = 0; y < 10; y++) {
          var URL = Uri.parse(url);
          var response = await http.get(URL);

          Map<String, dynamic> ApiResponse = jsonDecode(response.body);
          List<String> Keys = ApiResponse.keys.toList();  
          List<dynamic> values = ApiResponse.values.toList();  
          String joke;
          joke = "ooo";

          for(int b = 0; b < Keys.length; b++) {
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