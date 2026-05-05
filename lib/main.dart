import 'package:flutter/material.dart';
import 'models/task.dart';
import 'models/task_list.dart';
import 'widgets/task_item.dart';
import 'widgets/list_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Lab 2',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F5F9),
      ),
      home: const HomeScreen(),
    );
  }
}

final List<Task> sampleTasks = [
  Task(
    title: 'Поснідати',
    time: '09:00',
    priorityColor: Colors.red,
    isDone: true,
  ),
  Task(
    title: 'Прийти в універ',
    time: '11:30',
    priorityColor: Colors.orange,
  ),
  Task(
    title: 'Купити продукти',
    priorityColor: Colors.green,
  ),
  Task(
    title: 'Зателефонувати батькам',
    time: '18:00',
    priorityColor: Colors.blue,
  ),
  Task(
    title: 'Підготувати звіт',
    time: '20:00',
    priorityColor: Colors.red,
  ),
  Task(
    title: 'Вечеря з родиною',
    time: '19:00',
    priorityColor: Colors.orange,
  ),
];

final List<TaskList> sampleLists = [
  TaskList(
    name: 'Inbox',
    color: const Color(0xFF5C6BC0),
    tasks: [sampleTasks[0], sampleTasks[1]],
  ),
  TaskList(
    name: 'Work',
    color: const Color(0xFFEF5350),
    tasks: [sampleTasks[1], sampleTasks[4]],
  ),
  TaskList(
    name: 'Shopping',
    color: const Color(0xFF26A69A),
    tasks: [sampleTasks[2]],
  ),
  TaskList(
    name: 'Family',
    color: const Color(0xFFFF7043),
    tasks: [sampleTasks[3], sampleTasks[5]],
  ),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _toggleTask(int index) {
    setState(() {
      sampleTasks[index].isDone = !sampleTasks[index].isDone;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Мої задачі',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color(0xFF3F51B5),
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 20, 16, 12),
              child: Text(
                'Lists',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(
              height: 140,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(left: 16),
                itemCount: sampleLists.length,
                itemBuilder: (context, index) {
                  return ListCard(taskList: sampleLists[index]);
                },
              ),
            ),

            const Padding(
              padding: EdgeInsets.fromLTRB(16, 24, 16, 12),
              child: Text(
                'Today',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: sampleTasks.length,
              itemBuilder: (context, index) {
                return TaskItem(
                  task: sampleTasks[index],
                  onToggle: () => _toggleTask(index),
                );
              },
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}