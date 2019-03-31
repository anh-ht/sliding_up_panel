/*
Name: Akshath Jain
Date: 3/18/19
Purpose: defines the package: grouped_buttons
Copyright: © 2019, Akshath Jain. All rights reserved.
Licensing: More information can be found here: https://github.com/akshathjain/sliding_up_panel/blob/master/LICENSE
*/

import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() => runApp(SlidingUpPanelExample());

class SlidingUpPanelExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SlidingUpPanel Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  PanelController _pc = new PanelController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SlidingUpPanelExample"),
      ),
      body: SlidingUpPanel(
        renderPanel: false,
        childPanel: _floatingFront(),
        childCollapsed: _floatingCollapsed(),
        childBehind: Center(
          child: Text("This is the Widget behind the sliding panel"),
        ),
      ),
    );
  }

  Widget _body(){
    return Container(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Open"),
            onPressed: () => _pc.open(),
          ),
          RaisedButton(
            child: Text("Close"),
            onPressed: () => _pc.close(),
          ),
          RaisedButton(
            child: Text("Show"),
            onPressed: () => _pc.show(),
          ),
          RaisedButton(
            child: Text("Hide"),
            onPressed: () => _pc.hide(),
          ),
        ],
      ),
    );
  }

  Widget _floatingCollapsed(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(24.0), topRight: Radius.circular(24.0)),
      ),
      margin: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 0.0),
      child: Center(
        child: Text(
          "This is the collapsed Widget",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _floatingFront(){
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(24.0)),
        boxShadow: [
          BoxShadow(
            blurRadius: 20.0,
            color: Colors.grey,
          ),
        ]
      ),
      margin: const EdgeInsets.all(24.0),
      child: Center(
        child: Text("This is the SlidingUpPanel when open"),
      ),
    );
  }

  Widget _scrollingList(){
    return Container(
      //adding a margin to the top leaves an area where the user can swipe
      //to open/close the sliding panel
      margin: const EdgeInsets.only(top: 36.0),

      color: Colors.white,
      child: ListView.builder(
        itemCount: 50,
        itemBuilder: (BuildContext context, int i){
          return Container(
            padding: const EdgeInsets.all(12.0),
            child: Text("$i"),
          );
        },
      ),
    );
  }

}
