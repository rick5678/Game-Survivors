import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:jogo/characters/dinossaur.dart';
import 'package:jogo/enemys/bandit.dart';

final double tileSize = 32;

class TelaPrincipal extends StatelessWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

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
        },
      ),
      cameraConfig: CameraConfig(moveOnlyMapArea: true, zoom: 2),
      player: Dinossaur(Vector2(34 * tileSize, 24 * tileSize)),
      
    );
  }
}
