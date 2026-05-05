import 'package:flutter/material.dart';

class Task {
  final String title;
  final String? time;
  final Color priorityColor;
  bool isDone;

  Task({
    required this.title,
    this.time,
    required this.priorityColor,
    this.isDone = false,
  });
}