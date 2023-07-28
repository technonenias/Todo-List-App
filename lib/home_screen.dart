import 'package:flutter/material.dart';

import 'package:todo_list_app/data/models/task_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController titleController = TextEditingController();

  List<TaskModel> tasks = List.empty(growable: true);

  int selectedIndex = -1;

  bool isshow = false;

  @override
  Widget build(context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 12, 130, 226),
      ),
      child: Center(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              width: 400,
              height: 100,
              color: const Color.fromARGB(255, 20, 5, 235),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    width: 330,
                    height: 100,
                    child: Center(
                      child: Text(
                        "ToDo List",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 236, 229, 229)),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Center(
                      child: IconButton(
                        icon: const Icon(
                          Icons.add_circle,
                          color: Color.fromARGB(255, 236, 229, 229),
                          size: 40,
                        ),
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset("assets/images/rocket.jpg"),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      SizedBox(
                                        width: 370,
                                        child: TextField(
                                          controller: titleController,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(),
                                            hintText: 'Add new task',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  actions: <Widget>[
                                    Row(
                                      children: [
                                        const SizedBox(
                                          width: 145,
                                        ),
                                        Column(
                                          children: [
                                            Row(
                                              children: [
                                                TextButton(
                                                  onPressed: () {
                                                    String title =
                                                        titleController.text
                                                            .trim();

                                                    if (title.isNotEmpty) {
                                                      setState(() {
                                                        titleController.text =
                                                            '';

                                                        tasks.add(
                                                            TaskModel(title));
                                                      });
                                                    }
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: const Text(
                                                    "Add Task",
                                                    style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color.fromARGB(
                                                          255, 12, 130, 226),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        TextButton(
                                          child: const Text(
                                            'Cancel',
                                            style: TextStyle(
                                              fontSize: 15,
                                              color: Color.fromARGB(
                                                  255, 12, 130, 226),
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      ],
                                    )
                                  ],
                                );
                              });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            tasks.isEmpty
                ? const Text(
                    'No tasks yet..',
                    style: TextStyle(
                        fontSize: 22, color: Color.fromARGB(255, 20, 5, 235)),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) => getRow(index),
                    ),
                  )
          ],
        ),
      ),
    );
  }

  Widget getRow(int index) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor:
              index % 2 == 0 ? Colors.deepPurpleAccent : Colors.purple,
          foregroundColor: const Color.fromARGB(255, 236, 229, 229),
          child: Text(
            tasks[index].title[0],
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tasks[index].title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        trailing: SizedBox(
          width: 30,
          child: Row(
            children: [
              InkWell(
                  onTap: (() {
                    //
                    setState(() {
                      tasks.removeAt(index);
                    });
                    //
                  }),
                  child: const Icon(Icons.delete)),
            ],
          ),
        ),
      ),
    );
  }
}
