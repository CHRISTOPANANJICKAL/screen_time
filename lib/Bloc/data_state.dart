import 'package:blocstudy/DataModel/data_model.dart';
import 'package:equatable/equatable.dart';

abstract class DataState extends Equatable {
  const DataState();
}

class DataInitState extends DataState {
  const DataInitState();
  @override
  List<Object> get props => [];
}

class DataLoadingState extends DataState {
  const DataLoadingState();
  @override
  List<Object> get props => [];
}

class DataLoadedState extends DataState {
  final DataModel dataModel ;

  const DataLoadedState(this.dataModel);
  @override
  List<Object> get props => [];

}

class DataErrorState extends DataState {
  const DataErrorState();
  @override
  List<Object> get props => [];
}