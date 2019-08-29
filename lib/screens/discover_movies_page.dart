import 'package:flutter/material.dart';
import 'package:movie_db_flutter/common/app_drawer.dart';
import 'package:movie_db_flutter/common/movie_list.dart';

class DiscoverMoviesPage extends StatefulWidget {
  DiscoverMoviesPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _DiscoverMoviesPageState createState() =>
      _DiscoverMoviesPageState(title: title);
}

class _DiscoverMoviesPageState extends State<DiscoverMoviesPage> {
  final String title;

  RangeValues ratingRange = RangeValues(5.0, 10.0);
  RangeValues durationRange = RangeValues(70.0, 200.0);
  List<String> years = List<String>();
  String selectedYear = "";

  _DiscoverMoviesPageState({@required this.title});

  @override
  void initState() {
    super.initState();
    for (int i = 2019; i >= 2000; i--) {
      years.add(i.toString());
    }
    selectedYear = years[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      drawer: AppDrawer(),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          Expanded(
                            flex: 3,
                            child: TextField(
                              decoration: InputDecoration(
                                  hintText: "Search Here",
                                  contentPadding:
                                      EdgeInsets.only(left: 8.0, bottom: 4.0)),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: MaterialButton(
                                  child: Text("Search"), onPressed: () {}),
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: ExpansionTile(
                        title: Text("Advance Search"),
                        children: <Widget>[
                          DropdownButton<String>(
                            value: selectedYear,
                            isExpanded: true,
                            onChanged: (item) {
                              setState(() {
                                selectedYear = item;
                              });
                            },
                            items: years.map((year) {
                              return DropdownMenuItem<String>(
                                value: year,
                                child: new Text(year),
                              );
                            }).toList(),
                          ),
                          RangeSlider(
                              values: ratingRange,
                              min: 0,
                              max: 10,
                              divisions: 10,
                              labels: RangeLabels(
                                  "${ratingRange.start.toInt()}",
                                  "${ratingRange.end.toInt()}"),
                              onChanged: (newValue) {
                                setState(() {
                                  ratingRange = newValue;
                                });
                              }),
                          RangeSlider(
                              values: durationRange,
                              min: 0,
                              max: 600,
                              divisions: 600,
                              labels: RangeLabels(
                                  "${durationRange.start.toInt()}",
                                  "${durationRange.end.toInt()}"),
                              onChanged: (newValue) {
                                setState(() {
                                  durationRange = newValue;
                                });
                              }),
                          Container(
                            child: RaisedButton(
                              child: Text("Advance Search"),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
                child: MovieList(
              movieResponse: getMovies("popular"),
            ))
          ],
        ),
      ),
    );
  }
}
