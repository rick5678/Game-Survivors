import 'dart:ui';

import 'package:bonfire/bonfire.dart';
import 'package:jogo/characters/player_sprite_sheet.dart';
import 'package:jogo/enemys/bandit_dust.dart';
import 'package:jogo/enemys/bandit_sprite_sheet.dart';

BanditSpriteSheet bandit = BanditSpriteSheet();
PlayerSpriteSheet player = PlayerSpriteSheet();

class Bandit extends SimpleEnemy with ObjectCollision {
  static bool canMove = true;

  Bandit(Vector2 position)
      : super(
          position: position,
          size: Vector2(32, 32),
          speed: 40,
          animation: SimpleDirectionAnimation(
            idleRight: bandit.idleRight,
            runRight: bandit.runRight,
            idleLeft: bandit.idleLeft,
            runLeft: bandit.runLeft,
          ),
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
    if (canMove) {
      seeAndMoveToPlayer(
        closePlayer: (player) {
          _executeAttack();
        },
        radiusVision: 400,
        margin: 1,
      );
    }

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(canvas);
    super.render(canvas);
  }

  @override
  void die() {
    removeFromParent();
    gameRef.add(
      BanditDust(
        position + Vector2(10, 10),
      ),
    );

    super.die();
  }

  void _executeAttack() {
    simpleAttackMelee(
      damage: 10,
      size: Vector2(16, 16),
    );
  }
}
