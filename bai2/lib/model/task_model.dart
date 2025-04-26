class Task {                            // Lớp Task đại diện cho một tác vụ trong hệ thống quản lý tác vụ
  final String? id;
  final String title;
  final String description;
  final String category;
  final String status;
  final String priority;
  final String dueDate;
  final List<Subtask> subtasks;
  final List<Attachment> attachments;

  Task({
    this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.priority,
    required this.dueDate,
    required this.subtasks,
    required this.attachments,
  });

  factory Task.fromJson(Map<String, dynamic> json) {      // Phương thức fromJson là một factory method. Nó nhận vào một Map<String, dynamic> (dữ liệu JSON) và trả về một đối tượng Task
    return Task(
      /* Các thuộc tính không bắt buộc như id, title, description, category, status, priority,và dueDate được lấy từ JSON
       và nếu không có trong JSON, chúng sẽ có giá trị mặc định như chuỗi rỗng ('').
       subtasks và attachments là các danh sách. Nếu không có trong JSON, chúng sẽ được khởi tạo là danh sách rỗng ([]). */
      id: json['id']?.toString(),
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      category: json['category'] ?? '',
      status: json['status'] ?? '',
      priority: json['priority'] ?? '',
      dueDate: json['dueDate'] ?? '',
      subtasks: (json['subtasks'] as List<dynamic>?)
          ?.map((subtask) => Subtask.fromJson(subtask))
          .toList() ??
          [],
          attachments: (json['attachments'] as List<dynamic>?)
          ?.map((attachment) => Attachment.fromJson(attachment))
          .toList() ??
          [],
    );//
  }
}

// CÁC CÔNG VIỆC CON
class Subtask {                 // Lớp Subtask đại diện cho một công việc con trong một tác vụ
  final String title;           // title: Tiêu đề của công việc con
  final bool isCompleted;       // isCompleted: Trạng thái hoàn thành của công việc con (true nếu đã hoàn thành, false nếu chưa).

  Subtask({required this.title, required this.isCompleted});

  factory Subtask.fromJson(Map<String, dynamic> json) {
    return Subtask(
      title: json['title'] ?? '',
      isCompleted: json['isCompleted'] ?? false,
    );
  }
}

class Attachment {        // Lớp Attachment đại diện cho một tệp đính kèm của tác vụ
  final String fileName;      // fileName: Tên tệp đính kèm.

  Attachment({required this.fileName});

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      fileName: json['fileName'] ?? '',
    );
  }
}