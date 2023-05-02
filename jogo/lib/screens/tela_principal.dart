import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:jogo/characters/dinossaur.dart';
import 'package:jogo/decorations/chest.dart';
import 'package:jogo/decorations/mushroom.dart';
import 'package:jogo/enemys/bandit.dart';
import 'package:jogo/interfaces/player_interface.dart';

final double tileSize = 32;

class TelaPrincipal extends StatefulWidget {
  TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> implements GameListener {
  late GameController controller;
  bool playerReachedPoint = false;

  Dinossaur player = Dinossaur(
    Vector2(34 * tileSize, 24 * tileSize),
  );
  @override
  void initState() {
    controller = GameController()..addListener(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BonfireWidget(
      joystick: Joystick(
        directional: JoystickDirectional(),
      ),
      map: WorldMapByTiled(
        'map/FlorestIsland.json',
        forceTileSize: Vector2(tileSize, tileSize),
        objectsBuilder: {
          'spawn': (properties) => Bandit(
                properties.position,
              ),
          
          'chest': (properties) => Chest(
                properties.position,
              ),
          'mushroom': (properties) => Mushroom(
                properties.position,
              ),
        },
      ),
      cameraConfig: CameraConfig(moveOnlyMapArea: true, zoom: 2),
      player: player,
      overlayBuilderMap: {
        PlayerInterface.overlayKey: (context, game) =>
            PlayerInterface(game: game, dino: player),
      },
      initialActiveOverlays: const [
        PlayerInterface.overlayKey,
      ],
    );
  }

  @override
  void changeCountLiveEnemies(int count) {
    // TODO: implement changeCountLiveEnemies
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

  @override
  void updateGame() {}
}
