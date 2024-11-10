import 'package:flutter/widgets.dart';
import 'package:getx_scaffold/common/index.dart';
import 'package:weatherlyapp/Features/Home/Presentation/views/home_view.dart';
import 'package:weatherlyapp/Features/Onboarding/views/widgets/custom_button.dart';
import 'package:weatherlyapp/core/utils/app_images.dart';
import 'package:weatherlyapp/core/utils/app_styles.dart';
import 'package:weatherlyapp/Features/Home/Presentation/views/widgets/background_app.dart';


class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundApp(
      image: Assets.imagesBackground,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(Assets.imagesMooncloudfastwind),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Discover the Weather in Your City",
                textAlign: TextAlign.center,
                style: AppStyles.styleBold34,
              ),
              const SizedBox(
                height: 100,
              ),
              CustomButton(
                textButton: "Get Started",
                onTap: () => Get.to(()=>const HomeView(),
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.bounceInOut),
              )
            ],
          ),
        ),
      ),
    );
  }
}
