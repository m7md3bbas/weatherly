import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weatherlyapp/Features/BottomSheet/views/widgets/custom_item.dart';
import 'package:weatherlyapp/Features/Home/Presentation/manager/cubit/home_view_cubit.dart';
import 'package:weatherlyapp/core/utils/app_images.dart';
import 'package:weatherlyapp/core/utils/app_styles.dart';

class HourlyDetails extends StatelessWidget {
  const HourlyDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewCubit, HomeViewState>(
      builder: (context, state) {
        if (state is HomeViewLoading) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        } else if (state is HomeViewSuccess) {
          List icons = [
            Assets.imagesMooncloudfastwind,
            Assets.imagesMooncloudmidrain,
            Assets.imagesSuncloudangledrain,
            Assets.imagesSuncloudmidrain,
            Assets.imagesMooncloudfastwind,
            Assets.imagesMooncloudmidrain,
            Assets.imagesSuncloudangledrain,
            Assets.imagesSuncloudmidrain,
            Assets.imagesMooncloudfastwind,
            Assets.imagesMooncloudmidrain,
            Assets.imagesSuncloudangledrain,
            Assets.imagesSuncloudmidrain,
            Assets.imagesMooncloudfastwind,
            Assets.imagesMooncloudmidrain,
            Assets.imagesSuncloudangledrain,
            Assets.imagesSuncloudmidrain,
            Assets.imagesMooncloudfastwind,
            Assets.imagesMooncloudmidrain,
            Assets.imagesSuncloudangledrain,
            Assets.imagesSuncloudmidrain,
            Assets.imagesMooncloudfastwind,
            Assets.imagesMooncloudmidrain,
            Assets.imagesSuncloudangledrain,
            Assets.imagesSuncloudmidrain,
          ];
          // Access the hourly data from the first forecast day
          final hourlyData = state.weathermodel.forecast.forecastDay[0].hour;

          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 16),
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
                        'Hourly Forecast',
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
                // Horizontal scroll with hourly data
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: hourlyData.length,
                    itemBuilder: (context, index) {
                      final hour = hourlyData[index];
                      final icon = icons[index];
                      return FittedBox(
                        child: CustomItem(
                          icon: icon,
                          time: hour.time.split(" ")[1],
                          temp: hour.temp,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: Text("Failed to load data"),
          );
        }
      },
    );
  }
}
