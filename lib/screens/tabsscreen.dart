
import 'package:flutter/material.dart';
import '../screens/sponserscreen.dart';
import '../screens/eventscreen.dart';
import '../screens/sessionscreen.dart';
import '../screens/speakerscreen.dart';
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
   {
      'page': EventScreen(),
      'title': 'Event',
    },
    {
      'page': SpeakerScreen(),
      'title': 'Speaker',
    },
    {
      'page': SessionScreen(),
      'title': 'Session',
    },
     
     {
      'page': SponserScreen(),
      'title': 'Sponser',
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Colors.purple,
           selectedItemColor: Colors.white,
          unselectedItemColor: Colors.purple[200],
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.event_note),
            label :('Event'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.campaign),
            label: ('Speaker'),
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.update),
            label: ('Session'),
          ),
           BottomNavigationBarItem(
            icon: Icon(Icons.supervisor_account),
            label:('Sponser'),
          ),
           
        ],
      ),
    );
  }
}
