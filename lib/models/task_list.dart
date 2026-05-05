import 'package:flutter/material.dart';
import 'task.dart';

class TaskList {
  final String name;
  final Color color;
  final List<Task> tasks;

  TaskList({
    required this.name,
    required this.color,
    required this.tasks,
  });
}