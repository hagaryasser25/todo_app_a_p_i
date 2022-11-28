import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';

import '../models/todo.dart';
import '../provider/todo_provider.dart';
import '../widgets/home.dart';

class AddTodo extends StatelessWidget {
  const AddTodo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();
    final TextEditingController descriptionController = TextEditingController();
    final TextEditingController idController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.only(
                right: 35,
              ),
              child: Text('Add Todo'),
            )),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          TextField(
            decoration: InputDecoration(hintText: 'Title'),
            controller: titleController,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'id'),
            controller: idController,
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            decoration: InputDecoration(hintText: 'Description'),
            controller: descriptionController,
            keyboardType: TextInputType.multiline,
            minLines: 5,
            maxLines: 8,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                final String title = titleController.text;
                final String description = descriptionController.text;
                final String id = idController.text;
                final provider =
                    Provider.of<TodoProvider>(context, listen: false);
                TodoModel data =
                    TodoModel(title: title, description: description,id:id);
                provider.addTodo(data);
                titleController.text = '';
                descriptionController.text = '';
                idController.text = '';
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => const Home()),
                  (Route<dynamic> route) => false,
                );
              },
              child: Text('Submit'))
        ],
      ),
    );
  }
}
