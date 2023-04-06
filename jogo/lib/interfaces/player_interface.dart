import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dart:async' as async;

import 'package:jogo/characters/dinossaur.dart';

class PlayerInterface extends StatefulWidget {
  static const overlayKey = 'playerInterface';
  final BonfireGame game;
  final Dinossaur dino;
  const PlayerInterface({Key? key, required this.game, required this.dino})
      : super(key: key);

  @override
  _PlayerInterfaceState createState() => _PlayerInterfaceState();
}

class _PlayerInterfaceState extends State<PlayerInterface> {
  double experience = 0;
  final double widthMax = 200;
  double widthCurrent = 0;
  late async.Timer _lifeTime;

  @override
  void initState() {
    _lifeTime =
        async.Timer.periodic(const Duration(milliseconds: 100), _verifyXp);

    super.initState();
  }

  @override
  void dispose() {
    _lifeTime.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${widget.dino.nivel}",
          style: const TextStyle(
            color: Colors.black,
            fontSize: 24,
            decoration: TextDecoration.none,
          ),
        ),
        Stack(
          children: [
            Container(
              margin: const EdgeInsets.all(10),
              width: widthMax,
              height: 30,
              color: Colors.black,
            ),
            Container(
              margin: const EdgeInsets.all(15),
              width:
                  widthCurrent > widthMax - 10 ? widthMax - 10 : widthCurrent,
              height: 20,
              color: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }

  void _verifyXp(async.Timer timer) {
    if (experience != widget.dino.experience) {
      setState(() {
        experience = widget.dino.experience;

        final percent = experience / 100;

        widthCurrent = widthMax * percent;
      });
    }
  }
}
