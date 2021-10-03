 import 'package:equatable/equatable.dart';

abstract class DataEvent extends Equatable {
  const DataEvent();
}

class DataFetchEvent extends DataEvent {
  const DataFetchEvent();
  @override
  List<Object> get props => [];
}
