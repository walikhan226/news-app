
import 'package:bloc/bloc.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/blocs/new_state.dart';
import 'package:new_app/blocs/news_event.dart';
import 'package:new_app/data/model/news_model.dart';
import 'package:new_app/data/repository/news_repository.dart';

class NewsBloc extends Bloc<NewsEvent, NewsStates> {
  NewsRepository repository = new NewsRepository();

  NewsBloc(NewsStates initialState) : super(initialState);

//  NewsBloc({@required this.repository});

  @override


  @override
  Stream<NewsStates> mapEventToState(NewsEvent event) async* {
    if (event is Fetchpostevent) {
      yield NewsLoadingState();
      try {
        List<News> posts = await repository.getnews();

        yield NewsLoadedState(list: posts);
      } catch (e) {
        yield NewsErrorState(message: e.toString());
      }
    }
  }
}
