import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main() {
  runApp(
      MaterialApp(
        home: HomePage(),
      )
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String centerText = "empty";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(centerText),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getData,
      )
    );
  }

  getData()async{
    try{
      final response = await http.get("http://192.168.1.53:3000/students")
          .timeout(Duration(seconds: 10));
      if(response.statusCode==200){
        setState(() {
          centerText = response.body;
        });
      }else{
        setState(() {
          centerText = "Something went wrong";
        });
      }
    }catch(e){
      setState(() {
        centerText = "Something went wrong";
      });
    }
  }


}
