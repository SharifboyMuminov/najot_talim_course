import 'package:default_project/view_models/count_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OneScreen extends StatefulWidget {
  const OneScreen({super.key});

  @override
  State<OneScreen> createState() => _OneScreenState();
}

class _OneScreenState extends State<OneScreen> {
  @override
  void initState() {
    // Future.microtask(() {
    //   context.read<CountViewModel>().increment();
    // });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<CountViewModel>(
          builder: (context, value, child) {
            return Text(
              value.count.toString(),
              style: const TextStyle(fontSize: 22),
            );
          },
        ),
      ),
    );
  }
}
