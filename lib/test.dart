import 'package:amazzon/common/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [BottomBar()],
      ),
    );
  }
}

// class MainScreen extends StatefulWidget {
//   @override
//   _MainScreenState createState() => _MainScreenState();
// }

// class _MainScreenState extends State<MainScreen> {
//   int _selectedIndex = 0;

//   final List<Widget> _screens = [
//     HomeScreen(),
//     NestedContainerScreen(),
//     SettingsScreen(),
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Main Screen'),
//       ),
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _selectedIndex,
//         onTap: _onItemTapped,
//         items: [
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.layers),
//             label: 'Nested',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.settings),
//             label: 'Settings',
//           ),
//         ],
//       ),
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Home Screen'));
//   }
// }

// class SettingsScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Settings Screen'));
//   }
// }

// class NestedContainerScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Metadata Before Container',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//           Container(
//             height: 400,
//             margin: const EdgeInsets.symmetric(horizontal: 16.0),
//             decoration: BoxDecoration(
//               border: Border.all(color: Colors.blueAccent),
//               borderRadius: BorderRadius.circular(8.0),
//             ),
//             child: NestedScreen(),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Text(
//               'Metadata After Container',
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NestedScreen extends StatefulWidget {
//   @override
//   _NestedScreenState createState() => _NestedScreenState();
// }

// class _NestedScreenState extends State<NestedScreen> {
//   int _nestedSelectedIndex = 0;

//   final List<Widget> _nestedScreens = [
//     NestedScreenOne(),
//     NestedScreenTwo(),
//     NestedScreenThree(),
//   ];

//   void _onNestedItemTapped(int index) {
//     setState(() {
//       _nestedSelectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: [
//           Expanded(
//             child: _nestedScreens[_nestedSelectedIndex],
//           ),
//           BottomNavigationBar(
//             currentIndex: _nestedSelectedIndex,
//             onTap: _onNestedItemTapped,
//             items: [
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.looks_one),
//                 label: 'Screen 1',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.looks_two),
//                 label: 'Screen 2',
//               ),
//               BottomNavigationBarItem(
//                 icon: Icon(Icons.looks_3),
//                 label: 'Screen 3',
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }

// class NestedScreenOne extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Nested Screen 1 Content'));
//   }
// }

// class NestedScreenTwo extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Nested Screen 2 Content'));
//   }
// }

// class NestedScreenThree extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Center(child: Text('Nested Screen 3 Content'));
//   }
// }
