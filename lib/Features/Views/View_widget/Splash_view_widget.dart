import 'package:bookly/Features/Home/Presentation/View/Home.dart';
import 'package:bookly/core/Util/Assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> SlidingAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    SlidingAnimation =
        Tween<Offset>(begin: const Offset(0, 4), end: Offset.zero)
            .animate(animationController);
    animationController.forward();

    Future.delayed(Duration(seconds: 2), () {
      //  Get.to(()=>HomePage(),transition: Transition.fade,duration:Duration(milliseconds: 250) );
      GoRouter.of(context).push('/Home');
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Assets.Logo),
        AnimatedBuilder(
          animation: SlidingAnimation,
          builder: (context, _) {
            return SlideTransition(
                position: SlidingAnimation,
                child: const Text(
                  'Read Free Books',
                  textAlign: TextAlign.center,
                ));
          },
        )
      ],
    );
  }
}
