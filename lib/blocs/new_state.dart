import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:new_app/data/model/news_model.dart';

abstract class NewsStates extends Equatable {}

class NewsinitialState extends NewsStates {
  @override
  List<Object> get props => [];
}

class NewsLoadingState extends NewsStates {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class NewsLoadedState extends NewsStates {
  List<News> list;

  NewsLoadedState({this.list});
  @override
  List<Object> get props => [this.list];
}


class NewsErrorState extends NewsStates {
  String message;
  NewsErrorState({@required this.message});
  @override

  List<Object> get props => [this.message];
}