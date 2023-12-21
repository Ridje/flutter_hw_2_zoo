import 'dart:async';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

class ProgressButton extends StatefulWidget {
  final AudioPlayer player = AudioPlayer();
  final void Function() onPressed;
  final String buttonText;
  final String soundPath;

  ProgressButton(
      {super.key,
      required this.onPressed,
      required this.buttonText,
      required this.soundPath});

  void _handleTap() {
    playSound(soundPath);
    onPressed();
  }

  @override
  _ProgressButtonState createState() => _ProgressButtonState();

  Future<void> playSound(String localPath) async {
    await player.play(AssetSource(localPath));
  }
}

class _ProgressButtonState extends State<ProgressButton> {
  bool play = false;
  Duration currentPosition = const Duration(milliseconds: 0);
  Duration duration = const Duration(milliseconds: 0);
  final List<StreamSubscription> _listeners = [];

  void listenState() async {
    _listeners.add(widget.player.onPlayerStateChanged.listen((playState) {
      setState(() {
        switch (playState) {
          case PlayerState.playing:
            play = true;
          case PlayerState.completed:
            currentPosition = duration;  
          default:
            play = false;
        }
      });
    }));

    _listeners.add(widget.player.onPositionChanged.listen((position) {
      setState(() {
        currentPosition = position;
      });
    }));

    _listeners.add(widget.player.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    }));
  }

  @override
  void dispose() {
    disposeMediaListener();
    widget.player.dispose();
    super.dispose();
  }

  Future<void> disposeMediaListener() async {
    List<Future> cancels = [];
    for (final listener in _listeners) {
      cancels.add(listener.cancel());
    }
    await Future.wait(cancels);
  }

  @override
  void initState() {
    super.initState();
    listenState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: widget._handleTap,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
                height: 45,
                width: 120,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.indigo,
                      width: 1,
                    )),
                child: Stack(
                  children: <Widget>[
                    if (play)
                      AnimatedSize(
                          duration: const Duration(milliseconds: 200),
                          child: FractionallySizedBox(
                              widthFactor:
                                  calculateProgress(currentPosition, duration),
                              child: Container(
                                color: Colors.indigo,
                              ))),
                    Center(
                        child: Text('Sound: ${widget.buttonText}',
                            style: Theme.of(context).textTheme.bodyMedium)),
                  ],
                ))),
      ),
    );
  }

  double calculateProgress(Duration alreadyPlayed, Duration fullLength) {
    if (fullLength.inMilliseconds == 0) {
      return 0.0;
    }

    double percentage =
        (alreadyPlayed.inMilliseconds / fullLength.inMilliseconds);
    var result = percentage.clamp(0.0, 1.0);
    return result;
  }
}
