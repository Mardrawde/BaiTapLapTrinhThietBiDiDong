import 'package:flutter/material.dart';
import 'get_started_first.dart';
import 'get_started_second.dart';

void main(List<String> args) {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ScreenThird(),
  ));
}

class ScreenThird extends StatelessWidget {
  const ScreenThird({super.key});

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
                    _buildDot(false),
                    const SizedBox(width: 5),
                    _buildDot(false),
                    const SizedBox(width: 5),
                    _buildDot(true), // Chấm tròn thứ 3 sáng lên vì đang ở ScreenThird
                  ],
                ),

                // Skip text
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ScreenSecond()),
                    );
                  },
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
            Image.asset('assets/image3.png'),

            const SizedBox(height: 50),
            // tiêu đề
            const Text(
              'Reminder Notification',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),
            // nội dung
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'The advantage of this application is that it '
                    'also provides reminders for you so you '
                    'don\'t forget to keep doing your '
                    'assignments well and according to the '
                    'time you have set',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ),
            const Spacer(),

            // Nút điều hướng
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Nút Back
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const ScreenSecond()),
                      );
                    },
                    child: Container(
                      width: 50,
                      height: 50,
                      decoration: const BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                  ),

                  const SizedBox(width: 20),

                  // Nút Get Started
                  Expanded(
                    child: SizedBox(
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const ScreenFirst()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: const Text(
                          "Get Started",
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
