import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'pages/HomePage.dart';
import 'pages/LoanPage.dart';

void main(){
  runApp(QianZhuangClient());
}

class QianZhuangClient extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new QianZhuangClientState();
  }
}

class QianZhuangClientState extends State<QianZhuangClient> {

  int _tabIndex = 0;
  final _tabTextStyleNormal = new TextStyle(color: const Color(0xff969696));
  final _tabTextStyleHigh = new TextStyle(color: const Color(0xff63ca6c));

  var tabImages;
  var tabTitles = ['首页','借款'];

  var _body;

  Image getTabImage(path) {
    return new Image.asset(path,width: 20.0,height: 20.0,);
  }

  Image getTabIcon(int currentIndex) {
    if(currentIndex == _tabIndex) {
      return tabImages[currentIndex][1];
    }
    return tabImages[currentIndex][0];
  }

  TextStyle getTextStyle(int currentIndex) {
    if(currentIndex == _tabIndex) {
      return _tabTextStyleNormal;
    }
    return _tabTextStyleHigh;
  }

  Text getTabTitle(int currentIndex) {
    return new Text(tabTitles[currentIndex],style: getTextStyle(currentIndex));
  }


  //使用方法包裹起来
  void initData(){
    if(tabImages == null) {
      tabImages = [
        [getTabImage('images/tabs/tab_home@3x.png'),
        getTabImage('images/tabs/tab_home_h@3x.png')],
        [getTabImage('images/tabs/tab_home@3x.png'),
        getTabImage('images/tabs/tab_home_h@3x.png')],
      ];
    }

    _body = new IndexedStack(
      children: <Widget>[
        new HomePage(),
        new LoanPage()
      ],
      index: _tabIndex,
    );
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    initData();
    return new MaterialApp(
      theme: new ThemeData(
        primaryColor: Color(0xFF63CA6C)
      ),
      home: new Scaffold( //默认是首页
        appBar: new AppBar(
        title: new Text(tabTitles[_tabIndex],style: new TextStyle(color: Colors.white)),
        ),
      body: _body,
      bottomNavigationBar: new CupertinoTabBar(
        items: <BottomNavigationBarItem>[
        new BottomNavigationBarItem(icon: getTabIcon(0), title: getTabTitle(0)),
        new BottomNavigationBarItem(icon: getTabIcon(1), title: getTabTitle(1)),],
        currentIndex: 0,
        onTap: (index){
          setState(() {
            _tabIndex = index;
          });
        },
        ),
      ),
    );
  }
}



