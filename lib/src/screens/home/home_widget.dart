import 'package:flutter/material.dart';
import 'package:study_flutter_v158/src/constants/tab.dart';
import 'package:study_flutter_v158/src/screens/contact_tab/contact_tab.dart';
import 'package:study_flutter_v158/src/screens/extend_tab/extend_page.dart';
import 'package:study_flutter_v158/src/screens/group_tab/group_page.dart';
import 'package:study_flutter_v158/src/screens/layouts/app_bar/app_bar.dart';
import 'package:study_flutter_v158/src/screens/message_tab/message_tab.dart';
import 'package:study_flutter_v158/src/screens/timeline_tab/timeline_page.dart';

class HomeWidget extends StatefulWidget {
  HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _selectedTab = tabContact;

  static List<Widget> _widgetsContent = <Widget>[
    MessageTab(),
    ContactTab(),
    GroupPage(),
    TimelinePage(),
    ExtendPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: LayoutAppBar(
          title: tabsTitle[this._selectedTab],
          selectedTab: this._selectedTab,
        ),
      ),
      body: Center(
        child: _widgetsContent.elementAt(this._selectedTab),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            title: Text('Messages'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contacts),
            title: Text('Contacts'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Groups'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.timeline),
            title: Text('Timeline'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more),
            title: Text('More'),
          ),
        ],
        currentIndex: _selectedTab,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
