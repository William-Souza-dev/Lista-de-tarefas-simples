import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lista_de_tarefa/models/todo.dart';

class TodoListItem extends StatefulWidget {
  const TodoListItem({Key? key, required this.todo, required this.onDelete})
      : super(key: key);

  final Todo todo;
  final Function(Todo) onDelete;

  @override
  State<TodoListItem> createState() => _TodoListItemState();
}

class _TodoListItemState extends State<TodoListItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Slidable(
        key: const ValueKey(Todo),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: Colors.grey[200],
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                DateFormat('dd/MM/yyyy - HH:mm').format(widget.todo.dateTime),
                style: const TextStyle(
                  fontSize: 12,
                ),
              ),
              Text(
                widget.todo.title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        endActionPane: ActionPane(
            dismissible: DismissiblePane(
              onDismissed: () {
                widget.onDelete(widget.todo);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        'Tarefa ${widget.todo.title} foi removida com sucesso!'),
                    action: SnackBarAction(
                      label: 'Desfazer',
                      textColor: const Color(0xff00d7f3),
                      onPressed: () {},
                    ),
                  ),
                );
              },
            ),
            motion: ScrollMotion(),
            children: [
              SlidableAction(
                  backgroundColor: Colors.red,
                  label: 'Deletar',
                  icon: Icons.delete,
                  onPressed: (context) {
                    widget.onDelete(widget.todo);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                            'Tarefa ${widget.todo.title} foi removida com sucesso!'),
                        action: SnackBarAction(
                          label: 'Desfazer',
                          textColor: const Color(0xff00d7f3),
                          onPressed: () {},
                        ),
                      ),
                    );
                  }),
            ]),
      ),
    );
  }
}
