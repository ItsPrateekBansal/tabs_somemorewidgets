import 'package:flutter/material.dart';

void main()=>runApp(new MaterialApp(
  theme: new ThemeData(
    primarySwatch: Colors.blue,
  ),
  home: new HomePage(),
));

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController tabcontroller ;
  @override
  void call()  => new SnackBar(
      content: new Text("I was developed by Prateek Bansal",
      style: new TextStyle(color: Colors.orangeAccent),),
    duration: new Duration(seconds: 2),
    );
  @override
  void initState(){
    super.initState();
    tabcontroller = new TabController(length: 2, vsync: this);
  }
  @override
  void dispose(){
    tabcontroller.dispose();
    super.dispose();
  }
  int current_step = 0;
  List<Step> MySteps = [
    new Step(
        title: new Text("Step 1"),
        content: new Text("Some Content 1"),
        isActive: true
    ),
    new Step(
        title: new Text("Step 2"),
        content: new Text("Some Content 2"),
        isActive: true
    ),
    new Step(
        title: new Text("Step 3"),
        content: new Text("Some Content 3"),
        isActive: true
    ),
  ];
final GlobalKey<ScaffoldState> _scafkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scafkey,
      appBar: new AppBar(
        title: new Text("Utils App"),
        bottom:
          new TabBar(
            indicatorColor: Colors.red,
            controller: tabcontroller ,
            tabs: <Widget>[
              new Tab(
                icon: new Icon(Icons.favorite),
              ),
              new Tab(
                icon: new Icon(Icons.email),
                text: "HELLO",
              ),
            ],
      ),
    ),
      body: new TabBarView(
        children: <Widget>[
          new NewPage("First one"),
          new NewPage("Second one")
        ],
        controller: tabcontroller,
      ),
      floatingActionButton:  new FloatingActionButton(
        child: new Icon(Icons.add),
        backgroundColor: Colors.orangeAccent,
        onPressed:  ()=>_scafkey.currentState.showSnackBar(
          new SnackBar(
            content: new Text("Hello"),
            duration: new Duration(seconds: 2),
          ),
        ),
      ),
    );
  }
}
//
//class MyBody extends StatelessWidget {
//  AlertDialog dialog = new AlertDialog(
//    title: new Text("Hello, Bitch",),
//    content: new Text("You are Alerted", style: new TextStyle(fontSize: 22.0,color: Colors.red,fontWeight: FontWeight.bold),),
//  );
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        child: Center(
//          child: new RaisedButton(
//            child: new Text("Click Me Baby",
//              style: TextStyle(
//                  color: Colors.white,
//                  fontWeight: FontWeight.bold,
//                  fontStyle: FontStyle.italic
//              ),
//            ),
////            onPressed: ()=> Scaffold.of(context).showSnackBar(
////                new SnackBar(
////                  content: new Text("You clicked me"),
////                  duration: new Duration(seconds: 2),
////                )
////            ),
//          onPressed: ()=> showDialog(context: context, child: dialog ),
//            color: Colors.lightBlueAccent,
//          ),
//        ),
//    );
//  }
//}
//
class NewPage extends StatelessWidget {
  final String title;
  NewPage(this.title);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: new Center(
        child: new Text(title),
      ),
    );
  }
}
