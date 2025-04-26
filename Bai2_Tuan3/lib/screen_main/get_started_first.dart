import 'package:flutter/material.dart';

import 'get_started_second.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ScreenFirst(),
  ));
}

class ScreenFirst extends StatelessWidget {
  const ScreenFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Indicator (3 chấm)
                Row(
                  children: [
                    _buildDot(true),
                    const SizedBox(width: 5),
                    _buildDot(false),
                    const SizedBox(width: 5),
                    _buildDot(false),
                  ],
                ),

                // Skip text
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'skip',
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            // logo
            Image.asset(
              'assets/image1.png',
            ),

            const SizedBox(height: 50),
            //tiêu đề
            const Text(
              'Easy Time Management',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),
            //nội dung
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'With management based on priority and '
                    'daily tasks, it will give you convenience in '
                    'managing and determining the tasks that '
                    'must be done first ',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Spacer(),
            //Nút
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ScreenSecond()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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

  // Hàm tạo chấm tròn
  Widget _buildDot(bool isActive) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isActive ? Colors.blue : Colors.blue.withOpacity(0.3),
      ),
    );
  }
}
