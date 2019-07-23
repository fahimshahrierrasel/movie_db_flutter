import 'package:flutter/material.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MovieDetailsState createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  var top = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
                expandedHeight: 200,
                pinned: true,
                floating: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return FlexibleSpaceBar(
                    centerTitle: true,
                    collapseMode: CollapseMode.parallax,
                    title: Text(top <= 80 ? "The Lion King" : ""),
                    background: Image.asset(
                      "assets/images/lion_king_backdrop.jpg",
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
                        "Overview",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        "Simba idolises his father, King Mufasa, and takes to heart his own royal destiny. But not everyone in the kingdom celebrates the new cub's arrival. Scar, Mufasa's brother—and former heir to the throne—has plans of his own. The battle for Pride Rock is ravaged with betrayal, tragedy and drama, ultimately resulting in Simba's exile. With help from a curious pair of newfound friends, Simba will have to figure out how to grow up and take back what is rightfully his.",
                        textAlign: TextAlign.justify,
                      )
                    ],
                  ),
                ),
              ),
              Card(
                elevation: 3,
                child: Container(
                    child: Column(
                  children: <Widget>[
                    new FactItem(Icons.theaters, "Released"),
                    new FactItem(Icons.today, "2019-07-12"),
                    new FactItem(Icons.language, "English"),
                    new FactItem(Icons.movie, "1h 58m"),
                    new FactItem(Icons.monetization_on, "260 Million"),
                    new FactItem(Icons.trending_up, "270 Million"),
                  ],
                )),
              ),
              Card(
                elevation: 3,
                child: Container(
                  height: 160,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, int) {
                        return ActorListItem();
                      }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ActorListItem extends StatelessWidget {
  const ActorListItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      padding: EdgeInsets.all(4.0),
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/lion_king_poster.jpg"),
                    fit: BoxFit.cover)),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              color: Color.fromRGBO(255, 255, 255, 0.7),
              child: Text(
                "The Lion King",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FactItem extends StatelessWidget {
  final IconData icon;
  final String fact;

  FactItem(this.icon, this.fact);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            size: 30.0,
            color: Colors.green,
          ),
          Container(padding: EdgeInsets.only(left: 8.0), child: Text(fact))
        ],
      ),
    );
  }
}
