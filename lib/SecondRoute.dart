
import 'package:flutter/material.dart';
 
class SecondRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
 
    return new Page();
  }
}
 
class Page extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    return layout(context);
  }
 
  Widget layout(BuildContext context) {
    return new Scaffold(
      appBar: buildAppBar(context),
      body:buildFlow()
    );
  }
  buidlWrap(){
    return Wrap(
        spacing: 8,//主轴（水平）方向间距
        runSpacing: 4,//纵轴方向间距
        alignment: WrapAlignment.center,
        children: <Widget>[
          new Chip(
            label: new Text("hello world Kitty  hha"),
            avatar: new CircleAvatar(backgroundColor:Colors.blue,child:Text("A")),
            ),
            new Chip(
            label: new Text("hello world xx"),
            avatar: new CircleAvatar(backgroundColor:Colors.blue,child:Text("B")),
            ),
            new Chip(
            label: new Text("hello world xx1"),
            avatar: new CircleAvatar(backgroundColor:Colors.blue,child:Text("C")),
            ),
            new Chip(
            label: new Text("hello world xx2"),
            avatar: new CircleAvatar(backgroundColor:Colors.blue,child:Text("D")),
            ),

        ],
      );
    
  }
   buildFlow(){
    return Flow(
      delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
      children: <Widget>[
        new Container(width: 80.0, height:80.0, color: Colors.red,),
        new Container(width: 80.0, height:80.0, color: Colors.green,),
        new Container(width: 80.0, height:80.0, color: Colors.blue,),
        new Container(width: 80.0, height:80.0,  color: Colors.yellow,),
        new Container(width: 80.0, height:80.0, color: Colors.brown,),
        new Container(width: 80.0, height:80.0,  color: Colors.purple,),
      ]);
  }
  Widget buildAppBar(BuildContext context) {
    return new AppBar(title: const Text('其他'));
  }
 
  Widget header(BuildContext context) {
    return new Image.network(
      'http://i2.yeyou.itc.cn/2014/huoying/hd_20140925/hyimage06.jpg',
 
    );
  }
}
class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置  
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)  
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
         x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints){
    //指定Flow的大小  
    return Size(double.infinity,200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}