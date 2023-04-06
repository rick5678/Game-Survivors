import 'package:bonfire/bonfire.dart';

class DecorationSpriteSheet {
  static Future<SpriteAnimation> get chest => SpriteAnimation.load(
        'map/forest_/forest_ [resources].png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 1,
          textureSize: Vector2(16, 32),
          texturePosition: Vector2(16, 80),
        ),
      );
  static Future<SpriteAnimation> get chestOpen => SpriteAnimation.load(
        'map/forest_/forest_ [resources].png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 1,
          textureSize: Vector2(16, 32),
          texturePosition: Vector2(32, 80),
        ),
      );

  static Future<Sprite> get lifeRegen => Sprite.load(
        'map/forest_/forest_ [resources].png',
        srcSize: Vector2(16, 16),
        srcPosition: Vector2(160, 16),
      );
}
