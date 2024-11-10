import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherlyapp/Features/BottomSheet/views/widgets/air_details_widget.dart';
import 'package:weatherlyapp/Features/BottomSheet/views/widgets/air_quality_design.dart';

import 'custom_text.dart';
import 'package:weatherlyapp/Features/Home/Presentation/manager/cubit/home_view_cubit.dart';
import 'package:weatherlyapp/core/utils/app_styles.dart';

class CustomSingelScrollView extends StatelessWidget {
  const CustomSingelScrollView({
    super.key,
    required this.scrollController,
  });
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewCubit, HomeViewState>(
      builder: (context, state) {
        if (state is HomeViewLoading) {
          return const Center(child: CircularProgressIndicator.adaptive());
        } else if (state is HomeViewSuccess) {
          // Assuming state.weatherData contains the API data
          final weatherModel = state.weathermodel;

          // Dynamically build bottomSheetWidgets with API data
          final List<Widget> bottomSheetWidgets = [
            AirDetailsWidget(
              title: "AIR QUALITY",
              text: "${weatherModel.current.airQuality.gbDefraIndex} - ${weatherModel.current.airQuality.usEpaIndex}",
              widget: const AirQualityDesign(),
            ),
            AirDetailsWidget(
              title: "SUNRISE",
              text: "SUNRISE TIME",
              widget: CustomText(text: "SUNSET ${weatherModel.forecast.forecastDay[0].astro.sunset}"),
            ),
            AirDetailsWidget(
              title: "WIND",
              text: "${weatherModel.current.windKph} KM/H",
              widget: CustomText(text: "Direction: ${weatherModel.current.windDir}"),
            ),
            AirDetailsWidget(
              title: "RAINFALL",
              text: "${weatherModel.forecast.forecastDay[0].day.rainfall} MM in Last Hour",
              widget: CustomText(text: "${weatherModel.forecast.forecastDay[0].day.dailyRain} Expected"),
            ),
            AirDetailsWidget(
              title: "FEELSLIKE",
              text: "${weatherModel.current.feelsLike}°C",
              widget: const CustomText(text: ""),
            ),
            AirDetailsWidget(
              title: "HUMIDITY",
              text: "${weatherModel.current.humidity}%",
              widget: CustomText(text: "Dew Point: ${weatherModel.current.dewPoint}"),
            ),
            AirDetailsWidget(
              title: "VISIBILITY",
              text: "${weatherModel.current.visKm} KM",
              widget: const CustomText(text: ""),
            ),
            AirDetailsWidget(
              title: "UV INDEX",
              text: "${weatherModel.current.uv}",
              widget: AirQualityDesign(),
            ),
          ];

          return SingleChildScrollView(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
                  child: Column(
                    children: [
                      Container(
                        height: 5,
                        width: 48,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.4),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      const SizedBox(height: 12),
                       const Text(
                        'Weather Details',
                        style: AppStyles.styleSemiBold15,
                      ),
                      const SizedBox(height: 8),
                      Divider(
                        thickness: 1.5,
                        color: Colors.white.withOpacity(0.4),
                        indent: 16,
                        endIndent: 16,
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemCount: bottomSheetWidgets.length,
                  itemBuilder: (context, index) {
                    return bottomSheetWidgets[index];
                  },
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                ),
              ],
            ),
          );
        } else {
          return const Center(child: Text("No data loaded!"));
        }
      },
    );
  }
}
