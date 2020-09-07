
import 'package:flutter/material.dart';
 
class MineRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
 
    return new Page();
  }
}
 
class Page extends State<MineRoute> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }
 
  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context),
      body: new ListView(
        children: <Widget>[
          header(context),
          header(context),
          header(context),
          header(context),
          header(context),
        ],
      ),
    );
  }
 
  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('我的'));
  }
 
  Widget header(BuildContext context) {
    return new Image.network(
      'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg',
 
    );
  }
}
