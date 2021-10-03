import 'package:bloc/bloc.dart';
import 'package:blocstudy/Bloc/bloc.dart';
import 'package:blocstudy/Functions/fetch_api_data.dart';

class DataFetchBloc extends Bloc<DataEvent,DataState>{
  DataFetchBloc(DataState initialState) : super(initialState);

  DataState get initialState => DataInitState();

  @override
  Stream<DataState> mapEventToState(DataEvent event) async* {
    if(event is DataFetchEvent){
      yield DataLoadingState();
      var data = await fetchData();
      if(data != null){
        yield DataLoadedState(data);
      }else{
        yield DataErrorState();
      }
    }
  }
}