import 'package:blocstudy/Bloc/data_fetch_bloc.dart';
import 'package:blocstudy/Bloc/data_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'error_screen.dart';
import 'loaded_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DataFetchBloc,DataState>(
      builder: (context,state){
        if(state is DataLoadingState){
          return const CircularProgressIndicator();
        } if(state is DataLoadedState){
          return LoadedScreen(dataModel: state.dataModel);
        }if(state is DataErrorState){
          return const ErrorScreen();
        }
        return const Text("Home Page");
      },
    );
  }
}
