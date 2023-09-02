import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

Widget buildCustomMetricRow(
    String value, String title, int isSelected, selectedIndex) {
  final color = isSelected == selectedIndex
      ? const Color.fromARGB(255, 8, 85, 148)
      : const Color.fromARGB(255, 33, 150, 243);

  return Container(
    width: 90,
    height: 80, // Adjust the height as needed
    decoration: BoxDecoration(
      color: color,
      borderRadius: BorderRadius.circular(16),
    ),
    child: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: 'Urbanist',
            ),
          ),
          SizedBox(height: 8),
          Text(
            value,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontFamily: 'Urbanist',
            ),
          ),
        ],
      ),
    ),
  );
}




// List<Widget> _room = <Widget>[Mypost(), Sport(),  Tech(),Politics(),];?
//   var cats = ['All', 'Sports', 'Tech', 'Politics'];
  
//   int _currentPage = 0;

// Container(
//               height: 90,
//               padding: EdgeInsets.only(bottom: 15),
//               child: ListView.builder(
//                   scrollDirection: Axis.horizontal,
//                   itemCount: 4,
//                   itemBuilder: (ctx, index) {
//                     return Container(
//                       // color: _currentPage == index?Color.fromRGBO(55, 106, 237, 1): null,
//                       margin: const EdgeInsets.symmetric(
//                           horizontal: 20, vertical: 20),
//                       decoration: BoxDecoration(
//                         color: _currentPage == index?Color.fromRGBO(55, 106, 237, 1): null,
//                         borderRadius: BorderRadius.circular(12),
//                         border: Border.all(color: Color.fromRGBO(55, 106, 237, 1),width: 2)
//                       ),
//                       child: TextButton(
//                         onPressed: () {
//                           setState(() {
//                             _currentPage = index;
//                             print(_currentPage);
//                           });
//                         },
//                         child: Text(cats[index],
//                           style: TextStyle(color: _currentPage == index? Colors.white: Color.fromRGBO(55, 106, 237, 1)),
//                         ),
//                       ),
//                     );

//                   }),
//             ),
//             Container(
//               child: _room[_currentPage],
//             )