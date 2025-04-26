import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'get_started_second.dart';
import 'get_started_third.dart';
import 'package:bai2/smarttasks/todo_list.dart';

void main() => runApp(MaterialApp(home: Get_Started_First()));

class Get_Started_First extends StatefulWidget {
  const Get_Started_First({super.key});

  @override
  State<Get_Started_First> createState() => _Get_Started_FirstState();
}

class _Get_Started_FirstState extends State<Get_Started_First> {
  final PageController _pageController = PageController();
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Get screen width and height for responsive design
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.043,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SmoothPageIndicator(
                  controller: _pageController,
                  count: 3,
                  effect: WormEffect(                   // WormEffect: Hiệu ứng từ chấm này sang chấm khác khi bạn chuyển trang (page)
                    activeDotColor: Colors.blue,
                    dotColor: Colors.grey,
                    dotHeight: screenWidth * 0.02, // Responsive dot height
                    dotWidth: screenWidth * 0.019, // Responsive dot width
                    spacing: screenWidth * 0.015, // Responsive spacing
                  ),
                ),
                TextButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      2,
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text(
                    "Skip",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // Responsive font size
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Content of the PageView
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: [
                buildPage(
                  image: 'assets/Image/portfolio.png',
                  title: 'Easy Time Management',
                  subtitle:
                  'With management based on priority and  daily tasks, it will give you convenience in managing and determining the tasks that  must be done first ',
                ),
                Get_Started_Second(),
                Get_Started_Third(),
              ],
            ),
          ),

          // Arrow + Next/Get Started Button
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.05,
              vertical: screenHeight * 0.03,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (currentIndex != 0) ...[
                  GestureDetector(
                    onTap: () {
                      _pageController.previousPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    child: Container(
                      width: screenWidth * 0.12, // Responsive width
                      height: screenWidth * 0.12, // Responsive height
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(Icons.arrow_back, color: Colors.white, size: screenWidth * 0.08),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.04),
                ],

                // Next / Get Started Button
                Expanded(
                  child: SizedBox(
                    height: screenHeight * 0.07, // Responsive button height
                    child: ElevatedButton(
                      onPressed: () {
                        if (currentIndex < 2) {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => TodoList()),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        currentIndex < 2 ? "Next" : "Get Started",
                        style: TextStyle(
                          fontSize: screenWidth * 0.05, // Responsive font size
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
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
    );
  }

  // Page Content Builder
  Widget buildPage({
    required String image,
    required String title,
    required String subtitle,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(image, height: 200),
        SizedBox(height: 30),
        Text(
          title,
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }
}
