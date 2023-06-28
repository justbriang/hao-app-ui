import 'package:flutter/material.dart';
import 'package:hao_app/routing/app_routes.dart';
import 'package:hao_app/routing/app_state_manager.dart';
import 'package:provider/provider.dart';

class BlurAnim {
  final Animation<double> verticalPos;
  final Animation<double> horizontalPos;

  BlurAnim({required this.verticalPos, required this.horizontalPos});
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static MaterialPage page() {
    return MaterialPage(
      name: AppRoutes.splashScreenPath,
      key: ValueKey(AppRoutes.splashScreenPath),
      child: const SplashScreen(),
    );
  }

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    Provider.of<AppStateManager>(context, listen: false).initializeApp();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void play() {
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final topBlurAnim = BlurAnim(
      verticalPos: Tween(
        begin: 0.0,
        end: size.height / 4 * -1,
      ).animate(_controller),
      horizontalPos: Tween(
        begin: 0.0 - size.width * .25,
        end: size.width / 4,
      ).animate(_controller),
    );
    final bottomBlurAnim = BlurAnim(
        verticalPos: Tween(
          begin: 0.0,
          end: size.height / 4 * -1,
        ).animate(_controller),
        horizontalPos: Tween(
          begin: 0.0 - size.width * .25,
          end: size.width / 4,
        ).animate(_controller));

    _scaleAnim = Tween(begin: 2.0, end: 1.0).animate(_controller);
    _controller.forward();

    return AnimatedBuilder(
        animation: _controller,
        builder: (context, child) => Scaffold(
              body: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Positioned(
                    top: topBlurAnim.verticalPos.value,
                    left: topBlurAnim.horizontalPos.value,
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.center,
                            colors: [
                              Color(0xFF8e44ad),
                              Color(0xFFee9ca7),
                              Color(0xFFffdde1)
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(14))),
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width * 1.5,
                    ),
                  ),
                  Positioned(
                    bottom: bottomBlurAnim.verticalPos.value,
                    right: bottomBlurAnim.horizontalPos.value,
                    child: Container(
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.center,
                            end: Alignment.center,
                            colors: [
                              Color(0xFF8e44ad),
                              Color(0xFFee9ca7),
                              Color(0xFFffdde1)
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(14))),
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.width * 1.5,
                    ),
                  ),
                  Center(
                    child: Opacity(
                      opacity: _controller.value,
                      child: Container(
                        width: 301 / _scaleAnim.value,
                        height: 120 / _scaleAnim.value,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/logo/home.png'),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ));
  }
}
