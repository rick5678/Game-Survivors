import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jogo/screens/tela_principal.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Dino Survivors',
      home: MainMenu(),
    );
  }
}

class MainMenu extends StatelessWidget {
  const MainMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/nuvens.gif'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              GestureDetector(
                child: Stack(
                  children: [
                    Text(
                      'Novo Jogo',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Novo Jogo',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ],
                ),
                onTap: () {
                  Get.to(TelaPrincipal());
                },
              ),
              Stack(
                children: [
                  Text(
                    'Continuar',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Continuar',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              Stack(
                children: [
                  Text(
                    'Opções',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Opções',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
              Stack(
                children: [
                  Text(
                    'Créditos',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    'Créditos',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
