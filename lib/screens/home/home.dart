import 'package:flutter/material.dart';
import 'package:itv_manager_app/ultils/service_title.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;
  // ignore: unused_field
  static const List<Widget> _pages = <Widget>[
    Text('Home Page'),
    Text('Search Page'),
    Text('Profile Page'),
    Text('Settings Page'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[700],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Xin chào, IT Vũng Tàu',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 1),
                          Text(
                            '05/08/2024',
                            style: TextStyle(
                              color: Colors.blue[200],
                            ),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: EdgeInsets.all(12),
                        child: Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 20),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: Colors.white,
                        ),
                        Text(
                          'Từ khóa tìm kiếm...',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
                child: Container(
                  padding: EdgeInsets.all(25),
                  color: Colors.grey[300],
                  child: Center(
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Danh sách dịch vụ',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                            Icon(Icons.more_horiz),
                          ],
                        ),
                        SizedBox(height: 20),
                        Expanded(
                          child: ListView(
                            children: [
                              ServiceTitle(
                                icon: Icons.web,
                                serviceName: "Tên miền",
                                numberUse: 15,
                                numberExpiring: 10,
                                numberExpired: 5,
                                color: Colors.orange,
                              ),
                              ServiceTitle(
                                icon: Icons.rocket,
                                serviceName: "Hosting",
                                numberUse: 15,
                                numberExpiring: 10,
                                numberExpired: 5,
                                color: Colors.green,
                              ),
                              ServiceTitle(
                                icon: Icons.mail,
                                serviceName: "Email",
                                numberUse: 15,
                                numberExpiring: 10,
                                numberExpired: 5,
                                color: const Color.fromARGB(255, 142, 30, 233),
                              ),
                              ServiceTitle(
                                icon: Icons.safety_check,
                                serviceName: "SSL",
                                numberUse: 15,
                                numberExpiring: 10,
                                numberExpired: 5,
                                color: Colors.pink,
                              ),
                              ServiceTitle(
                                icon: Icons.web,
                                serviceName: "Thiết kế website",
                                numberUse: 15,
                                numberExpiring: 10,
                                numberExpired: 5,
                                color: const Color.fromARGB(255, 118, 30, 233),
                              ),
                              ServiceTitle(
                                icon: Icons.content_copy,
                                serviceName: "Viết bài Content & PR",
                                numberUse: 15,
                                numberExpiring: 10,
                                numberExpired: 5,
                                color: Color.fromARGB(255, 30, 203, 233),
                              ),
                              ServiceTitle(
                                icon: Icons.topic,
                                serviceName: "Toplist Vũng Tàu",
                                numberUse: 15,
                                numberExpiring: 10,
                                numberExpired: 5,
                                color: const Color.fromARGB(255, 47, 233, 30),
                              ),
                              ServiceTitle(
                                icon: Icons.manage_history,
                                serviceName: "Bảo trì",
                                numberUse: 15,
                                numberExpiring: 10,
                                numberExpired: 5,
                                color: const Color.fromARGB(255, 233, 94, 30),
                              ),
                              ServiceTitle(
                                icon: Icons.network_cell,
                                serviceName: "Nhà mạng",
                                numberUse: 15,
                                numberExpiring: 10,
                                numberExpired: 5,
                                color: const Color.fromARGB(255, 233, 203, 30),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
