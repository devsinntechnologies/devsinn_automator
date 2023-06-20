import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

import 'clientModel.dart';

void main() {
  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Homepage(),
      debugShowCheckedModeBanner: false,
    
    );
  }
}



class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  Future<ClientData> loadData() async {
    var data = await rootBundle.loadString("assets/clientData.json");
    final  clientData = json.decode(data);
  
    return ClientData.fromJson(clientData);
  }
upload() async {
    for (int i = 0; i < 10; i++) {
      Random random = Random();
      int numerber = random.nextInt(24);
      int choseNumber = 0;

      if (numerber.isOdd == true) {
        choseNumber = random.nextInt(10) + 1;
        print("if ===> ${choseNumber}");
      
      } else {
        choseNumber = random.nextInt(30) + 1;
        print("else ===> ${choseNumber}");

        Future.delayed(Duration(milliseconds: choseNumber), () async {
          final Email email = Email(
            body:
                '=============================================================testing=================================================',
            subject: 'Email Testing',
            recipients: ['syedalisubhan555@gmail.com'],
            isHTML: false,
          );

          await FlutterEmailSender.send(email);
        });
      }
    }
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){

        upload();
      }),
      body:FutureBuilder(
          future:  loadData(),
          builder: (context, AsyncSnapshot<ClientData> snapshot) {
            if (snapshot.data!=null) {
              return Center(
                child:  Text(snapshot.data!.data!.first.address!),
              );
              
            } else {
              return Center(
                child:CircularProgressIndicator() ,
              );
              
            }
      
          })
      );
    
  }
}
