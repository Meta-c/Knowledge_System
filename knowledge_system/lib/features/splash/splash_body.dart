import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:knowledge_system/core/utils/size_config.dart';
import 'package:knowledge_system/core/widgets/space_widget.dart';
import 'package:knowledge_system/features/input%20page/input_view.dart';

class SplashBody extends StatefulWidget {
  const SplashBody({super.key});

  @override
  State<SplashBody> createState() => _SplashBodyState();
}

class _SplashBodyState extends State<SplashBody>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;

  Animation<double>? fadingAnimation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 600));

    fadingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);

    animationController?.repeat(reverse: true);

    goToNextView();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Center(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/medical-icon-png-6576.png'),
            const VerticalSpace(
              value: 2,
            ),
            FadeTransition(
              opacity: fadingAnimation!,
              child: Text(
                'Diseas Detection',
                style: TextStyle(
                  fontSize: SizeConfig.defaultSize! * 4,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xffffffff),
                  fontFamily: 'Poppins',
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void goToNextView() {
    Future.delayed(const Duration(seconds: 3), () {
      // ignore: prefer_const_constructors
      Get.to(() => InputView(), transition: Transition.fade);
    });
  }
}
