import 'package:bonfire/bonfire.dart';
import 'package:jogo/decorations/decoration_sprite_sheet.dart';
import 'package:jogo/decorations/mushroom.dart';

class Chest extends SimpleEnemy with ObjectCollision {
  Chest(Vector2 position)
      : super(
          position: position,
          size: Vector2(16, 32),
          speed: 0,
          life: 1,
          animation: SimpleDirectionAnimation(
            idleRight: DecorationSpriteSheet.chest,
            runRight: DecorationSpriteSheet.chest,
            idleLeft: DecorationSpriteSheet.chest,
            runLeft: DecorationSpriteSheet.chest,
          ),
        ) {
    setupCollision(
      CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(12, 8),
            align: Vector2(2, 20),
          ),
        ],
      ),
    );
  }

  @override
  void die() {
    removeFromParent();
    gameRef.add(Mushroom(position + Vector2(0, 10)));
    super.die();
  }

  @override
  void update(double dt) {
    super.update(dt);
  }
}
