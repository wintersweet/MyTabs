import 'package:flutter/material.dart';
import 'FirstRoute.dart';
import 'SecondRoute.dart';
import 'Mine.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
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
  int _selectedIndex = 1;
  /*
   * 存放三个页面，跟fragmentList一样
   */
  var _pageList;
  void initData() {
    _pageList = [
      new FirstRoute(),
      new SecondRoute(),
      new MineRoute(),
      new MineRoute()
    ];
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return Scaffold(
      body: _pageList[_selectedIndex],
      backgroundColor: Color.fromARGB(255, 248, 248, 248),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text("首页"),
              activeIcon: Icon(Icons.access_alarm)),
          BottomNavigationBarItem(
              icon: Icon(Icons.business),
              title: Text("商业"),
              activeIcon: Icon(Icons.access_alarm)),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text("学校"),
              activeIcon: Icon(Icons.access_alarm)),
          BottomNavigationBarItem(
              icon: Icon(Icons.school),
              title: Text("学校"),
              activeIcon: Icon(Icons.access_alarm)),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        iconSize: 24,
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onAdd,
        child: Icon(Icons.add),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _onAdd() {
    print("点击按钮");
  }
}

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: MediaQuery.removePadding(
        context: context,
        //移除抽屉菜单顶部默认留白
        removeTop: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 38.0),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: ClipOval(
                      child: Image.asset(
                        "imgs/avatar.png",
                        width: 80,
                      ),
                    ),
                  ),
                  Text(
                    "Wendux",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: const Icon(Icons.add),
                    title: const Text('Add account'),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text('Manage accounts'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//tabBar样式
class _MyHomePageState1 extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: tabs.map((xx) => Tab(text: xx)).toList(),
          controller: _tabController,
        ),
      ),
    );
  }
}
