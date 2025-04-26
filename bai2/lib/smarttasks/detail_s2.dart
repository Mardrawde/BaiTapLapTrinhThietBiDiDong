import 'package:flutter/material.dart';
import 'package:bai2/model/task_model.dart';
import 'package:bai2/services/api_services.dart';
import 'package:bai2/smarttasks/list_empty.dart';

class Detail extends StatefulWidget {
  final Task task;
  const Detail({required this.task, Key? key}) : super(key: key);

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  late Future<Task?> futureTask;

  @override
  void initState() {
    super.initState();
    _fetchTaskDetails();
  }

  void _fetchTaskDetails() {
    if (widget.task.id != null) {
      futureTask = ApiService.fetchTaskDetails(context, widget.task.id!);
    } else {
      futureTask = Future.value(null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<Task?>(
      future: futureTask,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else if (snapshot.hasError || snapshot.data == null) {
          // Điều hướng về ListEmpty thay vì hiển thị lỗi
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ListEmpty()),
            );
          });
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()), // Hiển thị tạm thời trong khi điều hướng
          );
        }

        Task task = snapshot.data!;

        return Scaffold(
          body: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(
                      top: screenHeight * 0.05,
                      left: screenWidth * 0.03,
                      right: screenWidth * 0.04),
                  child: Row(
                    children: [
                      Center(
                        child: IconButton(
                          onPressed: () => Navigator.pop(context),
                          icon: const Icon(Icons.arrow_back_ios_new_rounded,
                              size: 20),
                          style: IconButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      const Expanded(
                        child: Text(
                          'Detail',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          if (task.id != null) {
                            bool success =
                            await ApiService.deleteTask(context, task.id!);
                            if (success) {
                              Navigator.pop(context);
                            }
                          }
                        },
                        icon: Image.asset('assets/Image/Recycle_Bin.png'),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.01),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        style: TextStyle(
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.001),
                      Text(
                        task.description,
                        style: TextStyle(
                          fontSize: screenWidth * 0.045,
                          color: Colors.grey[700],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Container(
                        padding: EdgeInsets.all(screenWidth * 0.045),
                        decoration: BoxDecoration(
                          color: Colors.pink[100],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            _buildInfoColumn(
                              const ImageIcon(
                                  AssetImage('assets/Image/category.png')),
                              "Category",
                              task.category,
                            ),
                            _buildInfoColumn(
                              const ImageIcon(
                                  AssetImage('assets/Image/Status.png')),
                              "Status",
                              task.status,
                            ),
                            _buildInfoColumn(
                              const ImageIcon(
                                  AssetImage('assets/Image/Priority.png')),
                              "Priority",
                              task.priority,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      const Text(
                        "Subtasks",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      ...task.subtasks
                          .map((subtask) => _buildSubtaskItem(subtask)),
                      SizedBox(height: screenHeight * 0.01),
                      const Text(
                        "Attachments",
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      ...task.attachments
                          .map((attachment) => _buildAttachmentItem(attachment)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSubtaskItem(Subtask subtask) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: subtask.isCompleted,
            onChanged: (bool? value) {},
          ),
          Expanded(
            child: Text(
              subtask.title,
              style: const TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAttachmentItem(Attachment attachment) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(Icons.attach_file),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              attachment.fileName,
              style: const TextStyle(fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoColumn(Widget icon, String label, String value) {
    return Column(
      children: [
        icon,
        const SizedBox(height: 4),
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}