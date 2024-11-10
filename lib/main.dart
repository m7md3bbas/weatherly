import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:weatherlyapp/core/utils/Data/repos/home_repo_imp.dart';
import 'package:weatherlyapp/Features/Home/Presentation/manager/cubit/home_view_cubit.dart';
import 'package:weatherlyapp/Features/Home/Presentation/views/home_view.dart';
import 'package:weatherlyapp/Features/Onboarding/views/onboarding_view.dart';
import 'package:weatherlyapp/core/utils/api/bloc_boserver.dart';
import 'package:weatherlyapp/core/utils/api/dio_consumer.dart';
import 'package:weatherlyapp/core/utils/home_local_data_source.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper().init();
  WidgetsFlutterBinding.ensureInitialized();
  await DioConsumer.init();
  Bloc.observer = MyBlocObserver(); 
  runApp(const Weatherly());
}

class Weatherly extends StatelessWidget {
  const Weatherly({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => HomeViewCubit(
            userRepository: UserRepository(apiKey:"dfb1df7d1a2b4086bbf211057231307" ,api: DioConsumer()),
          ),
        ),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        home: const OnboardingView(),
        getPages: [
          GetPage(name: "/", page: () => const OnboardingView()),
          GetPage(name: "/home", page: () => const HomeView()),
        ],
      ),
    );
  }
}
