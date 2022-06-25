import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../models/user_info_model.dart';

//API REQUIRED VARIABLES
var url = Uri.parse("https://jsonplaceholder.typicode.com/Posts");
var client = http.Client();
SharedPreferences? _storage;
var token = "zasdcvgtghnkiuhgfde345tewasdfghjkm";


//GET USER LIST
Future <List<User>> get_User() async {
  final response =  await http.get(url);
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((user_info) => new User.fromJson(user_info)).toList();
  } else {
    throw Exception('Unexpected error occured!');
  }
}


//POST FUNCTION WHICH CHECKING USER HAS SUCCESSFULLY LOGIN OR NOT
Future<String> login_user(String email , String password)async {

    var response = await client.post(
        Uri.https('buddy.ropstambpo.com' , 'api/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
          'device_token': token
        }));
    var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    var uri = Uri.parse(decodedResponse['meta']['message'] as String);
    if (uri == Uri.parse("Successfull"))
      {
      await  createSession(email, password);
        return "success";

      }
    else{
      return "failed";
    }


}

//TODO:TASK TO CREATE A LOGIN SESSION
Future<void> createSession(String email , String password)async {
  _storage = await SharedPreferences.getInstance();
  _storage?.setString("email", email);
  _storage?.setString("password", password);

}