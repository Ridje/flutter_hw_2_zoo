import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {

  final String title;

  const DetailsPage({super.key, required this.title});
  
  @override
  State<StatefulWidget> createState() {
    return _DetailsPageState();
  }

}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const Center(
      ),
    );
  }
}