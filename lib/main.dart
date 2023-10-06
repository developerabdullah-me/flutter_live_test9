// import 'package:flutter/material.dart';
// import 'package:livetes9/HomeScreen.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//     );
//   }
// }


import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Create a variable to store the selected button color
  Color _selectedColor = Colors.grey;

  // Create a variable to store the selected Size text
  String _selectedSize = "";

  // Define button colors
  List<Color> buttonColors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange,
    Colors.purple,
  ];

  // Define button sizes
  List<String> buttonSizes = ["Small", "Medium", "Large", "X-Large", "XX-Large", "XXX-Large"];

  // Function to handle button tap
  void _handleButtonTap(int index) {
    setState(() {
      // Update the selected color
      _selectedColor = buttonColors[index];
      // Update the selected size text
      _selectedSize = buttonSizes[index];
    });

    // Show a Snackbar with the selected Size text
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Selected Size: $_selectedSize'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Button Color Change and Snackbar'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                for (int i = 0; i < 5; i++)
                  ElevatedButton(
                    onPressed: () {
                      _handleButtonTap(i);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: _selectedColor == buttonColors[i]
                          ? Colors.grey
                          : buttonColors[i],
                    ),
                    child: Text(
                      buttonSizes[i],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
            SizedBox(height: 20),
            Wrap(
              alignment: WrapAlignment.spaceEvenly,
              children: <Widget>[
                for (int i = 5; i < buttonColors.length; i++)
                  ElevatedButton(
                    onPressed: () {
                      _handleButtonTap(i);
                    },
                    style: ElevatedButton.styleFrom(
                      primary: _selectedColor == buttonColors[i]
                          ? Colors.grey
                          : buttonColors[i],
                    ),
                    child: Text(
                      buttonSizes[i],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}


