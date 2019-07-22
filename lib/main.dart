import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie DB',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Movie DB'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
              flexibleSpace: FlexibleSpaceBar(
                centerTitle: true,
                title: Text("The Lion King"),
                background: Image.asset(
                  "assets/images/lion_king_backdrop.jpg",
                  fit: BoxFit.cover,
                ),
              ),
            )
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
                        style:
                            TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
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
                    new FactItem(),
                    new FactItem(),
                    new FactItem(),
                    new FactItem(),
                    new FactItem(),
                  ],
                )),
              ),
              Card(
                elevation: 3,
                child: Container(
                  height: 160,
                  child: ListView.builder(
//                      shrinkWrap: true,
//                      physics: ScrollPhysics(),
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
      color: Colors.green,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/lion_king_poster.jpg"),
                    fit: BoxFit.cover)),
          ),
          Container(
            child: Text("The Lion King"),
          )
        ],
      ),
    );
  }
}

class FactItem extends StatelessWidget {
  const FactItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          Icons.ac_unit,
          size: 30.0,
          color: Colors.green,
        ),
        Text("This is a Item")
      ],
    );
  }
}
