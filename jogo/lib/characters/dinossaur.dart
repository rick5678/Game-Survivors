import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:jogo/characters/player_sprite_sheet.dart';

PlayerSpriteSheet player = PlayerSpriteSheet();

class Dinossaur extends SimplePlayer with ObjectCollision {
  double angulo = 0;
  Timer timer = Timer(100);
  bool canAttack = true;
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
    actionAttack();
    Future.delayed(const Duration(seconds: 2), () {
      canAttack = true;
    });

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(canvas);
    super.render(canvas);
  }

  void actionAttack() {
    Vector2 centerOffset = Vector2.zero();
    switch (lastDirection) {
      case Direction.left:
        centerOffset = Vector2(0, -10);
        angulo = 180;
        break;
      case Direction.right:
        centerOffset = Vector2(0, 10);
        angulo = 0;
        break;
      case Direction.up:
        centerOffset = Vector2(10, 0);
        angulo = 270;
        break;
      case Direction.down:
        centerOffset = Vector2(-10, 0);
        angulo = 90;
        break;
      case Direction.upLeft:
        centerOffset = Vector2(12, 0);
        angulo = 225;
        break;
      case Direction.upRight:
        centerOffset = Vector2(12, 0);
        angulo = 315;
        break;
      case Direction.downLeft:
        centerOffset = Vector2(-12, 0);
        angulo = 135;
        break;
      case Direction.downRight:
        centerOffset = Vector2(-12, 0);
        angulo = 45;
        break;
    }
    simpleAttackRangeByAngle(
      attackFrom: AttackFromEnum.PLAYER_OR_ALLY,
      angle: angulo,
      size: Vector2(16, 16),
      marginFromOrigin: 5,
      centerOffset: centerOffset,
      speed: 150,
      animation: Sprite.load('faquinha.png').toAnimation(),
      damage: 30,
    );
    canAttack = false;
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }
}
