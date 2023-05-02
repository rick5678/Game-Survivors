import 'package:bonfire/bonfire.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jogo/characters/player_sprite_sheet.dart';
import 'package:jogo/enemys/bandit.dart';
import 'package:jogo/enemys/bandit_sprite_sheet.dart';

PlayerSpriteSheet player = PlayerSpriteSheet();
BanditSpriteSheet bandit = BanditSpriteSheet();

class Dinossaur extends SimplePlayer with ObjectCollision, TapGesture {
  double valor = 0;
  double angulo = 0;
  int nivel = 1;
  static int level = 1;
  double experience = 0;
  List<double> speedArma = [200];
  List<String> armas = ['faquinha'];
  List<int> armasNvl = [1];
  List<int> quantityArma = [1];
  List<int> ataquesPorSegundo = [1000];
  bool canAtack = true;

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
    if (canAtack) {
      bool attackFaquinha =
          checkInterval('attackFaquinha', ataquesPorSegundo[0], dt);
      if (attackFaquinha) {
        execRangeAttack();
      }
      bool attackShuriken = checkInterval('attackShuriken', 5000, dt);
      if (attackShuriken) {
        attackShurikens();
      }
    }

    super.update(dt);
  }

  @override
  void render(Canvas canvas) {
    drawDefaultLifeBar(canvas);

    super.render(canvas);
  }

  void execRangeAttack() {
    Vector2 centerOffset = Vector2.zero();
    switch (lastDirection) {
      case Direction.left:
        centerOffset = Vector2(10, 0);
        angulo = 600;
        break;
      case Direction.right:
        centerOffset = Vector2(-10, 0);
        angulo = 0;
        break;
      case Direction.up:
        centerOffset = Vector2(0, 10);
        angulo = 300;
        break;
      case Direction.down:
        centerOffset = Vector2(0, -5);
        angulo = 900;
        break;
      case Direction.upLeft:
        centerOffset = Vector2(5, 10);
        angulo = 450;
        break;
      case Direction.upRight:
        centerOffset = Vector2(-5, 10);
        angulo = 150;
        break;
      case Direction.downLeft:
        centerOffset = Vector2(5, 0);
        angulo = 750;
        break;
      case Direction.downRight:
        centerOffset = Vector2(-5, -5);
        angulo = 1050;
        break;
    }
    simpleAttackRangeByAngle(
      attackFrom: AttackFromEnum.PLAYER_OR_ALLY,
      animation: player.attackFly,
      angle: angulo,
      size: Vector2(16, 16),
      damage: 100,
      speed: speedArma[0],
      collision: CollisionConfig(
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(width / 3, width / 3),
            align: Vector2(width * 0.1, 1),
          ),
        ],
      ),
      marginFromOrigin: 20,
      centerOffset: centerOffset,
    );
  }

  void attackShurikens() {
    simpleAttackRangeByAngle(
      attackFrom: AttackFromEnum.PLAYER_OR_ALLY,
      animation: player.attackShurikens,
      angle: angulo + 30,
      size: Vector2(32, 32),
      damage: 250,
      speed: speedArma[0],
      collision: CollisionConfig(
        enable: false,
        collisions: [
          CollisionArea.rectangle(
            size: Vector2(16, 16),
            align: Vector2(width * 0.1, 1),
          ),
        ],
      ),
      marginFromOrigin: 20,
      centerOffset: Vector2(0, 0),
    );
  }

  @override
  void onTap() {
    TalkDialog.show(
      context,
      [
        Say(
          text: [
            const TextSpan(
                text: "Vi um urubu sai correndo p@u no c# de quem tá lendo!"),
          ],
          person: SizedBox(
            height: 100,
            width: 100,
            child: player.heroIdleRight.asWidget(),
          ),
        ),
        Say(
            text: [
              const TextSpan(text: "Qual é teu problema?"),
            ],
            person: SizedBox(
              height: 100,
              width: 100,
              child: bandit.idleLeft.asWidget(),
            ),
            personSayDirection: PersonSayDirection.RIGHT),
      ],
    );
  }

  @override
  void die() {
    removeFromParent();
    super.die();
  }

  void pegarExperiencia(double experiencia) {
    experience = experience + experiencia;

    if (experience >= 100) {
      nivel++;
      level++;
      experience = experience - 100;

      if (armasNvl[0] < 8) {
        Bandit.canMove = false;
        canAtack = false;
        Get.defaultDialog(
          title: '',
          barrierDismissible: false,
          backgroundColor: const Color.fromARGB(0, 102, 78, 61),
          content: SizedBox(
            width: 400,
            height: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () => {
                    evoluirArma(0),
                    Get.back(),
                    Bandit.canMove = true,
                    canAtack = true,
                    if (experience > 100) {pegarExperiencia(0)}
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 131, 96, 72),
                      border: Border.all(
                        color: const Color.fromARGB(255, 59, 39, 21),
                        width: 5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: player.attackFly.asWidget(),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "${armas[0]} - nvl.${armasNvl[0] + 1}",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              "velocidade de ataque +",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    evoluirArma(0),
                    Get.back(),
                    Bandit.canMove = true,
                    canAtack = true,
                    if (experience > 100) {pegarExperiencia(0)}
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 131, 96, 72),
                      border: Border.all(
                        color: const Color.fromARGB(255, 59, 39, 21),
                        width: 5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: player.attackFly.asWidget(),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "${armas[0]} - nvl.${armasNvl[0] + 1}",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              "velocidade de ataque +",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => {
                    evoluirArma(0),
                    Get.back(),
                    Bandit.canMove = true,
                    canAtack = true,
                    if (experience > 100) {pegarExperiencia(0)}
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 131, 96, 72),
                      border: Border.all(
                        color: const Color.fromARGB(255, 59, 39, 21),
                        width: 5,
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              child: player.attackFly.asWidget(),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "${armas[0]} - nvl.${armasNvl[0] + 1}",
                              style: const TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const Text(
                              "velocidade de ataque +",
                              style: TextStyle(
                                fontSize: 15,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }
    }
  }

  void evoluirArma(int arma) {
    if (armasNvl[arma] < 8) {
      speedArma[arma] = speedArma[arma] * 1.15;
      armasNvl[arma] = armasNvl[arma] + 1;
    }

    if (armasNvl[arma] == 3) {
      quantityArma[arma] = quantityArma[arma] + 1;
      ataquesPorSegundo[arma] = 500;
    }

    if (armasNvl[arma] == 5) {
      quantityArma[arma] = quantityArma[arma] + 1;
      ataquesPorSegundo[arma] = 300;
    }

    if (armasNvl[arma] == 8) {
      ataquesPorSegundo[arma] = 100;
    }
  }
}
