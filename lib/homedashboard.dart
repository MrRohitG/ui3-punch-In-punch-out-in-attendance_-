import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui3/attend1.dart'; // Ensure you have this widget defined

class MainDash extends StatefulWidget {
  const MainDash({super.key});

  @override
  State<MainDash> createState() => _MainDashState();
}

class _MainDashState extends State<MainDash> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(child: Text('Main Content Here', style: TextStyle(fontSize: 24))),
    Center(child: Text('To-Do Page', style: TextStyle(fontSize: 24))),
    Atted1(), // Replace with your Attend1 widget
    Center(child: Text('Timesheet Page', style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Container(
            width: 400,
            color: Colors.yellow[50],
            child: Column(
              children: [
                Expanded(
                  child: _pages[_selectedIndex],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        width: 400,
        child: Container(
          height: 70.3,
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border(
              top: BorderSide(
                width: 1.0,
                color: Colors.white,
              ),
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => _onItemTapped(0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        'assets/images/sites.png',
                        height: 38,
                        width: 42,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _onItemTapped(1),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/todo.png",
                        height: 38,
                        width: 42,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _onItemTapped(2),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Container(
                            padding: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Image.asset(
                                  "assets/images/attendence2.png",
                                  height: 18,
                                  width: 42,
                                  color: Color.fromARGB(200, 255, 255, 255),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  "Attendance",
                                  style: GoogleFonts.poppins(
                                    fontSize: 8,
                                    color: Color.fromARGB(100, 255, 255, 255),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () => _onItemTapped(3),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset(
                        "assets/images/timesheet.png",
                        height: 38,
                        width: 42,
                      ),
                      SizedBox(
                        height: 2,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
