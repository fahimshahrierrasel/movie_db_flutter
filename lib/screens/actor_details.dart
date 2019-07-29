import 'package:flutter/material.dart';
import 'package:movie_db_flutter/common/fact_item.dart';
import 'package:movie_db_flutter/common/movie_item.dart';

class ActorDetails extends StatefulWidget {
  ActorDetails({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ActorDetailsState createState() => _ActorDetailsState(title: title);
}

class _ActorDetailsState extends State<ActorDetails> {
  var top = 0.0;
  final String title;

  _ActorDetailsState({@required this.title});

  @override
  Widget build(BuildContext context) {
    String biography =
        "Simba idolises his father, King Mufasa, and takes to heart his own royal destiny. But not everyone in the kingdom celebrates the new cub's arrival. Scar, Mufasa's brother—and former heir to the throne—has plans of his own. The battle for Pride Rock is ravaged with betrayal, tragedy and drama, ultimately resulting in Simba's exile. With help from a curious pair of newfound friends, Simba will have to figure out how to grow up and take back what is rightfully his.";
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: 350,
                pinned: true,
                floating: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return FlexibleSpaceBar(
                    centerTitle: true,
                    collapseMode: CollapseMode.parallax,
                    title: Text(top <= 100 ? title : ""),
                    background: Image.asset(
                      "assets/images/donald_glover.jpg",
                      fit: BoxFit.cover,
                    ),
                  );
                }))
          ];
        },
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                elevation: 3,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Biography",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        biography,
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 3,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Info",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    new FactItem(Icons.theaters, "Released"),
                    new FactItem(Icons.today, "2019-07-12"),
                    new FactItem(Icons.language, "English"),
                    new FactItem(Icons.movie, "1h 58m"),
                    new FactItem(Icons.monetization_on, "260 Million"),
                    new FactItem(Icons.trending_up, "270 Million"),
                  ],
                ),
              ),
              Card(
                elevation: 3,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Known For",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    Container(
                      height: 160,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, int) {
                            return MovieGridItem();
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
