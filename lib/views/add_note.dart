import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:todo_test_api/providers/todo_provider.dart';

class AddNote extends StatefulWidget {
  const AddNote({Key? key}) : super(key: key);

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  TextEditingController _textEditingController = TextEditingController();
  bool? isCompleteValue = false;

  @override
  void dispose() {
    super.dispose();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _textEditingController,
            ),
            Checkbox(
                value: isCompleteValue,
                onChanged: (value) {
                  setState(() {
                    isCompleteValue = value;
                  });
                }),
            SizedBox(
              height: 100,
            ),
            TextButton(
                onPressed: () {
                  context.read<TodoProvider>().createNewNote(
                      _textEditingController.text, isCompleteValue);
                  context.pop();
                },
                child: Text("Create New Note"))
          ],
        ),
      ),
    );
  }
}
