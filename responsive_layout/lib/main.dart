import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Traveloke',
      debugShowCheckedModeBanner: false,
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
  bool _isSidebarExpanded = true;

  void _toggleSidebar() {
    setState(() {
      _isSidebarExpanded = !_isSidebarExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traveloke'),
        actions: [
          IconButton(
            icon: Icon(
                _isSidebarExpanded ? Icons.arrow_back : Icons.arrow_forward),
            onPressed: _toggleSidebar,
          ),
        ],
      ),
      body: Row(
        children: [
          AnimatedContainer(
            duration: Duration(milliseconds: 300),
            width: _isSidebarExpanded ? 200 : 60,
            color: Colors.blueGrey,
            child: Column(
              children: [
                SizedBox(height: 20),
                if (_isSidebarExpanded)
                  Text(
                    'Menu',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ListTile(
                  leading: Icon(Icons.home, color: Colors.white),
                  title: _isSidebarExpanded
                      ? Text('Home', style: TextStyle(color: Colors.white))
                      : null,
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.explore, color: Colors.white),
                  title: _isSidebarExpanded
                      ? Text('Destinations',
                          style: TextStyle(color: Colors.white))
                      : null,
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.contact_mail, color: Colors.white),
                  title: _isSidebarExpanded
                      ? Text('Contact Us',
                          style: TextStyle(color: Colors.white))
                      : null,
                  onTap: () {},
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    'Welcome to Traveloke Dulu',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  Flexible(
                    child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(4, (index) {
                        return Card(
                          child: Center(
                            child: Text(
                              'Destination ${index + 1}',
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
