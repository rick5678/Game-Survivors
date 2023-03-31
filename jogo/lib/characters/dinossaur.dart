import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:jogo/characters/player_sprite_sheet.dart';

PlayerSpriteSheet player = PlayerSpriteSheet();

class Dinossaur extends SimplePlayer with ObjectCollision {
  double valor = 0;
  Dinossaur(Vector2 position)
      : super(
          position: position,
          size: Vector2(32, 32),
          animation: SimpleDirectionAnimation(
            idleRight: player.heroIdleRight,
            runRight: player.heroRunRight,
            idleLeft: player.heroIdleLeft,
            runLeft: player.heroRunLeft,
          ),
          speed: 50,
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(16, 20),
            align: Vector2(8, 8),
          )
        ],
      ),
    );
  }

  @override
  void update(double dt) {
    if (!checkInterval('attackRange', 1000, valor)) actionAttack();

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(canvas);
    super.render(canvas);
  }

  void actionAttack() {
    simpleAttackRange(
      size: Vector2(16, 16),
      speed: 100,
      animationRight: player.attackFly,
      animationLeft: player.attackFly,
      animationUp: player.attackFly,
      animationDown: player.attackFly,
      damage: 30,
    );
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }
}
