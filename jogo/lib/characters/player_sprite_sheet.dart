import 'package:bonfire/bonfire.dart';

class PlayerSpriteSheet {
  Future<SpriteAnimation> get heroIdleLeft => SpriteAnimation.load(
        'dinosaur_left.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(128, 0),
        ),
      );

  Future<SpriteAnimation> get heroIdleRight => SpriteAnimation.load(
        'dinosaur_.png',
        SpriteAnimationData.sequenced(
          amount: 4,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 0),
        ),
      );

  Future<SpriteAnimation> get heroRunRight => SpriteAnimation.load(
        'dinosaur_.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(32, 160),
        ),
      );

  Future<SpriteAnimation> get heroRunLeft => SpriteAnimation.load(
        'dinosaur_left.png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(128, 160),
        ),
      );

  Future<SpriteAnimation> get attackRight => SpriteAnimation.load(
        'machete_ [iron].png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 32),
        ),
      );

  Future<SpriteAnimation> get attackTop => SpriteAnimation.load(
        'machete_ [iron].png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 32),
        ),
      );

  Future<SpriteAnimation> get attackBottom => SpriteAnimation.load(
        'machete_ [iron].png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 32),
        ),
      );

  Future<SpriteAnimation> get attackLeft => SpriteAnimation.load(
        'machete_left [iron].png',
        SpriteAnimationData.sequenced(
          amount: 3,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 32),
        ),
      );

  Future<SpriteAnimation> get attackFly => SpriteAnimation.load(
        'faquinha.png',
        SpriteAnimationData.sequenced(
          amount: 1,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 0),
        ),
      );

  Future<SpriteAnimation> get attackShurikens => SpriteAnimation.load(
        'shuriken.png',
        SpriteAnimationData.sequenced(
          amount: 2,
          stepTime: 0.1,
          textureSize: Vector2(32, 32),
          texturePosition: Vector2(0, 0),
        ),
      );
}
