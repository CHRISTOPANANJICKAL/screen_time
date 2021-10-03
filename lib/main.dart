import 'package:blocstudy/Screens/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'Bloc/data_event.dart';
import 'Bloc/data_fetch_bloc.dart';
import 'Bloc/data_state.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  Scaffold(appBar:AppBar(
        backgroundColor: Colors.white,
        title:  const Text("Michael",style: TextStyle(color: Colors.black),),
        leading:  const Padding(
          padding: EdgeInsets.symmetric(vertical: 5,),
          child: CircleAvatar(
            backgroundColor: Colors.pinkAccent,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              CupertinoIcons.gear,
              color: Colors.black,
            ),
            onPressed: () {
              debugPrint("setting pressed");
            },
          )
        ],

      ) ,
      body: BlocProvider<DataFetchBloc>(create: (context){
        return DataFetchBloc(const DataInitState())..add(const DataFetchEvent());
      },child: const Center(child: HomePage()))),

    );
  }
}







