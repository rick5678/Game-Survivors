import 'package:bonfire/bonfire.dart';
import 'package:jogo/characters/dinossaur.dart';
import 'package:jogo/enemys/bandit_sprite_sheet.dart';

class BanditDust extends GameDecoration with Sensor {
  BanditDust(Vector2 position)
      : super.withSprite(
          sprite: BanditSpriteSheet.xpDrop,
          position: position,
          size: Vector2(6, 6),
        );

  @override
  void onContact(GameComponent component) {
    if (component is Dinossaur) {
      component.pegarExperiencia(120);
      removeFromParent();
    }
  }
}
