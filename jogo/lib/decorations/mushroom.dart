import 'package:bonfire/bonfire.dart';
import 'package:jogo/characters/dinossaur.dart';
import 'package:jogo/decorations/decoration_sprite_sheet.dart';

class Mushroom extends GameDecoration with Sensor {
  Mushroom(Vector2 position)
      : super.withSprite(
          sprite: DecorationSpriteSheet.lifeRegen,
          position: position,
          size: Vector2(16, 16),
        );

  @override
  void onContact(GameComponent component) {
    if (component is Dinossaur) {
      (component).addLife(20);
      removeFromParent();
    }
  }
}
