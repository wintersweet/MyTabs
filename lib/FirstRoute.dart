
import 'package:flutter/material.dart';
 
class FirstRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new Page();
  }
}
 
class Page extends State<FirstRoute> {
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
    return new AppBar(title: const Text('首页'));
  }
 
  Widget header(BuildContext context) {
    return Text("测试内容");
    // return new Image.network(
    //   'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg',
 
    // );
  }
}
