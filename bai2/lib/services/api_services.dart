import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:bai2/model/task_model.dart';

class ApiService {
  static Future<List<Task>> fetchTasks(BuildContext context) async {
    try {
      final response = await http.get(Uri.parse('https://amock.io/api/researchUTH/tasks'));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final List<dynamic> tasksJson = jsonResponse['data'];
        return tasksJson.map((json) => Task.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load tasks: ${response.statusCode}');
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error fetching tasks: $e')),
        );
      }
      return [];
    }
  }

  static Future<Task?> fetchTaskDetails(BuildContext context, String taskId) async {
    try {
      final response = await http.get(Uri.parse('https://amock.io/api/researchUTH/task/$taskId'));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final taskJson = jsonResponse['data'];
        return Task.fromJson(taskJson);
      } else {
        throw Exception('Failed to load task details: ${response.statusCode}');
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error fetching task details: $e')),
        );
      }
      return null;
    }
  }


  static Future<bool> deleteTask(BuildContext context, String taskId) async {
    try {
      final response = await http.delete(
        Uri.parse('https://amock.io/api/researchUTH/task/$taskId'),
      );
      if (response.statusCode == 200 || response.statusCode == 204) {
        return true;
      } else {
        throw Exception('Failed to delete task: ${response.statusCode}');
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error deleting task: $e')),
        );
      }
      return false;
    }
  }
}



