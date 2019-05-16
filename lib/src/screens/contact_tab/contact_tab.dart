import 'package:flutter/material.dart';
import 'package:study_flutter_v158/src/screens/contact_tab/contact/contact_page.dart';
import 'package:study_flutter_v158/src/screens/contact_tab/official_contact/official_contact_page.dart';

class ContactTab extends StatelessWidget {
  static const int _selectedTab = 1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: _selectedTab,
      child: Scaffold(
        appBar: TabBar(
          unselectedLabelColor: Colors.black,
          labelColor: Colors.blue,
          tabs: [
            Tab(text: 'Contacts'),
            Tab(text: 'Official Contacts'),
          ],
        ),
        body: TabBarView(
          children: [
            ContactPage(),
            OfficialContactPage(),
          ],
        ),
      ),
    );
  }
}
