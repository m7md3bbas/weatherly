import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherlyapp/Features/BottomSheet/views/bottom_sheet.dart';
import 'package:weatherlyapp/Features/Home/Presentation/manager/cubit/home_view_cubit.dart';
import 'package:weatherlyapp/Features/Home/Presentation/views/widgets/background_app.dart';
import 'package:weatherlyapp/Features/Search/views/search_page.dart';
import 'package:weatherlyapp/Features/hourlyForecast/hourly_bottomSheet.dart';
import 'package:weatherlyapp/core/utils/app_images.dart';
import 'package:weatherlyapp/core/utils/app_styles.dart'; // Import the SearchPage

class HomeView extends StatefulWidget {
  const HomeView({super.key,});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    // Fetch weather details for a default location
    context.read<HomeViewCubit>().fetchWeatherDetails(location: "Cairo");
  }

  // Method to open the search page
  Future<void> _openSearchPage() async {
    final cityName = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (context) => const SearchPage()),
    );

    // If the city name is not null, fetch the weather data for the city
    if (cityName != null && cityName.isNotEmpty) {
      context.read<HomeViewCubit>().fetchWeatherDetails(location: cityName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer<HomeViewCubit, HomeViewState>(
        listener: (context, state) {
          if (state is HomeViewfailure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.errorMessage)),
            );
          }
        },
        builder: (context, state) {
          return state is HomeViewLoading
              ? const Center(child: CircularProgressIndicator())
              : state is HomeViewSuccess
                  ? BackgroundApp(
                      image: Assets.imagesBackground,
                      child: Stack(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Color(0xff555556f)
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 12),
                                  Text(
                                    state.weathermodel.location.name,
                                    style: AppStyles.styleRegular34.copyWith(
                                        color: const Color(0xffffffff)),
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    state.weathermodel.current.temp.toString(),
                                    style: AppStyles.styleBold28.copyWith(
                                        color: const Color(0xffffffff)),
                                  ),
                                  const SizedBox(height: 12),
                                  
                                  const SizedBox(height: 12),
                                  Text(
                                    state.weathermodel.current.condition.text,
                                    style: AppStyles.styleRegular20.copyWith(
                                        color: const Color(0xffEBEBF5)),
                                  ),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Max: ${state.weathermodel.forecast.forecastDay[0].day.maxTemp}",
                                        style: AppStyles.styleRegular20
                                            .copyWith(
                                                color: const Color(0xffffffff)),
                                      ),
                                      const SizedBox(width: 10),
                                      Text(
                                        "Min: ${state.weathermodel.forecast.forecastDay[0].day.minTemp}",
                                        style: AppStyles.styleRegular20
                                            .copyWith(
                                                color: const Color(0xffffffff)),
                                      ),
                                    ],
                                  ),
                                  Image.asset(
                                    Assets.imagesHouse,
                                    fit: BoxFit.fitWidth,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 0,
                              right: 0,
                              child: Container(
                                  height: 100,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image:
                                              AssetImage(Assets.imagesTabBar),
                                          fit: BoxFit.fitWidth)),
                                  width: MediaQuery.sizeOf(context).width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      GestureDetector(
                                          onTap: _openSearchPage,
                                          child:
                                              Image.asset(Assets.imagesHover)),
                                      GestureDetector(
                                          onTap: () {
                                            hourlybottomSheet(context);
                                          },
                                          child:
                                              Image.asset(Assets.imagesFront)),
                                      GestureDetector(
                                          onTap: () {
                                            bottomSheet(context);
                                          },
                                          child: const Icon(
                                            Icons.menu,
                                            color: Color(0xffffffff),
                                            size: 30,
                                          )),
                                      const SizedBox(
                                        width: 5,
                                      )
                                    ],
                                  ))),
                        ],
                      ),
                    )
                  : const Center(
                      child: Text(
                        "Failed to load data. Please try again.",
                        style: TextStyle(color: Colors.black),
                      ),
                    );
        },
      ),
    );
  }
}
