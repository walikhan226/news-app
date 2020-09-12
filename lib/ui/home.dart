import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app/blocs/new_state.dart';
import 'package:new_app/blocs/news_bloc.dart';
import 'package:new_app/blocs/news_event.dart';
import 'package:new_app/data/model/news_model.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NewsinitialState state = new NewsinitialState();
    return BlocProvider(
      create: (BuildContext context) => NewsBloc(state),
      child: Homescreen(),
    );
  }
}

class Homescreen extends StatefulWidget {
  @override
  _HomescreenState createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  NewsBloc newsBloc;

  Widget savedlist(List<News> lists) {
    return ListView.builder(
        itemCount: lists == null ? 0 : lists.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(15),
            elevation: 7,
            child: Column(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white54,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      // Image.asset(
                      //    saved[index]['link'],
                      // ),
                      Stack(
                        children: <Widget>[
                          new CachedNetworkImage(
                            imageUrl: lists[index].jetpackFeaturedMediaUrl,
                            placeholder: (context, url) =>
                                new CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                new Icon(Icons.error),
                            fadeOutDuration: new Duration(seconds: 1),
                            fadeInDuration: new Duration(seconds: 3),
                            fit: BoxFit.cover,
                            filterQuality: FilterQuality.high,
                            width: MediaQuery.of(context).size.width,
                            height: 200,
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            lists[index].title.rendered,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      //              Container(
                      //   padding: EdgeInsets.only(top: 5.0),
                      //   child: Align(
                      //     alignment: Alignment.bottomLeft,
                      //                     child: Text(
                      //  saved [index]['city'] == null ? '': saved[index]['city'],
                      //       style: TextStyle(
                      //         color: Colors.black,
                      //         fontSize: 12.0,
                      //         fontWeight: FontWeight.normal,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          //                                          Text(

                          //  posts[index].jobLocation == null ? '': posts[index].jobLocation,
                          //                                            overflow: TextOverflow.ellipsis,
                          //                                                style: TextStyle(
                          //                                                  color: Colors.black,
                          //                                                  fontSize: 12.0,
                          //                                                  fontWeight: FontWeight.normal,
                          //                                                ),
                          //                                              ),

                          // Flexible(
                          //   child: RichText(
                          //       overflow: TextOverflow.fade,
                          //       strutStyle: StrutStyle(fontSize: 12.0),
                          //       text: TextSpan(
                          //           style: TextStyle(color: Colors.black),
                          //           text:
                          //               splitter(lists[index]['location']) ==
                          //                       null
                          //                   ? ''
                          //                   : splitter(
                          //                       lists[index]['location']))),
                          // ),
                          SizedBox(
                            width: 5,
                          ),
                          // RichText(
                          //   text: new TextSpan(
                          //     // Note: Styles for TextSpans must be explicitly defined.
                          //     // Child text spans will inherit styles from parent
                          //     style: new TextStyle(
                          //       fontSize: 13.0,
                          //       color: Colors.black,
                          //     ),
                          //     children: <TextSpan>[
                          //       new TextSpan(
                          //           text: 'PKR ',
                          //           style: new TextStyle(
                          //               fontWeight: FontWeight.bold)),
                          //       new TextSpan(
                          //           text: lists[index]['price']??lists[index]['s_price']??lists[index]['r_price'],

                          //           style: new TextStyle(
                          //             fontSize: 12.0,
                          //           )),
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }

  mainUI(List<News> list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (context, index) {
          return Card(
            child: Row(),
          );
        });
  }

  @override
  void initState() {
    super.initState();
    this.newsBloc = BlocProvider.of<NewsBloc>(context);
    newsBloc.add(Fetchpostevent());
  }

  Widget buildErrorUi(String message) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 5, 5, 0),
              child: RaisedButton(
                color: Color(0xFFfcb917),
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)),
                onPressed: () {
                  newsBloc.add(Fetchpostevent());
                },
                child: Text(
                  "Refresh",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0.0),
              child: Text(
                message,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("LATEST NEWS"),
        actions: [
          IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {
                newsBloc.add(Fetchpostevent());
              })
        ],
      ),
      body: Container(
        child: BlocListener<NewsBloc, NewsStates>(
          listener: (context, state) {},
          child: BlocBuilder<NewsBloc, NewsStates>(
            builder: (context, state) {
              if (state is NewsinitialState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is NewsLoadingState) {
                return Center(child: CircularProgressIndicator());
              } else if (state is NewsLoadedState) {
                return savedlist(state.list);
              } else if (state is NewsErrorState) {
                return buildErrorUi("Error");
              } else {
                return buildErrorUi("Error");
              }
            },
          ),
        ),
      ),
    );
  }
}
