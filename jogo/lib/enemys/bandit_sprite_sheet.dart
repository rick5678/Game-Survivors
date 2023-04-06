import 'package:bonfire/bonfire.dart';

class BanditSpriteSheet {
  Future<SpriteAnimation> get idleLeft => SpriteAnimation.load(
        'bandit_left.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(128, 32),
        ),
      );

  Future<SpriteAnimation> get idleRight => SpriteAnimation.load(
        'bandit_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 32),
        ),
      );

  Future<SpriteAnimation> get runRight => SpriteAnimation.load(
        'bandit_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 32),
        ),
      );

  Future<SpriteAnimation> get runLeft => SpriteAnimation.load(
        'bandit_left.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.15,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(128, 32),
        ),
      );

  Future<SpriteAnimation> get recieveDamageRight => SpriteAnimation.load(
        'bandit_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.15,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 224),
        ),
      );

  Future<SpriteAnimation> get recieveDamageLeft => SpriteAnimation.load(
        'bandit_left.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.15,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(160, 224),
        ),
      );

  static Future<Sprite> get xpDrop => Sprite.load(
        'banditDust_.png',
        srcSize: Vector2(2, 2),
        srcPosition: Vector2(158, 32),
      );
}
