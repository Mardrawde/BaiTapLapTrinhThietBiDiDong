import 'package:flutter/material.dart';
import 'package:bai2/model/task_model.dart';
import 'package:bai2/services/api_services.dart';
import 'package:bai2/smarttasks/list_empty.dart';
import 'package:bai2/smarttasks/detail_s2.dart';

class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late Future<List<Task>> futureTasks;

  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }

  void _fetchTasks() {
    futureTasks = ApiService.fetchTasks(context).then((tasks) {
      return tasks.where((t) => t.id != null).toList();
    }).catchError((error) {
      print("Error fetching data: $error");
      return [];
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Column(
        children: <Widget>[
          SizedBox(height: screenHeight * 0.05),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(width: screenWidth * 0.05),
              Image.asset(
                'assets/Image/UTH_todolist.png',
                width: screenWidth * 0.2,
                height: screenHeight * 0.1,
              ),
              SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'SmartTasks',
                    style: TextStyle(
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    'A simple and efficient to-do app',
                    style: TextStyle(
                      fontSize: screenWidth * 0.035,
                      color: Colors.blue,
                    ),
                  )
                ],
              ),
              SizedBox(
                width: screenWidth * 0.2,
                child: IconButton(
                  onPressed: () {},
                  icon: Image.asset('assets/Image/Notification.png'),
                ),
              )
            ],
          ),
          Expanded(
            child: FutureBuilder<List<Task>>(
              future: futureTasks,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.error, color: Colors.red, size: 40),
                        const SizedBox(height: 10),
                        const Text("Error loading data",
                            style: TextStyle(color: Colors.red, fontSize: 18)),
                        Text(snapshot.error.toString(),
                            textAlign: TextAlign.center),
                      ],
                    ),
                  );
                } else {
                  List<Task> tasks = snapshot.data ?? [];
                  if (tasks.isEmpty) {
                    return const ListEmpty();
                  }

                  final List<Color> taskColors = [
                    const Color(0xFFF48FB1),
                    const Color(0xFFC5E1A5),
                    const Color(0xFF4FC3F7),
                  ];

                  return ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      Task task = tasks[index];
                      Color bgColor = taskColors[index % taskColors.length];
                      return InkWell(
                        onTap: () {
                          if (task.id == null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ListEmpty()),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Detail(task: task),
                              ),
                            );
                          }
                        },
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.05, vertical: 8),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: bgColor,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Text(
                                  task.title,
                                  style: TextStyle(
                                      fontSize: screenWidth * 0.045,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              const SizedBox(height: 0),
                              Row(
                                children: <Widget>[
                                  Checkbox(
                                    value: task.subtasks.isNotEmpty &&
                                        task.subtasks[0].isCompleted,
                                    onChanged: (value) {},
                                    activeColor: Colors.black,
                                  ),
                                  Expanded(
                                    child: Text(
                                      task.description,
                                      style:
                                      TextStyle(fontSize: screenWidth * 0.038),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 1),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  RichText(
                                    text: TextSpan(
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.037,
                                          color: Colors.black),
                                      children: [
                                        const TextSpan(
                                          text: "Status: ",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                        TextSpan(text: task.status),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    task.dueDate,
                                    style: TextStyle(
                                        fontSize: screenWidth * 0.03,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
          SizedBox(height: screenHeight * 0.055),
          Padding(
            padding: EdgeInsets.only(bottom: screenHeight * 0.03),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: const [
                  BoxShadow(
                    spreadRadius: 2,
                    color: Colors.grey,
                    blurRadius: 10,
                  ),
                ],
              ),
              width: screenWidth * 0.9,
              height: screenHeight * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.home, size: screenWidth * 0.08),
                    style: IconButton.styleFrom(
                      foregroundColor: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.calendar_today_outlined,
                        size: screenWidth * 0.07),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.my_library_books_outlined,
                        size: screenWidth * 0.07),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.settings, size: screenWidth * 0.08),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.only(
            right: screenWidth * 0.35, bottom: screenHeight * 0.065),
        child: SizedBox(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(Icons.add, size: screenWidth * 0.08),
          ),
        ),
      ),
    );
  }
}