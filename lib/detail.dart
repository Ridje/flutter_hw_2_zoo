import 'package:flutter/material.dart';
import 'package:flutter_hw_2_zoo/mocked_data.dart';
import 'package:flutter_hw_2_zoo/progress_button.dart';

class DetailsPage extends StatefulWidget {
  final Animal animal;

  const DetailsPage({super.key, required this.animal});

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
          title: Text(
              "Look, it's a ${widget.animal.name}! ${widget.animal.sound}!!"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(16.0),
            // child: Hero(
            //     tag: 'TEST${widget.animal.id}',
                child: Card(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.asset(
                          widget.animal.imageUrl,
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                        Padding(
                            padding: const EdgeInsetsDirectional.all(16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name: ${widget.animal.name}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  'Description: ${widget.animal.description}',
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                const SizedBox(height: 8),
                                ProgressButton(
                                  onPressed: () => {},
                                  buttonText: widget.animal.sound,
                                  soundPath: widget.animal.soundPath
                                ),
                              ],
                            )),
                      ]),
                ))
                // )
                );
  }
}
