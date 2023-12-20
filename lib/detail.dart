import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hw_2_zoo/mocked_data.dart';

class DetailsPage extends StatefulWidget {
  final Animal animal;

  const DetailsPage({super.key, required this.animal});

  @override
  State<StatefulWidget> createState() {
    return _DetailsPageState();
  }
}

class _DetailsPageState extends State<DetailsPage> {
  final AudioPlayer player = AudioPlayer();

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

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
            child: Hero(
                tag: 'TEST${widget.animal.id}',
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
                                OutlinedButton(
                                    onPressed: () {
                                      playSound(widget.animal.soundPath);
                                    },
                                    child: Text('Sound: ${widget.animal.sound}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium)),
                              ],
                            )),
                      ]),
                ))));
  }

  Future<void> playSound(String localPath) async {
    await player.play(AssetSource(localPath));
  }
}
