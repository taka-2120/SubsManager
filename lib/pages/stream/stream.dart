import 'package:flutter/material.dart';
import '../../globals.dart' as globals;

class Stream extends StatelessWidget {
  const Stream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const StreamPage();
  }
}

class StreamPage extends StatefulWidget {
  const StreamPage({Key? key}) : super(key: key);

  @override
  State<StreamPage> createState() => _StreamState();
}

class _StreamState extends State<StreamPage> {
  void _add() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Text(globals.stream,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
