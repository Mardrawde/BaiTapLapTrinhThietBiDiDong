import 'package:flutter/material.dart';

class Layout_Row extends StatelessWidget {
  const Layout_Row({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30.0,right: 90),
            child: Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);  // Quay lại màn hình trước
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.black, size: 35),
                ),
              ),
            ),
          ),


          // Padding(
          //   padding: const EdgeInsets.fromLTRB(20,120,0,0),
          //   child: Row(
          //     children: <Widget>[
          //       Text(
          //         'Nguyen Van A',
          //         style: TextStyle(
          //           fontSize: 25,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       SizedBox(width: 10),
          //       Text(
          //         'Nguyen Van B',
          //         style: TextStyle(
          //           fontSize: 25,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       )
          //     ],
          //   ),
          // )


          /*
              - Wrap tự động xuống dòng theo chiều dọc hoặc ngang ( khi hết không gian)
           */
          Padding(
            padding: const EdgeInsets.fromLTRB(20,120,0,0),
            child: Wrap(
                direction: Axis.horizontal,
                children: <Widget>[
                Text(
                  'Nguyen Van A',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Nguyen Van B',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Nguyen Van C',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ]
            ),
          )
        ],
      ),
    );
  }
}
