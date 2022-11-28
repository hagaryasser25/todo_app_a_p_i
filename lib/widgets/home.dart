import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_a_p_i/screens/add_todo.dart';

import '../provider/todo_provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<TodoProvider>(context, listen: false).getAllTodos();
    final delete = Provider.of<TodoProvider>(context, listen: false);
    var data = Provider.of<TodoProvider>(context).memes;
    return Scaffold(
        appBar: AppBar(
          title: Align(
              alignment: Alignment.center,
              child: Text(
                'Todo List',
              )),
        ),
        floatingActionButton: Container(
          width: 100,
          height: 40,
          child: FloatingActionButton.extended(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AddTodo()));
              },
              label: Text('Add Todo')),
        ),
        body: ListView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return ListTile(
                leading: CircleAvatar(child: Text('${index + 1}')),
                title: Text(data[index].title),
                subtitle: Text(data[index].description),
                trailing: IconButton(
                    onPressed: () {
                      final id = data[index].id;
                      delete.deleteTodoo(id);
                    },
                    icon: Icon(Icons.delete)));
          },
               
        ));
  }
}
